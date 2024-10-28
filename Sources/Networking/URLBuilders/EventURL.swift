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

public enum EventURLBuilder: InjectURLRequestBuilder {
    case getEventById(id: UUID)
    
    case saveEvent(event: EventDTO)
    
    case updateEvent(event: EventDTO)
    
    case deleteEvent(id: UUID)
    
    public var request: URLRequest? {
        var request: URLRequest? = nil
        
        switch self {
            case .getProfileById(let id):
                var endpoint = "/api/event/\(id)"
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .GET)
            
            case .saveProfile(let event):
                var endpoint = "/api/event/save"
                guard let data = try? JSONEncoder().encode(event) else { return nil }
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .POST, body: data)
                
            case .updateProfile(let event):
                var endpoint = "/api/event/update"
            
                guard let data = try? JSONEncoder().encode(event) else { return nil }
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .PUT, body: data)
                
            case .deleteProfile(let id):
                var endpoint = "/api/event/\(id)"
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .DELETE)
        }
        
        return request
    }
}
