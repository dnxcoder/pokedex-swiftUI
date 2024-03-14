//
//  NetworkManager.swift
//  dnxcoder-pokedex
//
//  Created by Denis Coder on 3/9/24.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    
    let baseURL = "https://pokeapi.co/api/v2/pokemon/"
    private let cache = NSCache<NSString, UIImage>()
    
    private init(){}
    
    private func getPokemon(pokemonIndex:Int , completed: @escaping (Result<Pokemon, APError>) -> Void) -> Void {
        
        guard let url = URL(string: "\(baseURL)\(pokemonIndex)") else {
            completed(.failure(.invalidURL))
            return Void()
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return Void();
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return Void();
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return Void();
            }
            
            
            //decodating data
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(Pokemon.self, from: data)
                completed(.success(decodedResponse))
            }catch{
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
    }
    
    public func getAllPokemons(completed:@escaping (Result<[Pokemon], APError>) -> Void) -> Void{
        
        DispatchQueue.main.async{
            var listOfPokemons : [Pokemon] = []
            
            let group = DispatchGroup()
            
            for pokemonIndex in 1...100 {
                
                group.enter()
                self.getPokemon(pokemonIndex: pokemonIndex){ result in
                    defer {
                        // Saindo do grupo após a chamada assíncrona ser concluída, independentemente do resultado
                        group.leave()
                    }
                    
                    switch result {
                    case .success(let pokemon) :
                        listOfPokemons.append(pokemon)
                    case .failure(let error):
                        completed(.failure(error))
                        return Void()
                    }
                }
            }
            group.notify(queue: .main) {
                completed(.success(listOfPokemons))
            }
        }
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void){
        
        let cacheKey = NSString(string: urlString)
        
        
        //It checks if this image has already been downloaded and it is in cash
        //If the image is already downloaded then just get out of function
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return Void()
        }
        
        
        //checking the URL if it is good
        guard let url = URL(string: urlString) else {
            completed(nil)
            return Void()
        }
        
        //
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            //if i have data, awesome continue and check if we can initialize an image from that data
            guard let data = data, let image = UIImage(data: data) else {
                // if i dont have a data or i cant innitialize an image from that data
                completed(nil)
                return Void()
            }
            
            // now we are going to put the image that we downloaded on cache
            // so next time we dont need to download the image again
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
