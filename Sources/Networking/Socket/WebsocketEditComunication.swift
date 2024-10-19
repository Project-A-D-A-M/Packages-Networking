//
//  WebsocketComunication.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 16/10/24.
//
import Foundation


public final class WebsocketEditComunication: Codable {
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
}
