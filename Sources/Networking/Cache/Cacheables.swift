//
//  File.swift
//  
//
//  Created by Joao Paulo Carneiro on 22/08/24.
//

import Foundation

class ListCacheable<T: Codable>: NSObject {
    var items: [T]
    
    init(items: [T]) {
        self.items = items
    }
}

class AnyCacheable<T: Codable>: NSObject {
    let item: T
    
    init(_ t: T) {
        self.item = t
    }
}

class DataCacheable: NSObject {
    let data: Data
    
    init(data: Data) {
        self.data = data
    }
}
