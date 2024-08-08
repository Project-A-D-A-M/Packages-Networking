//
//  File.swift
//
//
//  Created by Joao Paulo Carneiro on 06/08/24.
//

import Foundation

public final class BotCityDTO: Codable {
    public var name: String
    public var state: String?
    public var country: String
    public var latitude: Double
    public var longitude: Double
    public var images: [String]
    public var description: String?
    
    public init(name: String, state: String? = nil, country: String, latitude: Double, longitude: Double, images: [String], description: String? = nil) {
        self.name = name
        self.state = state
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        self.images = images
        self.description = description
    }
}
