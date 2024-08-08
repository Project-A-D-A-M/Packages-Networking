//
//  File.swift
//  
//
//  Created by Joao Paulo Carneiro on 07/08/24.
//

import Foundation
public enum ImageURLBuilder {
    static private let header: [String: String] = [
        "content-type": "application/json"
    ]
    
    static private var baseURL: String { BASE_URL }
    
    case byId(id: String)
    
    public var request: URLRequest? {
        switch self {
            case .byId(let id):
                var urlString = "\(Self.baseURL)/api/images?id=\(id)"
                
                guard let url = URL(string:  urlString) else { return nil}
            
                var request = URLRequest(url: url)
                request.httpMethod = HttpOperations.GET.rawValue
                request.allHTTPHeaderFields =  Self.header
            
                return request
        }
    }
    
}
