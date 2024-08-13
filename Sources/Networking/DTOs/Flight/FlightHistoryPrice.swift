//
//  File.swift
//  
//
//  Created by Joao Paulo Carneiro on 09/08/24.
//

import Foundation
public final class FlightHistoryPrice: Codable {
    public var daySpan: Int
    public var price: Int
    public var currency: String
    
    public init(daySpan: Int, price: Int, currency: String) {
        self.daySpan = daySpan
        self.price = price
        self.currency = currency
    }
}
