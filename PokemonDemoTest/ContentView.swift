//
//  ContentView.swift
//  PokemonDemoTest
//
//  Created by Zachary Grimaldi on 4/15/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    @State var exactMatch = false
    
    func sheetBinding() -> Binding<Bool> {
        return Binding<Bool>(get: {
            return vm.selectedPokemon != nil
        }, set: {
            if !$0 {
                vm.selectedPokemon = nil
            }
        })
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if vm.pokedex.isEmpty { // still loading from GitHub
                    
                    Spacer()
                    Text("Loading the Pokédex...")
                    ProgressView()
                    Spacer()
                }
                else { // loaded in, ready to use
                    
                    FilterView(vm: vm, exactMatch: $exactMatch)
                    ScrollView {
                        PokemonList(vm: vm, exactMatch: $exactMatch)
                    }
                }
            }
            .navigationTitle("PokéFilter")
            .sheet(isPresented: sheetBinding()) {
                VStack {
                    WebImage(url: imageURL)
                        .resizable()
                        .indicator(.activity)
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                    Text(vm.selectedPokemon?.name ?? "Un-named Pokemmon")
                    Text("Spawn time: \(vm.selectedPokemon?.spawnTime ?? "")")
                }
            }
        }
    }
    
    var imageURL: URL? {
        // add https to the image URLs for security
        URL(string: vm.selectedPokemon?.img.replacingOccurrences(of: "http:", with: "https:") ?? "")
    }
}
