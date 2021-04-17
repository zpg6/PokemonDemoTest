//
//  FilterView.swift
//  PokemonDemoTest
//
//  Created by Zachary Grimaldi on 4/16/21.
//

import SwiftUI

struct FilterView: View {
    
    @ObservedObject var vm: ViewModel
    @Binding var exactMatch: Bool
    
    var body: some View {
        DisclosureGroup("Filter by Type") {
            
            VStack {
                Toggle("Require Exact Match", isOn: $exactMatch)
                
                // how we make a grid in SwiftUI
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]) {
                    ForEach(PokemonType.allCases, id:\.self) { pokemonType in
                        
                        // the Type button itself
                        Button(action: { toggleType(pokemonType) }) {
                            HStack {
                                Text(pokemonType.emoji)
                                Text(pokemonType.rawValue)
                            }.foregroundColor(.white)
                            .padding(5).background((vm.filter.contains(pokemonType) ? Color.pink:Color.gray).cornerRadius(4))
                        }
                    }
                }
            }
        }.accentColor(.pink)
        .padding()
        .background(Color.black.opacity(0.8).cornerRadius(10))
        .padding()
    }
    
    
    
    
    // add or remove the type from the filter list as needed
    func toggleType(_ pokemonType: PokemonType) {
        if !vm.filter.contains(pokemonType) {
            vm.filter.append(pokemonType)
        } else {
            vm.filter = vm.filter.filter({$0 != pokemonType})
        }
    }
    
    
}

