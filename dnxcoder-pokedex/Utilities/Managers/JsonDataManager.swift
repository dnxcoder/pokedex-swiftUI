//
//  JsonDataManager.swift
//  dnxcoder-pokedex
//
//  Created by Denis Coder on 3/13/24.
//

import Foundation

final class JsonDataManager {
    
    static let shared = JsonDataManager()
    

    private init(){}
    
    public func getAllPokemonsInJson(filename:String, completed:(Result<[Pokemon2], APError>)->Void) -> Void {
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: "json") else {
            completed(.failure(.unableToComplete))
            return Void()
        }
        
        do {
            
            let data = try Data(contentsOf: file)
            let decoder = JSONDecoder()
            let decodedData: [Pokemon2] = try decoder.decode([Pokemon2].self, from: data)
            completed(.success(decodedData))
        }catch (let error) {
            
            print(error)
            completed(.failure(.unableToComplete))
            print("deu erroooooooooo")
            return Void()
        }
    }
    
    
}
