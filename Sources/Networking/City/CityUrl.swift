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
    
    case details(city: String, country: String, latitude: Double, longitude: Double, state: String?)
    
    case prefetch(country: String?, region: String?)
    
    public var request: URLRequest? {
        switch self {
        case .details(let city, let country, let latitude, let longitude, let state):
            let urlString = "\(Self.baseURL)/city/details?city=\(city)&country=\(country)&latitude=\(latitude)&longitude=\(longitude)\(state != nil ? "&\(state!)" : "")"
            
            guard let url = URL(string: urlString) else { return nil }
            
            var request = URLRequest(url: url)
            request.httpMethod = HttpOperations.GET.rawValue
            request.allHTTPHeaderFields = Self.header
            
            return request
            
        case .prefetch(let country, let region):
            var urlString = "\(Self.baseURL)/city/prefetch"
            if let country {
                urlString += "?country=\(country)"
                if let region {
                    urlString += "&region=\(region)"
                }
            } else if let region {
                urlString += "?region=\(region)"
            }
            
            guard let url = URL(string: urlString) else { return nil }
            var request =  URLRequest(url: url)
            request.httpMethod = HttpOperations.GET.rawValue
            request.allHTTPHeaderFields = Self.header
            
            return request
        }
    }
}
