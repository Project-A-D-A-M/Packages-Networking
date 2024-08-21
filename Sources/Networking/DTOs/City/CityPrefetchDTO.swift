//
//  File.swift
//
//
//  Created by Joao Paulo Carneiro on 02/08/24.
//

import Foundation

public final class CityPrefetchDTO: NSObject, Codable {
    public var id: UUID
    public var name: String
    public var state: String
    public var country: String
    public var latitude: Double
    public var longitude: Double
    public var imagesIds: [String]
    
    public init(id: UUID, name: String, state: String, country: String, latitude: Double, longitude: Double, imagesIds: [String]) {
        self.id = id
        self.name = name
        self.state = state
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        self.imagesIds = imagesIds
    }
}
