//
//  getPokemonImageLink.swift
//  dnxcoder-pokedex
//
//  Created by Denis Coder on 4/14/24.
//

import Foundation

public func getPokemonImageLink(pokemonId:Int)->String {
    
    if (pokemonId < 10){
        return "https://assets.pokemon.com/assets/cms2/img/pokedex/full/00\(pokemonId).png"
    }else if (pokemonId < 100){
        return "https://assets.pokemon.com/assets/cms2/img/pokedex/full/0\(pokemonId).png"
    } else if(pokemonId < 1000){
        return "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(pokemonId).png"
    }
    
    return "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(pokemonId).png"
}
