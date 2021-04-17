//
//  PokemonViewCell.swift
//  PokemonDemoTest
//
//  Created by Zachary Grimaldi on 4/16/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonViewCell: View {
    
    @State var pokemon: Pokemon
    
    var imageURL: URL? {
        // add https to the image URLs for security
        URL(string: pokemon.img.replacingOccurrences(of: "http:", with: "https:"))
    }
    
    var body: some View {
        HStack {
            
            WebImage(url: imageURL)
                .resizable()
                .indicator(.activity)
                .scaledToFit()
                .frame(width: 60, height: 60, alignment: .center)
            
            
            Text(pokemon.name.capitalized)
                .font(.headline)
            
            // Rectangles for Pokemon Types
            HStack {
                ForEach(pokemon.type, id:\.self) { pokemonType in
                    HStack {
                        Text(pokemonType.emoji)
                        Text(pokemonType.rawValue)
                    }
                    .padding(5)
                    .background(Color(.systemGray3).cornerRadius(5))
                }
            }
            
            Spacer()
        }
    }
}
