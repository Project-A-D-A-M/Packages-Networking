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
        guard T.self == messageType.objectType else {
            throw WebSocketCodableError.payloadTypeMissmatch
        }
        
        guard let payload: String = CoderService.encode(data: payloadObject) else {
            throw WebSocketCodableError.failedToEncode
        }
        
        self.payload = payload
    }
    
    public func getPayload<T: Codable>(type: T.Type = T.self) throws -> T {
        guard type == self.messageType.objectType else {
            throw WebSocketCodableError.payloadTypeMissmatch
        }
        guard let payload = CoderService.decode(data: self.payload, type: type) else {
            throw WebSocketCodableError.failedToDecode
        }
        
        return payload
    }
    
    public func sendAsString() -> String? {
        return CoderService.encode(data: self)
    }
    
    public func sendAsData() -> Data? {
        return CoderService.encode(data: self)
    }
}
