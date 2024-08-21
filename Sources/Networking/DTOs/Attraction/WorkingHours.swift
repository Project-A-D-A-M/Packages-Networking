//
//  File.swift
//  
//
//  Created by Gabriel Medeiros Martins on 09/08/24.
//

import Foundation

public final class WorkingHours: NSObject, Codable {
    public class Hours: NSObject, Codable {
        public var opening: Date
        public var closing: Date
        
        public init(opening: Date, closing: Date) {
            self.opening = opening
            self.closing = closing
        }
    }
    
    public var monday: Hours?
    public var tuesday: Hours?
    public var wednesday: Hours?
    public var thursday: Hours?
    public var friday: Hours?
    public var saturday: Hours?
    public var sunday: Hours?
    
    public init(monday: Hours? = nil, tuesday: Hours? = nil, wednesday: Hours? = nil, thursday: Hours? = nil, friday: Hours? = nil, saturday: Hours? = nil, sunday: Hours? = nil) {
        self.monday = monday
        self.tuesday = tuesday
        self.wednesday = wednesday
        self.thursday = thursday
        self.friday = friday
        self.saturday = saturday
        self.sunday = sunday
    }
}
