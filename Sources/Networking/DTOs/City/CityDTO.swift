//
//  File.swift
//
//
//  Created by Joao Paulo Carneiro on 25/07/24.
//

import Foundation

public final class CityDTO: Codable {
    public var id: String?
    public var prefetchId: UUID
    public var name: String
    public var country: String
    public var state: String?
    public var imagesIds: [String]
    public var latitude: Double
    public var longitude: Double
    public var description: String?
    public var attractionsIds: [String]
    
    public init(id: String? = nil, prefetchId: UUID, name: String, country: String, state: String? = nil, imagesIds: [String], latitude: Double, longitude: Double, description: String? = nil, attractionsIds: [String]) {
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
    }
}
