//
//  LinkDTO.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 07/11/24.
//

import Foundation

final public class LinkDTO: Codable {
    public var id: UUID
    public var text: String
    
    public init(id: UUID, text: String) {
        self.id = id
        self.text = text
    }
}
