//
//  File.swift
//  
//
//  Created by Joao Paulo Carneiro on 18/07/24.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
// MARK: Nop operating yet
public enum AttractionUrlBuilder {
    static private let header: [String: String] = [
        "content-type": "application/json"
    ]
    
    static private var baseURL: String { BASE_URL }
    
    // TODO: Mudar types para um enum, podendo ser o do google, ou um personalizado... q respeite as caracteristicas do google (?)
    case atCoordinate(latitude: Double, longitude: Double, cityName: String?, countryName: String?/*, types: [String]?*/)
    
    case addCounter(id: String)
    
    case removeCounter(id: String)
    
    public var request: URLRequest? {
        switch self {
        case .atCoordinate(let latitude, let longitude, let city, let country/*, let types*/):
            var urlString = "\(Self.baseURL)/attraction/coordinates?latitude=\(latitude)&longitude=\(longitude)"
            if let city {
                urlString += "&city=\(city)"
            }
            
            if let country {
                urlString += "&country=\(country)"
            }
//            if let types {
//                for type in types {
//                    urlString += "&types[]=\(type)"
//                }
//            }
            
            guard let url = URL(string: urlString) else { return nil }
            
            var request = URLRequest(url: url)
            request.httpMethod = HttpOperations.GET.rawValue
            request.allHTTPHeaderFields = Self.header
            
            return request
        
        case .addCounter(let id):
            let urlString = "\(Self.baseURL)/attraction/counter/\(id)"
            
            guard let url = URL(string: urlString) else { return nil }
            
            var request = URLRequest(url: url)
            request.httpMethod = HttpOperations.POST.rawValue
            request.allHTTPHeaderFields = Self.header
            
            return request
            
        case .removeCounter(let id):
            let urlString = "\(Self.baseURL)/attraction/counter/\(id)"
            
            guard let url = URL(string: urlString) else { return nil }
            
            var request = URLRequest(url: url)
            request.httpMethod = HttpOperations.PATCH.rawValue
            request.allHTTPHeaderFields = Self.header
            
            return request
        }
    }
}
