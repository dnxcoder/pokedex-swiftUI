//
//  PokemonCard.swift
//  dnxcoder-pokedex
//
//  Created by Denis Coder on 3/9/24.
//

import SwiftUI

struct PokemonCard: View {
    
    @State public var pokemon: Pokemon2
    
    func getPokemonImageLink(pokemonId:Int)->String {
        
        if (pokemonId < 10){
            return "https://assets.pokemon.com/assets/cms2/img/pokedex/full/00\(pokemonId).png"
        }else if (pokemonId < 100){
            return "https://assets.pokemon.com/assets/cms2/img/pokedex/full/0\(pokemonId).png"
        } else if(pokemonId < 1000){
            return "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(pokemonId).png"
        }
        
        return "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(pokemonId).png"
    }
    
    
    var body: some View {
        ZStack{
            HStack{
                VStack(alignment:.leading){
                    Text(pokemon.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .foregroundColor(.white)
                    
                    ForEach(pokemon.type, id: \.type.url) { currentType in
                        Text(currentType.type.name)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(getPokemonBackgroundTypeColor(pokemonType: currentType.type.name))
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                VStack{
                    ZStack(alignment:.topTrailing){
                        Image("pokeball-logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .opacity(0.5)
                            .frame(maxWidth: 190)
                            .offset(y:5)
                        PokemonRemoteImage(urlString: getPokemonImageLink(pokemonId: pokemon.id))
                            .aspectRatio(contentMode: .fill)
                            .offset(y:10)
                        Text("\(formatPokemonCode(pokemonCode:pokemon.id))")
                            .font(.title3)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .offset(y:-1)
                    }
                    .frame(maxWidth:.infinity, maxHeight:.infinity)
                    //.background()
                }.onAppear{
                    print(pokemon.type)
                }
                
            }
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 200, alignment: .leading)
        .background(getPokemonCardBackgroundColor(pokemonType: pokemon.type[0].type.name))
        .cornerRadius(10)
        .padding()
    }
}

//#Preview {
//    PokemonCard(pokemon: Pokemon(name: "bulbasaur", weight: 89, types: ))
//}
