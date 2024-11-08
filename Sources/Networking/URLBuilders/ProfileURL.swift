//
//  Untitled.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 28/10/24.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public enum ProfileURLBuilder: InjectURLRequestBuilder {
    case getProfileById(id: String)
    
    case saveProfile(profile: ProfileDTO)
    
    case updateProfile(profile: ProfileDTO)
    
    case deleteProfile(id: String)
    
    public var request: URLRequest? {
        var request: URLRequest? = nil
        
        switch self {
            case .getProfileById(let id):
                var endpoint = "/profile/\(id)"
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .GET)
            
            case .saveProfile(let profile):
                var endpoint = "/profile/save"
                guard let data = try? JSONEncoder().encode(profile) else { return nil }
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .POST, body: data)
                
            case .updateProfile(let profile):
                var endpoint = "/profile/update"
            
                guard let data = try? JSONEncoder().encode(profile) else { return nil }
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .PUT, body: data)
                
            case .deleteProfile(let id):
                var endpoint = "/profile/\(id)"
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .DELETE)
        }
        
        return request
    }
}
