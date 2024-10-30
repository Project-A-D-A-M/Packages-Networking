//
//  ShareInfo.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 22/10/24.
//

import Foundation

public final class ShareInfo: Codable {
    public var id: UUID
    public var isShared: Bool
    public var lastChanged: Date
    public var ownerID: String
    public var sharedWithIDs: [String]
    public var isActive: Bool
    
    public init(id: UUID = UUID(), isShared: Bool = false, lastChanged: Date = .now, ownerID: String = "", sharedWithIDs: [String]  = [], isActive: Bool  = true) {
        self.id = id
        self.isShared = isShared
        self.lastChanged = lastChanged
        self.ownerID = ownerID
        self.sharedWithIDs = sharedWithIDs
        self.isActive = isActive
    }
}
