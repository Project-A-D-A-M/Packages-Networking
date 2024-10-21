//
//  WebsocketHeader.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 18/10/24.
//
import Foundation

public final class WebsocketHeader: Codable {
    public let messageID: UUID
    public let messageType: WebsocketMessageType
    private var payload: String
    
    public init(messageID: UUID, messageType: WebsocketMessageType) {
        self.messageID = messageID
        self.messageType = messageType
        self.payload = ""
    }
    
    public func setPayload<T: Codable>(payloadObject: T) throws {
        guard type(of: payloadObject) == messageType.objectType else {
            throw NSError(domain: "Type mismatch: expected \(messageType.objectType), but got \(type(of: payloadObject))", code: 0)
        }
        
        guard let payload: String = CoderService.encode(data: payloadObject) else {
            throw NSError(domain: "Failed to encode object", code: 0)
        }
        
        self.payload = payload
    }
    
    public func getPayload() -> Codable? {
        return CoderService.decode(data: self.payload, type: self.messageType.objectType)
    }
    
    public func sendAsString() -> String? {
        return CoderService.encode(data: self)
    }
    
    public func sendAsData() -> Data? {
        return CoderService.encode(data: self)
    }
}
