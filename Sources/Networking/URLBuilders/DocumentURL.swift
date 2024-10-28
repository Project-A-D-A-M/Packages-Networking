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
    
    case getDocymentByUserId(id: String)
    
    case saveDocument(document: DocumentDTO)
    
    case updateDocument(document: DocumentDTO)
    
    case deleteDocument(id: UUID)
    
    public var request: URLRequest? {
        var request: URLRequest? = nil
        
        switch self {
            case .getDocumentById(let id):
                var endpoint = "/api/document/doc/\(id)"
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .GET)
            
            case .getDocymentByUserId(let id):
                var endpoint = "/api/document/owner/\(id)"
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .GET)
            
            case .saveDocument(let document):
                var endpoint = "/api/document/save"
                guard let data = try? JSONEncoder().encode(document) else { return nil }
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .POST, body: data)
                
            case .updateDocument(let document):
                var endpoint = "/api/document/update"
                guard let data = try? JSONEncoder().encode(document) else { return nil }
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .PUT, body: data)
                
            case .deleteDocument(let id):
                var endpoint = "/api/document/\(id)"
                request = requestWithHeaders.buildRequest(endPoint: endpoint, method: .DELETE)
        }
        
        return request
    }
}
