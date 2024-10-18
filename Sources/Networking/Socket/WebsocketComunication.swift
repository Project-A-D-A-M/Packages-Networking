//
//  WebsocketComunication.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 16/10/24.
//
import Foundation


public final class WebsocketComunication: Codable {
    public var communicationID: UUID
    public var objectID: UUID
    public var objectType: WebsocketObjectTypes
    public var operationEvent: WebsocketEvents
    public var tripID: UUID
    public var responsibleID: String
    
    public init(communicationID: UUID, objectID: UUID, objectType: WebsocketObjectTypes, operationFlag: WebsocketEvents, tripID: UUID, responsibleID: String) {
        self.communicationID = communicationID
        self.objectID = objectID
        self.objectType = objectType
        self.operationEvent = operationFlag
        self.tripID = tripID
        self.responsibleID = responsibleID
    }
}
