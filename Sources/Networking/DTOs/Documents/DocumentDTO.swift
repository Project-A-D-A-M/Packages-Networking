//
//  DocumentDTO.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 22/10/24.
//
import Foundation
import SwiftUI

final public class DocumentDTO: Codable {
    public var id: UUID
    public var ownerId: String
    public var name: String
    public var tag: Types
    public var fileType: FileType
    public var expirationDate: Date
    
    public var documentData: Data
    
    public var shareInfoDTO: ShareInfoDTO
    
    public enum Types: String, CaseIterable, Codable {
        case VISA, Passport, Tickets, Other
    }
    
    public enum FileType: String, CaseIterable, Codable {
        case pdf, photo, unknow
    }
    
    public init(id: UUID = UUID(), ownerId: String, name: String, tag: Types, fileType: FileType, expirationDate: Date, documentData: Data, shareInfoDTO: ShareInfoDTO) {
        self.id = id
        self.ownerId = ownerId
        self.name = name
        self.tag = tag
        self.fileType = fileType
        self.expirationDate = expirationDate
        self.documentData = documentData
        self.shareInfoDTO = shareInfoDTO
    }
}
