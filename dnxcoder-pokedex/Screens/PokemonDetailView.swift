//
//  PokemonDetailView.swift
//  dnxcoder-pokedex
//
//  Created by Denis Coder on 4/14/24.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @Binding public var selectedPokemon: Pokemon2?
    @State private var rotation: Double = 0.0
    let namespace: Namespace.ID
    
    init(selectedPokemon: Binding<Pokemon2?>, namespace:Namespace.ID){
        self._selectedPokemon = selectedPokemon
        self.rotation = 0
        self.namespace = namespace
    }
    
    
    var body: some View {
        
        if selectedPokemon != nil {
            
            
            ZStack{
                Color.black.opacity(0.2) // Cor de fundo com opacidade
                    .blur(radius: 10) // Adiciona efeito de desfoque com raio de 10 pontos
                    .edgesIgnoringSafeArea(.all)
                
                ZStack{
                    Image("pokeball-logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0.2)
                        .rotationEffect(.degrees(rotation))
                        .onAppear(){
                            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false),{
                                self.rotation = 360
                            })
                        }
                    
                    VStack{
                        Spacer().frame(height: 20)
                        VStack{
                            HStack(alignment:.top){
                                VStack(alignment: .leading){
                                    
                                    Text(self.selectedPokemon!.name)
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundStyle(Color.white)
                                    
                                    ForEach(self.selectedPokemon!.type, id: \.type.url) { currentType in
                                        Text(currentType.type.name)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.white)
                                            .padding(10)
                                            .background(getPokemonBackgroundTypeColor(pokemonType: currentType.type.name))
                                            .cornerRadius(10)
                                    }}
                                Spacer()
                                Text("\(formatPokemonCode(pokemonCode:self.selectedPokemon!.id))")
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                            }
                            .padding()
                            PokemonRemoteImage(urlString: getPokemonImageLink(pokemonId: selectedPokemon!.id))
                            //.animation(nil)
                                .scaledToFit()
                                .matchedGeometryEffect(id: self.selectedPokemon!.name, in: namespace,
                                                       properties: .frame,anchor: .center, isSource: self.selectedPokemon?.name != nil )
                                .aspectRatio(contentMode: .fill)
                                .offset(y:10)
                            VStack{
                                Text("\(self.selectedPokemon!.behavior)")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.textGrazy)
                                Spacer()
                            }
                            .padding()
                            .frame(width: 350, height: 200)
                            .background(Color.white)
                        }
                    }
                    .frame(width:350)
                }
                .frame(width: 350)
                .background(getPokemonCardBackgroundColor(pokemonType: self.selectedPokemon!.type[0].type.name))
                .cornerRadius(20)
                .shadow(radius: 40)
                //.blur(radius:30)
                .overlay{
                    VStack{
                        HStack{
                            Spacer()
                            Button{
                                withAnimation(){
                                    self.rotation = 0
                                    self.selectedPokemon = nil
                                }
                            }label: {
                                Text("❌")
                                    .font(.title)
                                    .padding()
                            }
                            .background(Color.white)
                            .cornerRadius(60)
                            .offset(x:20,y:-30)
                            .zIndex(3)
                        }
                        Spacer()
                    }
                }
            }
            
        } else {
            EmptyView()
        }
        
    }
}

//#Preview {
//    PokemonDetailView()
//}
