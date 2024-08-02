//
//  File 2.swift
//  
//
//  Created by Joao Paulo Carneiro on 15/07/24.
//

import Foundation

public enum FlightsearchUrlBuilder {
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
    
    case flight(origin: String, destination: String)
    
    public var request: URLRequest? {
        switch self {
            case .flight(let origin, let destination):
            let urlString: String = "\(Self.baseURL)/flight/\(origin)/\(destination)"
            let url = URL(string: urlString)!
            var request = URLRequest(url: url)
            request.httpMethod = operation.GET.rawValue
            request.allHTTPHeaderFields = Self.header
            return request
        }
    }
}
