//
//  WebSocketCodableError.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 21/10/24.
//

import Foundation

public enum WebSocketCodableError: Error, LocalizedError {
    case payloadTypeMissmatch
    case failedToEncode
    case failedToDecode
    
    public var description: String {
        switch self {
        case .payloadTypeMissmatch:
            return NSLocalizedString("Type recived does not match with  ", comment: "typeMissmatch")
        case .failedToEncode:
            return NSLocalizedString("Failed to Encode objetc", comment: "failedToEncode")
        case .failedToDecode:
            return NSLocalizedString("Failed to Decode objetc", comment: "failedToDecode")
        }
    }
}
