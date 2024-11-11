//
//  TripURL.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 28/10/24.
//


import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public enum TripURLBuilder: InjectURLRequestBuilder {
    case getTripById(id: UUID)
    
    case saveTrip(trip: TripDTO)
    
    case updateTrip(trip: TripDTO)
    
    case deleteTrip(id: UUID, userID: String)
    
    public var request: URLRequest? {
        var request: URLRequest? = nil
        
        switch self {
            case .getTripById(let id):
                var endpoint = "/trip/\(id)"
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .GET)
            
            case .saveTrip(let tripDTO):
                var endpoint = "/trip/save"
                guard let data = try? JSONEncoder().encode(tripDTO) else { return nil }
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .POST, body: data)
                
            case .updateTrip(let tripDTO):
                var endpoint = "/trip/update"
                guard let data = try? JSONEncoder().encode(tripDTO) else { return nil }
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .PUT, body: data)
                
            case .deleteTrip(let id, let userID):
                var urlString = "/trip/\(id)/\(userID)"
                request = requestWithHeaders.buildRequest(endPoint: urlString, method: .DELETE)
        }
        
        return request
    }
}
