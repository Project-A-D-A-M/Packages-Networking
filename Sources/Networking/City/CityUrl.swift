//
//  File.swift
//  
//
//  Created by Joao Paulo Carneiro on 15/07/24.
//

import Foundation

public enum CityUrlBuilder {
    enum operation: String {
        case GET
        case POST
        case PUT
        case DELETE
    }
    
    static private let header: [String: String] = [
        "content-type": "application/json"
    ]
    
    static private var baseURL: String { BASE_URL }
    
    case city(city: String, country: String)
    
    case photo(urlString: String)
    
    public var request: URLRequest? {
        switch self {
            case .city(let city, let country):
                let urlString: String = "\(Self.baseURL)/city/\(city)/\(country)"
                guard let url = URL(string: urlString) else { return nil }
                var request = URLRequest(url: url)
                request.httpMethod = operation.GET.rawValue
                request.allHTTPHeaderFields = Self.header
                return request
            
            case .photo(let photoUrl):
                guard let url = URL(string: photoUrl) else { return nil }
                var request = URLRequest(url: url)
                request.httpMethod = operation.GET.rawValue
                return request
        }
    }
}
