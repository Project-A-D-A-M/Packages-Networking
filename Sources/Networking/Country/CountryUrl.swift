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
    
    static private var baseURL: String { BASE_URL }
    
    case country(country: String?)
    
    public var request: URLRequest? {
        switch self {
            case .country(let country):
            var urlString: String = "\(Self.baseURL)/country"
            if let country = country {
                urlString += "/\(country)"
            }
            let url = URL(string: urlString)!
            var request = URLRequest(url: url)
            request.httpMethod = operation.GET.rawValue
            request.allHTTPHeaderFields = Self.header
            return request
        }
    }
}
