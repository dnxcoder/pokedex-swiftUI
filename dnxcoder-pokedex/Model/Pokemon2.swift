//
//  Pokemon2.swift
//  dnxcoder-pokedex
//
//  Created by Denis Coder on 3/13/24.
//

import Foundation

struct Pokemon2: Decodable {
    let id: Int
    let name: String
    let type: [PokemonType2]
    let height: Int
    let experience: Int
    let behavior: String
}

struct PokemonType2: Decodable {
    let slot: Int
    let type: PokemonType3
}

struct PokemonType3: Decodable {
    let name: String
    let url: String
}
