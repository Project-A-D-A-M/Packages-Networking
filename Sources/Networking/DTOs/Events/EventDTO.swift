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
    public var date: Double
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
        self.date = date.timeIntervalSince1970
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
