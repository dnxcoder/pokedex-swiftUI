//
//  MainViewModel.swift
//  dnxcoder-pokedex
//
//  Created by Denis Coder on 3/10/24.
//

import Foundation


final class MainViewModel : ObservableObject {
    
    @Published public var pokemons: [Pokemon] = []
    @Published public var pokemons2: [Pokemon2] = []
    @Published public var loading: Bool = false
    
    public func getPokemons(){
        self.loading = true
        
        DispatchQueue.main.async{
            NetworkManager.shared.getAllPokemons(){ result in
                
                switch result{
                case .success(let pokemons):
                    self.pokemons = pokemons
                case .failure(_):
                    print("DEU ERRO")
                }
                
            }
        }
        
    }
    
    public func getPokemonsFromJsonFile(){
        self.loading = true
        
        DispatchQueue.main.async{
            JsonDataManager.shared.getAllPokemonsInJson(filename: "pokemon-list"){result in
                
                
                switch result{
                case .success(let listOfPokemons):
                    self.pokemons2 = listOfPokemons
                case .failure(_):
                    print("Deu erro no bagulho")
                }
                
            }
        }
        
    }
}
