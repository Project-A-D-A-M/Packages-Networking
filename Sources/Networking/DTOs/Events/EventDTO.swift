//
//  EventDTO.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 22/10/24.
//

import Foundation
import SwiftUI

final public class EventDTO: Codable {
    public enum Types: String, Codable, CaseIterable {
        case Restaurant, Shopping, Outdoor, Art, Walk, Flight, Road, Other
    }
    
    public var id: UUID
    public var date: Date
    public var type: Types
    public var name: String
    public var address: String
    public var documentsIDs: [UUID]
    public var documents: [DocumentDTO]
    public var checklist: [ChecklistItemDTO]
    public var description: String
    public var links: [LinkDTO]
    
    public var shareInfoDTO: ShareInfoDTO
    
    required public init(id: UUID, date: Date, type: Types, name: String, address: String, documentsIDs: [UUID], documents: [DocumentDTO], checklist: [ChecklistItemDTO], description: String, links: [LinkDTO], shareInfoDTO: ShareInfoDTO) {
        self.id = id
        self.date = date
        self.type = type
        self.name = name
        self.address = address
        self.documentsIDs = documentsIDs
        self.documents = documents
        self.checklist = checklist
        self.description = description
        self.links = links
        self.shareInfoDTO = shareInfoDTO
    }
}


final public class LinkDTO: Codable {
    public var id: UUID
    public var text: String
    
    public init(id: UUID, text: String) {
        self.id = id
        self.text = text
    }
}

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
