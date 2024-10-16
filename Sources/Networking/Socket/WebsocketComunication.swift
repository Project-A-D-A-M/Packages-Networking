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
    public var operationFlag: WebsocketFlags
    public var tripID: UUID
    public var responsibleID: String
    
    public init(communicationID: UUID, objectID: UUID, objectType: WebsocketObjectTypes, operationFlag: WebsocketFlags, tripID: UUID, responsibleID: String) {
        self.communicationID = communicationID
        self.objectID = objectID
        self.objectType = objectType
        self.operationFlag = operationFlag
        self.tripID = tripID
        self.responsibleID = responsibleID
    }
}
