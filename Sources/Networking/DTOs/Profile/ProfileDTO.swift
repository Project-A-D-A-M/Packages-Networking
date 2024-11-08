//
//  File.swift
//
//
//  Created by Joao Paulo Carneiro on 19/09/24.
//

import Foundation
import SwiftUI

public final class ProfileDTO: Codable {
    /// ID do profile do usuário
    public var id: UUID
    
    /// ID do usuário no cloudkit
    public var cloudkitId: String
    
    /// Nome de escolha para o usuário
    public var name: String
    
    /// Imagem de escolha para o usuário
    public var userImageData: Data?
    
    /// Lista de Ids de viagens do usuário
    public var tripsIDs: [UUID]
    
    
    public init(id: UUID = .init(), userId: String, name: String, userImageData: Data? = nil, tripsIDs: [UUID]) {
        self.id = id
        self.cloudkitId = userId
        self.name = name
        self.userImageData = userImageData
        self.tripsIDs = tripsIDs
    }
}
