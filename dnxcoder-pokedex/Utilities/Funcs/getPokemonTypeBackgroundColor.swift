//
//  getPokemonTypeBackgroundColor.swift
//  dnxcoder-pokedex
//
//  Created by Denis Coder on 3/13/24.
//

import SwiftUI

func getPokemonBackgroundTypeColor(pokemonType: String)-> Color {
    
    switch pokemonType {
    case PokemonTypeEnum.grass.rawValue:
        return Color.textGrass
    case PokemonTypeEnum.poison.rawValue:
        return Color.textPoison
    case PokemonTypeEnum.fire.rawValue:
        return Color.textFire
    case PokemonTypeEnum.water.rawValue:
        return Color.textWater
    case PokemonTypeEnum.bug.rawValue:
        return Color.textBug
    case PokemonTypeEnum.normal.rawValue:
        return Color.textNormal
    case PokemonTypeEnum.electric.rawValue:
        return Color.textEletric
    case PokemonTypeEnum.ground.rawValue:
        return Color.textGround
    case PokemonTypeEnum.fairy.rawValue:
        return Color.textFairy
    case PokemonTypeEnum.fighting.rawValue:
        return Color.textFighting
    case PokemonTypeEnum.psychic.rawValue:
        return Color.textPsychic
    case PokemonTypeEnum.rock.rawValue:
        return Color.textRock
    case PokemonTypeEnum.steel.rawValue:
        return Color.textSteel
    case PokemonTypeEnum.ice.rawValue:
        return Color.textIce
    case PokemonTypeEnum.ghost.rawValue:
        return Color.textGhost
    case PokemonTypeEnum.dragon.rawValue:
        return Color.textDragon
    case PokemonTypeEnum.dark.rawValue:
        return Color.textDark
        
    default:
        return Color.textNormal
    }
}

