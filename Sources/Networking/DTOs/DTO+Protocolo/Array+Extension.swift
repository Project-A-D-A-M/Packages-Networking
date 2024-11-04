//
//  Array+Extension.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 31/10/24.
//
import Foundation

public extension Array where Element: DTOConvertible {
    func toDTOs() -> [Element.ObjectDTO] {
        return self.compactMap { $0.toDTO() }
    }
    
    func fromDTOS() -> [Element] {
        return self.compactMap { .init($0) }
    }
}
