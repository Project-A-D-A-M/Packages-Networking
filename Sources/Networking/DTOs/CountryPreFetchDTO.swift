//
//  File.swift
//  
//
//  Created by Gabriel Medeiros Martins on 08/08/24.
//

import Foundation

public final class CountryPreFetchDTO: Codable {
    public var id: String
    public var name: String
    public var capital: String
    public var region: String
    
    public init(id: String, name: String, capital: String, region: String) {
        self.id = id
        self.name = name
        self.capital = capital
        self.region = region
    }
}
