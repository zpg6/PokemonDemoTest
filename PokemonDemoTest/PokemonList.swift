//
//  PokemonList.swift
//  PokemonDemoTest
//
//  Created by Zachary Grimaldi on 4/16/21.
//

import SwiftUI

struct PokemonList: View {
    
    @ObservedObject var vm: ViewModel
    @Binding var exactMatch: Bool
    
    var body: some View {
        if vm.filter.count > 0 {
            ForEach(vm.filter.map({$0}), id:\.self) { filteredType in
                ForEach(filteredPokedex()) { pokemon in
                    Button(action: {
                        if let selected = vm.selectedPokemon {
                            print(selected)
                        }
                        vm.selectedPokemon = pokemon
                    }) {
                        PokemonViewCell(pokemon: pokemon)
                    }
                }
            }
        }
        else {
            ForEach(vm.pokedex) { pokemon in
                Button(action: {
                    if let selected = vm.selectedPokemon {
                        print(selected)
                    }
                    vm.selectedPokemon = pokemon
                }) {
                    PokemonViewCell(pokemon: pokemon)
                }
            }
        }
    }
    
    
    
    
    func filteredPokedex() -> [Pokemon] {
        if exactMatch {
            return vm.pokedex.filter { (pokemon) -> Bool in
                return pokemon.type.equalContents(to: vm.filter)
            }
        } else {
            return vm.pokedex.filter { (pokemon) -> Bool in
                return pokemon.type.contains(where: {vm.filter.contains($0)})
            }
        }
    }
}
