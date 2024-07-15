//
//  File 2.swift
//  
//
//  Created by Joao Paulo Carneiro on 15/07/24.
//

import Foundation

public enum FlightsearchUrlBuilder {
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
    
    case flight(origin: String, destination: String)
    
    public var request: URLRequest? {
        switch self {
            case .flight(let origin, let destination):
            let urlString: String = "\(Self.baseURL)/flight"
            let url = URL(string: urlString)!
            var request = URLRequest(url: url)
            request.httpMethod = operation.GET.rawValue
            request.allHTTPHeaderFields = Self.header
            do {
                let body = try JSONEncoder().encode(FlightSearchRequest(origin: origin, destination: destination))
                request.httpBody = body
                return request
            } catch let error {
                print(error.localizedDescription)
                return nil
            }
        }
    }
}
