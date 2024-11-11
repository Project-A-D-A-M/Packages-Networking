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
    
    case getEventByTripId(id: UUID)
    
    case saveEvent(event: EventDTO)
    
    case updateEvent(event: EventDTO)
    
    case deleteEvent(id: UUID, userID: String)
    
    public var request: URLRequest? {
        var request: URLRequest? = nil
        
        switch self {
            case .getEventById(let id):
                let endpoint: String = "/event/\(id)"
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .GET)
            
            case .getEventByTripId(let id):
                let endpoint: String = "/event/trip/\(id)"
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .GET)
            
            case .saveEvent(let event):
                let endpoint: String = "/event/save"
                guard let data = try? JSONEncoder().encode(event) else { return nil }
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .POST, body: data)
                
            case .updateEvent(let event):
                let endpoint: String = "/event/update"
            
                guard let data = try? JSONEncoder().encode(event) else { return nil }
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .PUT, body: data)
                
            case .deleteEvent(let id, let userID):
                let endpoint: String = "/event/\(id)/\(userID)"
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .DELETE)
        }
        
        return request
    }
}
