//
//  TripDTO.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 22/10/24.
//
import Combine
import Foundation

final public class TripDTO: Codable {
    public enum Types: String, CaseIterable, Codable {
        case Work, Solo, Family, Other
    }
    
    public struct Dates: Codable, Hashable {
        public var arrival: Double
        public var departure: Double
        
        public init(arrival: Date, departure: Date) {
            self.arrival = arrival.timeIntervalSince1970
            self.departure = departure.timeIntervalSince1970
        }
    }
    
    public var id: UUID
    public var name: String
    public var destinations: [DestinationDTO]
    public var type: Types
    public var dates: Dates
    public var documents: [UUID]
    public var events: [UUID]
    public var shareInfoDTO: ShareInfoDTO
    
    public required init(id: UUID = UUID(), name: String, destinations: [DestinationDTO], type: Types, dates: Dates, documents: [UUID], events: [UUID], shareInfoDTO: ShareInfoDTO) {
        self.id = id
        self.name = name
        self.destinations = destinations
        self.type = type
        self.dates = dates
        self.documents = documents
        self.events = events
        self.shareInfoDTO = shareInfoDTO
    }
}
