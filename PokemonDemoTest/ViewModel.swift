//
//  ViewModel.swift
//  PokemonDemoTest
//
//  Created by Zachary Grimaldi on 4/16/21.
//

import SwiftUI
import Alamofire

class ViewModel: ObservableObject {
    
    let dataURL = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"
    @Published var pokedex = [Pokemon]()
    @Published var filter = [PokemonType]()
    @Published var selectedPokemon: Pokemon? = nil
    
    init() {
        AF.request(dataURL).responseDecodable(of: PokemonResponse.self) { response in
            switch response.result {
                
                case .success(let pokedex):
                    self.pokedex = pokedex.pokemon
                case .failure(let error):
                    print(error)
            }
        }
    }
}
