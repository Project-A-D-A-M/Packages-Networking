//  File.swift
//  Created by Joao Paulo Carneiro on 11/07/24.
//

import Foundation
import UIKit

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

class DataCacheable: NSObject {
    let data: Data
    
    init(data: Data) {
        self.data = data
    }
}

public struct NetworkService {
    public static func fetchData(request: URLRequest, shouldCache: Bool = false, completion: @escaping (Result<Data, any Error>) -> ()) {
        if shouldCache {
            if let objectCached = CacheManager.shared.getObject(forkey: request) as? DataCacheable {
                return  completion(.success(objectCached.data))
            }
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let data = data else {
                return completion(.failure(URLError(.badServerResponse)))
            }
            
//            if shouldCache {
            let dataCached = DataCacheable(data: data)
            CacheManager.shared.setObject(forkey: request, object: dataCached)
//            }
            
            return completion(.success(data))
        }
        .resume()
    }
    
    public static func fetchMany<T>(request: URLRequest, shouldCache: Bool = false, completion: @escaping (Result<[T], any Error>) -> ()) where T : Decodable, T : Encodable {
        // Busca da cache se mandado ter cache
        if shouldCache {
            if let objectCached = CacheManager.shared.getObject(forkey: request) as? ListCacheable<T> {
                if !objectCached.items.isEmpty {
                    return completion(.success(objectCached.items))
                }
            }
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                return completion(.failure(error))
            }

            guard let data = data else {
                return completion(.failure(URLError(.badServerResponse)))
            }
            
            do {
//                print(String(decoding: data, as: UTF8.self))
                
                let parsedData = (try JSONSerialization.jsonObject(with: data)) as? [String : Any]
                
                guard let arrays = parsedData?.values.compactMap({ value in (value as? NSArray) }) else {
                    return completion(.failure(URLError(.downloadDecodingFailedToComplete)))
                }
                
                for array in arrays {
                    
                    let dicts = array.compactMap { element in
                        element as? [String : Any]
                    }
                    let newData = try JSONSerialization.data(withJSONObject: dicts, options: [.sortedKeys, .withoutEscapingSlashes])
                    
                    let decoder = JSONDecoder()
                    
                    let result = try decoder.decode([T].self, from: newData)
                    
                    // Salva o resultado na cache caso mandado ter cache
//                    if shouldCache {
                    let listCached = ListCacheable<T>(items: result)
                    if !listCached.items.isEmpty {
                        CacheManager.shared.setObject(forkey: request, object: listCached)
                    }
//                    }
                    
                    return completion(.success(result))
                }
                
                if arrays.isEmpty {
                    completion(.failure(URLError(.downloadDecodingFailedToComplete)))
                }
                
            } catch _ as DecodingError {
                return completion(.failure(URLError(.downloadDecodingFailedToComplete)))
            } catch {
                return completion(.failure(URLError(.unknown)))
            }
            
        }
        .resume()
    }
    
    public static func fetchOne<T>(request: URLRequest, shouldCache: Bool = false, completion: @escaping (Result<T, any Error>) -> ()) where T : Decodable, T : Encodable {
        // Busca da cache se mandado ter cache
        if shouldCache {
            if let objectCached = CacheManager.shared.getObject(forkey: request) as? T {
              return  completion(.success(objectCached))
            }
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let data = data else {
                return completion(.failure(URLError(.badServerResponse)))
            }

//            print(String(decoding: data, as: UTF8.self))
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                
                // Salva o resultado na cache caso mandado ter cache
//                if shouldCache {
                if let cacheObjc = decodedData as? NSObject {
                    CacheManager.shared.setObject(forkey: request, object: cacheObjc)
                } else {
                    print("Error on parse object type: \(T.self) to NSObject on \(#function)")
                }
//                }
                completion(.success(decodedData))
                
            } catch let error as DecodingError {
                print(error)
                return completion(.failure(URLError(.downloadDecodingFailedToComplete)))
            } catch let error {
                print(error)
                return completion(.failure(URLError(.unknown)))
            }
        }
        .resume()
    }
    
    public static func fetchOne<T: Decodable & Encodable >(request: URLRequest, shouldCache: Bool = false) async -> Result<T, any Error>  {
        // Busca da cache se mandado ter cache
        if shouldCache {
            if let objectCached = CacheManager.shared.getObject(forkey: request) as? T {
              return  .success(objectCached)
            }
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let data = data as? T {
                return .success(data)
            }
//            print(String(decoding: data, as: UTF8.self))
            
            let decoder = JSONDecoder()
            
            let decodedData = try decoder.decode(T.self, from: data)
            
            // Salva o resultado na cache caso mandado ter cache
//            if shouldCache {
            if let cacheObjc = decodedData as? NSObject {
                CacheManager.shared.setObject(forkey: request, object: cacheObjc)
            } else {
                print("Error on parse object type: \(T.self) to NSObject on \(#function)")
            }
//            }
            
            return .success(decodedData)
            
        } catch let error as DecodingError {
            print(error)
            return .failure(URLError(.downloadDecodingFailedToComplete))
            
        } catch let error {
            print(error)
            return .failure(error)
        }
    }
    
    public static func fetchMany<T: Decodable & Encodable>(request: URLRequest, shouldCache: Bool = false) async -> Result<[T], any Error> {
        // Busca da cache se mandado ter cache
        if shouldCache {
            if let objectCached = CacheManager.shared.getObject(forkey: request) as? ListCacheable<T> {
                if !objectCached.items.isEmpty {
                    return .success(objectCached.items)
                }
            }
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            guard let result = try? JSONDecoder().decode([T].self, from: data) else {
                return .failure(URLError(.cannotDecodeRawData))
            }
            
            // Salva o resultado na cache caso mandado ter cache
//            if shouldCache {
            let listCached = ListCacheable(items: result)
            if !listCached.items.isEmpty {
                CacheManager.shared.setObject(forkey: request, object: listCached)
            }
//            }
            
            return .success(result)
        } catch let error as DecodingError {
            print(error)
            return .failure(URLError(.downloadDecodingFailedMidStream))
        } catch let error {
            print(error)
            return .failure(error)
        }
    }
}


@available(iOS, deprecated: 15.0, message: "AsyncCompatibilityKit is only useful when targeting iOS versions earlier than 15")
public extension URLSession {
    /// Start a data task with a URL using async/await.
    /// - parameter url: The URL to send a request to.
    /// - returns: A tuple containing the binary `Data` that was downloaded,
    ///   as well as a `URLResponse` representing the server's response.
    /// - throws: Any error encountered while performing the data task.
    func data(from url: URL) async throws -> (Data, URLResponse) {
        try await data(for: URLRequest(url: url))
    }

    /// Start a data task with a `URLRequest` using async/await.
    /// - parameter request: The `URLRequest` that the data task should perform.
    /// - returns: A tuple containing the binary `Data` that was downloaded,
    ///   as well as a `URLResponse` representing the server's response.
    /// - throws: Any error encountered while performing the data task.
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        var dataTask: URLSessionDataTask?
        let onCancel = { dataTask?.cancel() }

        return try await withTaskCancellationHandler(
            handler: {
                onCancel()
            },
            operation: {
                try await withCheckedThrowingContinuation { continuation in
                    dataTask = self.dataTask(with: request) { data, response, error in
                        guard let data = data, let response = response else {
                            let error = error ?? URLError(.badServerResponse)
                            return continuation.resume(throwing: error)
                        }

                        continuation.resume(returning: (data, response))
                    }

                    dataTask?.resume()
                }
            }
        )
    }
}
