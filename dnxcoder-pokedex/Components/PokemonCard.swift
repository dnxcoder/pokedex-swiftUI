//
//  PokemonCard.swift
//  dnxcoder-pokedex
//
//  Created by Denis Coder on 3/9/24.
//

import SwiftUI

struct PokemonCard: View {
    
    public var pokemon: Pokemon2
    @Binding public var selectedPokemon: Pokemon2?
    let namespace: Namespace.ID
  
   
    
    init(pokemon: Pokemon2, selectedPokemon: Binding<Pokemon2?>, namespace: Namespace.ID){
        self.pokemon = pokemon
        self._selectedPokemon = selectedPokemon
        self.namespace = namespace
    }
    
    
    var body: some View {
        
        ZStack{
            HStack{
                VStack(alignment:.leading){
                    Text(pokemon.name.prefix(1).capitalized + pokemon.name.dropFirst())
                        .font(.title2)
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
                            .matchedGeometryEffect(id: self.pokemon.name, in: namespace, isSource: self.pokemon.name != self.selectedPokemon?.name)
                        
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
        .onTapGesture {
            withAnimation{
                self.selectedPokemon = pokemon
            }
        }
    }
}

struct ItemDetailView: View{
    
    var body: some View {
        VStack {
            Text("REVOADA")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .background(Color.black)
        
    }
}


//#Preview {
//    PokemonCard(pokemon: Pokemon(name: "bulbasaur", weight: 89, types: ))
//}
