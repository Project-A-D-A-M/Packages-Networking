//
//  File.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 18/10/24.
//

import Foundation

public final class WSCoder {
    
    public static func decode(data: String) -> WebsocketComunication? {
        guard let _data = data.data(using: .utf8) else { return nil }
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(WebsocketComunication.self, from: _data)
        } catch let error {
            print(error)
            return nil
        }
    }
    
    public static func encode(data: WebsocketComunication) -> String? {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(data)
            return String(data: jsonData, encoding: String.Encoding.utf8)
        } catch let error {
            print(error)
            return nil
        }
    }
}
