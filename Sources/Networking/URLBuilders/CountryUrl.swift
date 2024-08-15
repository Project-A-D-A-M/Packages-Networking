//
//  File.swift
//  
//
//  Created by Joao Paulo Carneiro on 15/07/24.
//

import Foundation

public enum CountryUrlBuilder {
    static private let header: [String: String] = [
        "content-type": "application/json"
    ]
    
    static private var baseURL: String { BASE_URL }
    
    case prefetch(region: String, country: String?)
    
    case details(id: UUID)
    
    public var request: URLRequest? {
        switch self {
            case .prefetch(let region, let country):
                var urlString = "\(Self.baseURL)/country/prefetch?region=\(region)"
                
                if let country {
                    urlString += "&country=\(country)"
                }
            
                guard let url = URL(string: urlString) else { return nil }
                
                var request = URLRequest(url: url)
                request.httpMethod = HttpOperations.GET.rawValue
                request.allHTTPHeaderFields = Self.header
                
                return request
            
            case .details(let id):
                var urlString = "\(Self.baseURL)/country/\(id)"
            
                guard let url = URL(string: urlString) else { return nil }
                
                var request = URLRequest(url: url)
                request.httpMethod = HttpOperations.GET.rawValue
                request.allHTTPHeaderFields = Self.header
            
                return request
        }
    }
}
