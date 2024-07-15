//
//  File.swift
//
//
//  Created by Joao Paulo Carneiro on 11/07/24.
//

import Foundation

public struct CityRequest: Codable {
    var id: UUID?
    var city: String
    var country: String
    var month: Int?
}
