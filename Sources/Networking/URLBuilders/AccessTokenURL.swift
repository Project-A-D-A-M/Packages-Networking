//
//  AccessTokenURL.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 07/11/24.
//

import Foundation

enum AccessTokenURLBuilder: InjectURLRequestBuilder {
    case create(tripID: String)
    case validate(userID: String, token: String)
    
    public var request: URLRequest? {
        var request: URLRequest? = nil
        switch self {
            
            case .create(let tripID):
                var endpoint = "/access/generate/\(tripID)"
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .GET)
            
            case .validate(let userID, let token):
                var endpoint = "/access/validate"
                let accessTokenDTO = AccessTokenDTO(tripID: nil, userID: userID, token: token, expires: nil)
                guard let body = try? JSONEncoder().encode(accessTokenDTO) else { return nil }
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .POST, body: body)
        }
        
        return request
    }
}
