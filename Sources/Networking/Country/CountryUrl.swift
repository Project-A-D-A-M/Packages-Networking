//
//  File.swift
//  
//
//  Created by Joao Paulo Carneiro on 15/07/24.
//

import Foundation

public enum CountryUrlBuilder {
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
    
    case country(country: String)
    
    public var request: URLRequest? {
        switch self {
            case .country(let country):
            let urlString: String = "\(Self.baseURL)/country"
            let url = URL(string: urlString)!
            var request = URLRequest(url: url)
            request.httpMethod = operation.GET.rawValue
            request.allHTTPHeaderFields = Self.header
            do {
                let body = try JSONEncoder().encode(CountryRequest(country: country))
                request.httpBody = body
                return request
            } catch let error {
                print(error.localizedDescription)
                return nil
            }
        }
    }
}
