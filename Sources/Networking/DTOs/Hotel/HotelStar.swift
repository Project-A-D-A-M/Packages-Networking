//
//  File.swift
//  
//
//  Created by Joao Paulo Carneiro on 09/08/24.
//

import Foundation
public final class HotelStar: NSObject, Codable {
    public var stars: Int
    public var price: Int
    public var lowMedium: Int
    public var highMedium: Int
    public var currency: String
    
    public init(stars: Int, price: Int, lowMedium: Int, highMedium: Int, currency: String) {
        self.stars = stars
        self.price = price
        self.lowMedium = lowMedium
        self.highMedium = highMedium
        self.currency = currency
    }
    
}
