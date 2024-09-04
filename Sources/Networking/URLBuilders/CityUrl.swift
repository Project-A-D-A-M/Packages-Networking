//
//  File.swift
//  
//
//  Created by Joao Paulo Carneiro on 15/07/24.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
public enum CityUrlBuilder {
    static private let header: [String: String] = [
        "content-type": "application/json"
    ]
    
    static private var baseURL: String { BASE_URL }
    
    case details(id: UUID)
    
    case prefetch(country: String?, region: String?, page: Int)
    
    case addCounter(id: String)
    
    case removeCounter(id: String)
    
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
            
        case .addCounter(let id):
            let urlString = "\(Self.baseURL)/city/counter/\(id)"
            
            guard let url = URL(string: urlString) else { return nil }
            
            var request = URLRequest(url: url)
            request.httpMethod = HttpOperations.POST.rawValue
            request.allHTTPHeaderFields = Self.header
            
            return request
            
        case .removeCounter(let id):
            let urlString = "\(Self.baseURL)/city/counter/\(id)"
            
            guard let url = URL(string: urlString) else { return nil }
            
            var request = URLRequest(url: url)
            request.httpMethod = HttpOperations.PATCH.rawValue
            request.allHTTPHeaderFields = Self.header
            
            return request
        }
    }
}
