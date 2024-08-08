//
//  File.swift
//
//
//  Created by Joao Paulo Carneiro on 10/07/24.
//

import Foundation

public enum SearchResponse: String, Codable {
    case open
    case completed
    case invalid
}

public struct SearchDTO<T: Codable>: Codable {
    public var searchAnswer: SearchResponse
    public var result: [T]
}
