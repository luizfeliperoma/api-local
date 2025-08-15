//
//  Model.swift
//  ApiLocal
//
//  Created by Turma02 on 16/07/25.
//

import Foundation

struct Filmes: Decodable, Hashable, Identifiable {
    let id = UUID()
    let nome: String?
    let cidade: String?
}

