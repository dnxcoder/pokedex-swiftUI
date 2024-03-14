//
//  ContentView.swift
//  dnxcoder-pokedex
//
//  Created by Denis Coder on 3/9/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        ZStack{
            ScrollView {
                VStack(alignment:.leading, spacing: 0){
                    Text("Welcome to \nPokedex \nOnline")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.white)
                    
                    ForEach(viewModel.pokemons2, id: \.self.name) { currentPokemon in
                        PokemonCard(pokemon: currentPokemon)
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight:.infinity, alignment: .leading)
                
            }.onAppear{
                viewModel.getPokemonsFromJsonFile()
                print(viewModel.pokemons);
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(
            Color(.background)
        )
    }
}

#Preview {
    MainView()
}
