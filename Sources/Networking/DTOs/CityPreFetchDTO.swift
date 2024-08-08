//
//  File.swift
//
//
//  Created by Joao Paulo Carneiro on 02/08/24.
//

import Foundation

final class CityPreFetchDTO: Codable {
    var id: Int
    var name: String
    var state: String
    var country: String
    var latitude: Double
    var longitude: Double
    
    init(id: Int, name: String, state: String, country: String, latitude: Double, longitude: Double) {
        self.id = id
        self.name = name
        self.state = state
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
    }
}
