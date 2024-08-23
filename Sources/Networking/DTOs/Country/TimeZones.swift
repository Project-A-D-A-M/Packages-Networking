//
//  File.swift
//  
//
//  Created by Gabriel Medeiros Martins on 08/08/24.
//

import Foundation
public final class TimeZones: Codable {
    public var zoneName: String
    public var gmtOffset: Int
    public var gmtOffsetName: String
    public var abbreviation: String
    public var tzName: String
    
    public init(zoneName: String, gmtOffset: Int, gmtOffsetName: String, abbreviation: String, tzName: String) {
        self.zoneName = zoneName
        self.gmtOffset = gmtOffset
        self.gmtOffsetName = gmtOffsetName
        self.abbreviation = abbreviation
        self.tzName = tzName
    }
}
