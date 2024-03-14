//
//  Pokemon.swift
//  dnxcoder-pokedex
//
//  Created by Denis Coder on 3/9/24.
//

import Foundation


struct Pokemon: Decodable {
    let name:String
    let weight:Int
    let types: [PokemonType]
    let sprites: Sprites
}

struct PokemonType: Decodable {
    let type: PokemonTypeName
}

struct PokemonTypeName: Decodable {
    let name: String
}

struct Sprites : Decodable {
    
    let front_default:String
}


