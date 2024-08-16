//
//  File.swift
//
//
//  Created by Joao Paulo Carneiro on 25/07/24.
//

import Foundation

public final class CityDTO: NSObject, Codable {
    public var id: String?
    public var prefetchId: UUID
    public var name: String
    public var country: String
    public var state: String?
    public var imagesIds: [String]
    public var latitude: Double
    public var longitude: Double
    public var cityDescription: String?
    public var attractionsIds: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case prefetchId
        case name
        case country
        case state
        case imagesIds
        case latitude
        case longitude
        case cityDescription = "description"
        case attractionsIds
    }
    
    public init(id: String? = nil, prefetchId: UUID, name: String, country: String, state: String? = nil, imagesIds: [String], latitude: Double, longitude: Double, description: String? = nil, attractionsIds: [String]) {
        self.id = id
        self.prefetchId = prefetchId
        self.name = name
        self.country = country
        self.state = state
        self.imagesIds = imagesIds
        self.latitude = latitude
        self.longitude = longitude
        self.cityDescription = description
        self.attractionsIds = attractionsIds
    }
}
