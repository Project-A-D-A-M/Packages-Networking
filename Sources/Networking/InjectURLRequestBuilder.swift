//
//  URLRequestBuilderProtocol.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 28/10/24.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public protocol InjectURLRequestBuilder { }

public extension InjectURLRequestBuilder {
    var requestWithHeaders: RequestBuilder {
        return RequestBuilder()
    }
}

public final class RequestBuilder {
    private var baseURL: String {
        return BASE_URL
    }

    private let header: [String : String] = [
        "content-type": "application/json"
    ]
    
    func buildRequest(endPoint: String, method: HttpOperations, body: Data? = nil) -> URLRequest? {
        let path = "\(baseURL)" + endPoint
        guard let url = URL(string: endPoint) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = header
        request.httpBody = body
        
        return request
    }
}
