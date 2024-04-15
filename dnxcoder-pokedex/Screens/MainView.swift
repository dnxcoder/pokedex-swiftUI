//
//  ContentView.swift
//  dnxcoder-pokedex
//
//  Created by Denis Coder on 3/9/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    @State var selectedPokemon : Pokemon2?  = nil
    @Namespace private var namespace
    
    var body: some View {
        ZStack{
            ScrollView {
                VStack(alignment:.leading, spacing: 0){
                    Text("Welcome to \nPokedex \nOnline")
                        .onTapGesture {
                           print("PENSE NO LULA")
                        }
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.white)
                    
                    ForEach(viewModel.pokemons2, id: \.self.name) { currentPokemon in
                        PokemonCard(pokemon: currentPokemon, selectedPokemon: self.$selectedPokemon, namespace: self.namespace)
                            .onTapGesture {
                                selectedPokemon = currentPokemon
                                print("PENSA NO LULA")
                            }
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight:.infinity, alignment: .leading)
                
            }.onAppear{
                viewModel.getPokemonsFromJsonFile()
                print(viewModel.pokemons);
            }
            
            
            PokemonDetailView(selectedPokemon: $selectedPokemon, namespace: self.namespace)
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
