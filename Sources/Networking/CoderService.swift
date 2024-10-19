//
//  File.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 18/10/24.
//

import Foundation

/// Classe de serviço para encodar e decodar objetos de forma rapida.
public final class CoderService {
    /// Recebe Json Data e seu Object Type, Retornar objeto opcional no tipo passado
    public static func decode<T: Codable>(data: Data, type: T.Type) -> T? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(type, from: data)
        } catch let error {
            print(error)
            return nil
        }
    }
    
    /// Recebe Json String e seu Object Type, Retornar objeto opcional no tipo passado
    public static func decode<T: Codable>(data: String, type: T.Type) -> T? {
        guard let _data = data.data(using: .utf8) else { return nil }
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(type, from: _data)
        } catch let error {
            print(error)
            return nil
        }
    }
    
    /// Recebe o objeto, Retorna o objeto em estrutura de Json string
    public static func encode<T: Codable>(data: T) -> String? {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(data)
            return String(data: jsonData, encoding: String.Encoding.utf8)
        } catch let error {
            print(error)
            return nil
        }
    }
    
    /// Recebe o objeto, Retorna o objeto em estrutura de Json Data
    public static func encode<T: Codable>(data: T) -> Data? {
        do {
            let jsonEncoder = JSONEncoder()
            return try jsonEncoder.encode(data)
        } catch let error {
            print(error)
            return nil
        }
    }
}
