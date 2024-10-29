//
//  DestinationDTO.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 22/10/24.
//
import Foundation
import SwiftUI

public class DestinationDTO: Identifiable, Codable {
    public var id: UUID
    public var city: String
    public var state: String
    public var country: String
    public var startDate: Date
    public var endDate: Date
    
    public required init(id: UUID = .init(), city: String, state: String, country: String, startDate: Date, endDate: Date) {
        self.id = id
        self.city = city
        self.state = state
        self.country = country
        self.startDate = startDate
        self.endDate = endDate
    }
    
    public var formatted: String {
        "\(city), \(state) - \(country)"
    }
}
