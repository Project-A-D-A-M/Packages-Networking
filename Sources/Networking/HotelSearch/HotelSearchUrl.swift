//
//  File.swift
//  
//
//  Created by Joao Paulo Carneiro on 15/07/24.
//

import Foundation

public enum HotelsearchUrlBuilder {
    static private let header: [String: String] = [
        "content-type": "application/json"
    ]
    
    static private var baseURL: String { BASE_URL }
    
    case hotel(city: String, country: String)
    
    public var request: URLRequest? {
        switch self {
            case .hotel(let city, let country):
                let urlString: String = "\(Self.baseURL)/hotel/\(city)/\(country)"
            
                guard let url = URL(string: urlString) else { return nil }
                
                var request = URLRequest(url: url)
                request.httpMethod = HttpOperations.GET.rawValue
                request.allHTTPHeaderFields = Self.header
                
                return request
        }
    }
}
