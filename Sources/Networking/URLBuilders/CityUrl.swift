//
//  File.swift
//  
//
//  Created by Joao Paulo Carneiro on 15/07/24.
//

import Foundation

public enum CityUrlBuilder {
    static private let header: [String: String] = [
        "content-type": "application/json"
    ]
    
    static private var baseURL: String { BASE_URL }
    
    case details(id: Int)
    
    case prefetch(country: String?, region: String?, page: Int = 0)
    
    public var request: URLRequest? {
        switch self {
        case .details(let id):
            let urlString = "\(Self.baseURL)/city/\(id)"
            
            guard let url = URL(string: urlString) else { return nil }
            
            var request = URLRequest(url: url)
            request.httpMethod = HttpOperations.GET.rawValue
            request.allHTTPHeaderFields = Self.header
            
            return request
            
        case .prefetch(let country, let region, let page):
            var urlString = "\(Self.baseURL)/city/prefetch"
            if let country {
                urlString += "?country=\(country)"
                if let region {
                    urlString += "&region=\(region)"
                }
            } else if let region {
                urlString += "?region=\(region)"
            }
            
            urlString += "&page=\(page)"
            
            guard let url = URL(string: urlString) else { return nil }
            var request =  URLRequest(url: url)
            request.httpMethod = HttpOperations.GET.rawValue
            request.allHTTPHeaderFields = Self.header
            
            return request
        }
    }
}
