//
//  getPokemonTypeBackgroundColor.swift
//  dnxcoder-pokedex
//
//  Created by Denis Coder on 3/13/24.
//

import SwiftUI

func getPokemonCardBackgroundColor(pokemonType: String)-> Color {
    
    switch pokemonType {
    case PokemonTypeEnum.grass.rawValue:
        return Color.grass
    case PokemonTypeEnum.poison.rawValue:
        return Color.poison
    case PokemonTypeEnum.fire.rawValue:
        return Color.fire
    case PokemonTypeEnum.water.rawValue:
        return Color.water
    case PokemonTypeEnum.bug.rawValue:
        return Color.bug
    case PokemonTypeEnum.normal.rawValue:
        return Color.normal
    case PokemonTypeEnum.electric.rawValue:
        return Color.electric
    case PokemonTypeEnum.ground.rawValue:
        return Color.ground
    case PokemonTypeEnum.fairy.rawValue:
        return Color.fairy
    case PokemonTypeEnum.fighting.rawValue:
        return Color.fighting
    case PokemonTypeEnum.psychic.rawValue:
        return Color.psychic
    case PokemonTypeEnum.rock.rawValue:
        return Color.rock
    case PokemonTypeEnum.steel.rawValue:
        return Color.steel
    case PokemonTypeEnum.ice.rawValue:
        return Color.ice
    case PokemonTypeEnum.ghost.rawValue:
        return Color.ghost
    case PokemonTypeEnum.dragon.rawValue:
        return Color.dragon
    case PokemonTypeEnum.dark.rawValue:
        return Color.dark
        
    default:
        return Color.textNormal
    }
}

