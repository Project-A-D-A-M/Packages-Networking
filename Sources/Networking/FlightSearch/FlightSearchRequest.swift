//
//  File.swift
//  
//
//  Created by Joao Paulo Carneiro on 15/07/24.
//

import Foundation

public struct FlightSearchRequest: Codable {
    var id: UUID?
    var origin: String
    var destination: String
    var month: Int?
}
