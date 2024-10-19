//
//  Untitled.swift
//  Networking
//
//  Created by Joao Paulo Carneiro on 16/10/24.
//
import Foundation

///     Enum com os tipos de comunicação entre servidor e client e quais os objetos eles transportam no payload
public enum WebsocketMessageType: String, Codable {
    case update // SERVIDOR AVISA aos USUÁRIOS que é preciso atualizar informação X
    case isEditing // SERVIDOR AVISA aos USUÁRIOS que o user Y está editando o dado X
    case requestEdit // USUÁRIO Y está solicitando ao SERVIDOR permissão para editar o dado X
    case unavailable // SERVIDOR RESPONDE ao USUÁRIO Y que ele não pode editar o dado X
    case finishedEditing // USUÁRIO Y avisa ao SERVIDOR que ele terminou de editar o dado X
    case error // SERVIDOR avisa ao USUÁRIO Y problema na ultima mensagem
    case requestAllUpdateStatus // USUÁRIO Y solicita ao SERVIDOR atualização sobre o statu das informações sobre edição
    
    var objectType: Codable.Type {
        switch self {
        case .update, .finishedEditing, .isEditing, .requestEdit, .unavailable:
            return WebsocketEditComunication.self
        case .error:
            return String.self
        case .requestAllUpdateStatus:
            return String.self
        }
    }
}
