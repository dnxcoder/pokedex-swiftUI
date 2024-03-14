//
//  formatPokemonCode.swift
//  dnxcoder-pokedex
//
//  Created by Denis Coder on 3/13/24.
//

import Foundation


func formatPokemonCode(pokemonCode:Int)->String{
    
    if pokemonCode<10 {return "#00\(pokemonCode)"}
    else if pokemonCode<100 {return "#0\(pokemonCode)"}
    return "#\(pokemonCode)"
}
