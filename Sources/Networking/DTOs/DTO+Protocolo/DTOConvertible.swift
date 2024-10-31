//
//  DTOConvertible.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 31/10/24.
//
import Foundation

public protocol DTOConvertible {
    associatedtype ObjectDTO: Codable
    init(_ dto: ObjectDTO)
    func toDTO() -> ObjectDTO?
}
