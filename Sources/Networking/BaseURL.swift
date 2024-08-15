//
//  File.swift
//  
//
//  Created by Gabriel Medeiros Martins on 17/07/24.
//

import Foundation

public enum Enviroment: String, Codable {
    case production
    case homologation
    case dev
}

public var enviroment: Enviroment = .homologation
var BASE_URL: String {
    switch enviroment {
        case .production:
            return "https://adam.carneijp.uk/api"
        case .homologation:
            return "https://adamhmg.carneijp.uk/api"
        case .dev:
            return "127.0.0.1:8080"
    }
}
