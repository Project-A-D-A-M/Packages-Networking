//
//  File 2.swift
//  
//
//  Created by Joao Paulo Carneiro on 15/07/24.
//

import Foundation


public struct HotelSearchRequest: Codable {
    var id: UUID?
    var city: String
    var country: String
    var month: Int?
}
