//
//  File.swift
//  
//
//  Created by Gabriel Medeiros Martins on 08/08/24.
//

import Foundation

public final class CountryPreFetchDTO: Codable {
    public var id: UUID
    public var name: String
    public var capital: String
    public var region: String
    
    public init(id: UUID, name: String, capital: String, region: String) {
        self.id = id
        self.name = name
        self.capital = capital
        self.region = region
    }
}

//extension CountryPreFetchDTO: Hashable {
//    public static func == (lhs: Networking.CountryPreFetchDTO, rhs: Networking.CountryPreFetchDTO) -> Bool {
//        lhs.id == rhs.id
//    }
//    
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(self)
//    }
//}
