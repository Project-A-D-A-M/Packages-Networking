//
//  EventDTO.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 22/10/24.
//

import Foundation
import SwiftUI

public class EventDTO: ObservableObject {
    public enum Types: String, Codable, CaseIterable {
        case Restaurant, Shopping, Outdoor, Art, Walk, Flight, Road, Other
    }
    
    public var id: UUID
    public var date: Date
    public var type: Types
    public var name: String
    public var address: String
    public var price: Float
    public var shareInfo: ShareInfo
    
    required public init(id: UUID = .init(), date: Date, type: Types, name: String, address: String, price: Float, shareInfo: ShareInfo) {
        self.id = id
        self.date = date
        self.type = type
        self.name = name
        self.address = address
        self.price = price
        self.shareInfo = shareInfo
    }
}
