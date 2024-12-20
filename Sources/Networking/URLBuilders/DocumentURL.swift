//
//  DocumentURL.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 28/10/24.
//

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

public enum DocumentURLBuilder: InjectURLRequestBuilder {
    case getDocumentById(id: UUID)
    
    case getDocumentByEventId(id: UUID)
    
    case getDocumentByTripId(id: UUID)
    
    case saveDocument(document: DocumentDTO)
    
    case updateDocument(document: DocumentDTO)
    
    case deleteDocument(id: UUID, userID: String)
    
    public var request: URLRequest? {
        var request: URLRequest? = nil
        
        switch self {
            case .getDocumentById(let id):
                let endpoint: String = "/document/doc/\(id)"
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .GET)
            
            case .getDocumentByEventId(let id):
                var endpoint = "/document/event/\(id)"
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .GET)
            
            case .getDocumentByTripId(let id):
                let endpoint: String = "/document/trip/\(id)"
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .GET)
            
            case .saveDocument(let document):
                let endpoint: String = "/document/save"
                guard let data = try? JSONEncoder().encode(document) else { return nil }
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .POST, body: data)
                
            case .updateDocument(let document):
                let endpoint: String = "/document/update"
                guard let data = try? JSONEncoder().encode(document) else { return nil }
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .PUT, body: data)
                
            case .deleteDocument(let id, let userID):
            let endpoint: String = "/document/\(id)/\(userID)"
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .DELETE)
        }
        
        return request
    }
}
