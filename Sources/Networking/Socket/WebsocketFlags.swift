//
//  Untitled.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 16/10/24.
//
import Foundation


public enum WebsocketFlags: String, Codable {
    case update
    case isEditing
    case requestEdit
    case unavailable
    case finishedEditing
    case startbeat
    case heartbeat
    case endbeat
}
