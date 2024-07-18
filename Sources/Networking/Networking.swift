//  File.swift
//  Created by Joao Paulo Carneiro on 11/07/24.
//

import Foundation


public struct NetworkService {
    public static func fetch(request: URLRequest, completion: @escaping (Result<Data, any Error>) -> ()) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let data = data else {
                return completion(.failure(URLError(.badServerResponse)))
            }
            
            return completion(.success(data))
        }
        .resume()
    }
    
    public static func fetch<T>(request: URLRequest, completion: @escaping (Result<[T], any Error>) -> ()) where T : Decodable, T : Encodable {
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
    
    public static func fetch<T>(request: URLRequest, completion: @escaping (Result<T, any Error>) -> ()) where T : Decodable, T : Encodable {
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
    
    
    public static func fetch<T: Decodable & Encodable >(request: URLRequest) async -> Result<T, any Error>  {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
//            print(String(decoding: data, as: UTF8.self))
            
            let decoder = JSONDecoder()
            
            let decodedData = try decoder.decode(T.self, from: data)
            return .success(decodedData)
            
        } catch let error as DecodingError {
            print(error)
            return .failure(URLError(.downloadDecodingFailedToComplete))
            
        } catch let error {
            print(error)
            return .failure(error)
        }
    }
}
