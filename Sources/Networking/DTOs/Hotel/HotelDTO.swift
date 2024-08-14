//
//  File.swift
//  
//
//  Created by Joao Paulo Carneiro on 09/08/24.
//

import Foundation
public final class HotelDTO: Codable {
    public var id: String?
    public var city: String
    public var country: String
    public var month: Int
    public var year: Int
    public var hotels: [HotelStar]
    
    public init(id: String? = nil, city: String, country: String, hotels: [HotelStar], month: Int, year: Int) {
        self.id = id
        self.city = city
        self.country = country
        self.hotels = hotels
        self.month = month
        self.year = year
    }

}

