//
//  RemoteImage.swift
//  Apptizers
//
//  Created by Denis Coder on 2/22/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    //It will be broadcasting its changes
    //By default the image will come with nil value
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String){
        NetworkManager.shared.downloadImage(fromURLString: urlString){ uiImage in
            
            guard let uiImage = uiImage else {
                return Void();
            }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("pokemon-example").resizable()
    }
}

struct PokemonRemoteImage: View {
    
    
    //The stateObject will be listening to the change of image when it gets downloaded
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.load(fromURLString: urlString)
            }
    }
}
