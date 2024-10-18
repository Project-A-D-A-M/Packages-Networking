//
//  Untitled.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 16/10/24.
//
import Foundation


public enum WebsocketEvents: String, Codable {
    case update
    case isEditing
    case requestEdit
    case unavailable
    case finishedEditing
    case error
    case requestAllUpdateStatus
}
