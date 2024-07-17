//
//  File.swift
//  
//
//  Created by Gabriel Medeiros Martins on 17/07/24.
//

import Foundation

var useLocalURL: Bool = false
var BASE_URL: String {
    useLocalURL ? "127.0.0.1:8080" : "https://adam.carneijp.uk/api"
}
