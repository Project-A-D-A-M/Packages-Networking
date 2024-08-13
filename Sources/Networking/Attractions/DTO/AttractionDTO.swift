//
//  File.swift
//  
//
//  Created by Gabriel Medeiros Martins on 09/08/24.
//

import Foundation

public final class AttractionDTO: Codable {
    public var id: String
    public var name: String
    public var address: String
    public var categories: [String]
    public var workingHours: WorkingHours
    public var imagesIds: [String]
    
    public init(id: String, name: String, address: String, categories: [String], workingHours: WorkingHours, imagesIds: [String] = []) {
        self.id = id
        self.name = name
        self.address = address
        self.categories = categories
        self.workingHours = workingHours
        self.imagesIds = imagesIds
    }
}
