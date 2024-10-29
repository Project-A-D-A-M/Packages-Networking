//
//  File.swift
//  
//
//  Created by Joao Paulo Carneiro on 07/08/24.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

enum HttpOperations: String {
    case GET
    case POST
    case PUT
    case DELETE
    case PATCH
}
