//
//  File.swift
//  
//
//  Created by Gabriel Medeiros Martins on 09/08/24.
//

import Foundation

public final class AttractionDTO: NSObject, Codable {
    public var id: String
    public var name: String
    public var address: String
    public var categories: [String]
    public var workingHours: WorkingHours
    public var imagesIds: [String]
    public var latitude: Double
    public var longitude: Double
    public var attractionDescription: String?
    public var price: Price
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case address
        case categories
        case workingHours
        case imagesIds
        case latitude
        case longitude
        case attractionDescription = "description"
        case price
    }
    
    
    public init(id: String, name: String, address: String, categories: [String], workingHours: WorkingHours, imagesIds: [String] = [], latitude: Double, longitude: Double, description: String?, price: Price) {
        self.id = id
        self.name = name
        self.address = address
        self.categories = categories
        self.workingHours = workingHours
        self.imagesIds = imagesIds
        self.latitude = latitude
        self.longitude = longitude
        self.attractionDescription = description
        self.price = price
    }
}
