//
//  WebsocketHeader.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 18/10/24.
//
import Foundation

public final class WebsocketHeader: Codable {
    let messageID: UUID
    let messageType: WebsocketMessageType
    private var payload: String
    
    public init(messageID: UUID, messageType: WebsocketMessageType) {
        self.messageID = messageID
        self.messageType = messageType
        self.payload = ""
    }
    
    public func setPayload<T: Codable>(payloadObject: T) -> Bool {
        guard type(of: payloadObject) == messageType.objectType else {
            print("Type mismatch: expected \(messageType.objectType), but got \(type(of: payloadObject))")
            return false
        }
        
        guard let payload: String = CoderService.encode(data: payloadObject) else {
            print("Failed to encode object")
            return false
        }
        
        self.payload = payload
        return true
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
