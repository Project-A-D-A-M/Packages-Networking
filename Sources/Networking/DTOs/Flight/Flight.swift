//
//  File.swift
//  
//
//  Created by Joao Paulo Carneiro on 09/08/24.
//

import Foundation
public final class Flight: Codable {
    public var id: String?
    public var origin: String
    public var destination: String
    public var month: Int
    public var historyPrices: [FlightHistoryPrice]
    public var todayPrice: Int
    public var lowMedium: Int
    public var highMedium: Int
    public var currency: String
    
    public init(id: String?, origin: String, destination: String, month: Int, historyPrices: [FlightHistoryPrice], todayPrice: Int, lowMedium: Int, highMedium: Int, currency: String) {
        self.id = id
        self.origin = origin
        self.destination = destination
        self.month = month
        self.historyPrices = historyPrices
        self.todayPrice = todayPrice
        self.lowMedium = lowMedium
        self.highMedium = highMedium
        self.currency = currency
    }
}
