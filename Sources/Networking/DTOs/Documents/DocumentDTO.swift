//
//  DocumentDTO.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 22/10/24.
//
import Foundation

final public class DocumentDTO: Codable {
    public var id: UUID
    public var ownerId: String
    public var name: String
    public var tag: Types
    public var fileType: FileType
    public var expirationDate: Double
    
    public var documentData: Data
    
    public var shareInfoDTO: ShareInfoDTO
    
    public enum Types: String, CaseIterable, Codable {
        case VISA, Passport, Tickets, Other
    }
    
    public enum FileType: String, CaseIterable, Codable {
        case pdf, photo, unknow
        
        public var fileExtension: String {
            switch self {
            case .pdf:
                return "pdf"
            case .photo:
                return "jpg"
            case .unknow:
                return ""
            }
        }
    }
    
    public init(id: UUID = UUID(), ownerId: String, name: String, tag: Types, fileType: FileType, expirationDate: Date, documentData: Data, shareInfoDTO: ShareInfoDTO) {
        self.id = id
        self.ownerId = ownerId
        self.name = name
        self.tag = tag
        self.fileType = fileType
        self.expirationDate = expirationDate.timeIntervalSince1970
        self.documentData = documentData
        self.shareInfoDTO = shareInfoDTO
    }
}
