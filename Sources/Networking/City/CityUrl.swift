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
    
    static private let baseURL: String = "https://adam.carneijp.uk/api"
    
    case city(city: String, country: String)
    
    public var request: URLRequest? {
        switch self {
            case .city(let city, let country):
            let urlString: String = "\(Self.baseURL)/city"
            let url = URL(string: urlString)!
            var request = URLRequest(url: url)
            request.httpMethod = operation.GET.rawValue
            request.allHTTPHeaderFields = Self.header
            do {
                let body = try JSONEncoder().encode(CityRequest(city: city, country: country))
                request.httpBody = body
                return request
            } catch let error {
                print(error.localizedDescription)
                return nil
            }
        }
    }
}
