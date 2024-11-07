//
//  ChecklistItemDTO.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 07/11/24.
//

import Foundation

final public class ChecklistItemDTO: Codable {
    public var id: UUID
    public var name: String
    public var checked: Bool
    public var targetAmount: Int
    
    public init(id: UUID, name: String, checked: Bool, targetAmount: Int) {
        self.id = id
        self.name = name
        self.checked = checked
        self.targetAmount = targetAmount
    }
}
