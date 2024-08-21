//
//  File 2.swift
//  
//
//  Created by Joao Paulo Carneiro on 15/07/24.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
public enum FlightsearchUrlBuilder {
    static private let header: [String: String] = [
        "content-type": "application/json"
    ]
    
    static private var baseURL: String { BASE_URL }
    
    case flight(origin: String, destination: String)
    
    public var request: URLRequest? {
        switch self {
            case .flight(let origin, let destination):
            
            let urlString: String = "\(Self.baseURL)/flight/\(origin)/\(destination)"
            
            guard let url = URL(string: urlString) else { return nil }
            
            var request = URLRequest(url: url)
            request.httpMethod = HttpOperations.GET.rawValue
            request.allHTTPHeaderFields = Self.header
            
            return request
        }
    }
}
