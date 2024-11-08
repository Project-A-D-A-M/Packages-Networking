//
//  AccessTokenDTO.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 06/11/24.
//

import Foundation

public final class AccessTokenDTO: Identifiable, Codable {
    public var tripID: UUID?
    public var userID: String?
    public var token: String?
    public var expires: Double?
    
    public init(tripID: UUID?, userID: String?, token: String?, expires: Date?) {
        self.tripID = tripID
        self.userID = userID
        self.token = token
        self.expires = expires?.timeIntervalSince1970
    }
}
