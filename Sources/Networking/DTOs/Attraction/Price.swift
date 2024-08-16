//
//  File.swift
//  
//
//  Created by Gabriel Medeiros Martins on 14/08/24.
//

import Foundation

public enum Price: Codable {
    case undefined
    case free
    case cheap
    case moderate
    case expensive
    case reallyExpensive
    
    public var description: String {
        switch self {
        case .undefined:
            return "undefined"
        case .free:
            return "free"
        case .cheap:
            return "$"
        case .moderate:
            return "$$"
        case .expensive:
            return "$$$"
        case .reallyExpensive:
            return "$$$$"
        }
    }
}
