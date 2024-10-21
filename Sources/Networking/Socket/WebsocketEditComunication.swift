//
//  WebsocketComunication.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 16/10/24.
//
import Foundation


public final class WebsocketEditComunication: Codable, Identifiable, Hashable {
    public var objectID: UUID
    public var objectType: WebsocketEditableObjectTypes
    public var tripID: UUID
    public var responsibleID: String
    
    public init( objectID: UUID, objectType: WebsocketEditableObjectTypes, tripID: UUID, responsibleID: String) {
        self.objectID = objectID
        self.objectType = objectType
        self.tripID = tripID
        self.responsibleID = responsibleID
    }
    
    public static func == (lhs: WebsocketEditComunication, rhs: WebsocketEditComunication) -> Bool {
        return lhs.responsibleID == rhs.responsibleID && lhs.tripID == lhs.tripID && lhs.objectType == rhs.objectType && lhs.objectID == rhs.objectID
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(objectID)
        hasher.combine(objectType)
        hasher.combine(tripID)
        hasher.combine(responsibleID)
    }
}
