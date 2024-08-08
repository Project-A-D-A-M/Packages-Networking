//
//  File.swift
//
//
//  Created by Joao Paulo Carneiro on 25/07/24.
//

import Foundation

final class CityDetails: Codable {
    
    var id: String?
    var prefetchId: Int
    var name: String
    var country: String
    var state: String?
    var imagesIds: [String]
    var latitude: Double
    var longitude: Double
    var description: String?
    var attractionsIds: [String]
    
    init(id: String? = nil, prefetchId: Int, name: String, country: String, state: String? = nil, imagesIds: [String], latitude: Double, longitude: Double, description: String? = nil, attractionsIds: [String]/*, attraction: [AttractionDetails] = []*/) {
        self.id = id
        self.prefetchId = prefetchId
        self.name = name
        self.country = country
        self.state = state
        self.imagesIds = imagesIds
        self.latitude = latitude
        self.longitude = longitude
        self.description = description
        self.attractionsIds = attractionsIds
//        self.attraction = attraction
    }
}
