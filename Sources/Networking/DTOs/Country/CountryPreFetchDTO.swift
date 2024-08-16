//
//  File.swift
//  
//
//  Created by Gabriel Medeiros Martins on 08/08/24.
//

import Foundation

public final class CountryPreFetchDTO: NSObject, Codable {
    public var id: UUID
    public var name: String
    public var capitalId: UUID
    public var region: String
    
    public init(id: UUID, name: String, capitalId: UUID, region: String) {
        self.id = id
        self.name = name
        self.capitalId = capitalId
        self.region = region
    }
}
