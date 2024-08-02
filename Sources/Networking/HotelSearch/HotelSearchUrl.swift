//
//  File.swift
//  
//
//  Created by Joao Paulo Carneiro on 15/07/24.
//

import Foundation

public enum HotelsearchUrlBuilder {
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
    
    case hotel(city: String, country: String)
    
    public var request: URLRequest? {
        switch self {
            case .hotel(let city, let country):
            let urlString: String = "\(Self.baseURL)/hotel/\(city)/\(country)"
            let url = URL(string: urlString)!
            var request = URLRequest(url: url)
            request.httpMethod = operation.GET.rawValue
            request.allHTTPHeaderFields = Self.header
            return request
        }
    }
}
