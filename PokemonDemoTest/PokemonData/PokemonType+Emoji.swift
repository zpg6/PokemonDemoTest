//
//  PokemonType+Emoji.swift
//  PokemonDemoTest
//
//  Created by Zachary Grimaldi on 4/16/21.
//

import Foundation

extension PokemonType {
    
    var emoji: String {
        switch self {
            
            case .bug:
                return "๐"
            case .dark:
                return "๐"
            case .dragon:
                return "๐"
            case .electric:
                return "โก๏ธ"
            case .fairy:
                return "๐ง๐พโโ๏ธ"
            case .fighting:
                return "๐ฅ"
            case .fire:
                return "๐ฅ"
            case .flying:
                return "๐ฆ"
            case .ghost:
                return "๐ป"
            case .grass:
                return "๐"
            case .ground:
                return "โฐ"
            case .ice:
                return "โ๏ธ"
            case .normal:
                return "๐ค"
            case .poison:
                return "๐งช"
            case .psychic:
                return "โฎ๏ธ"
            case .rock:
                return "๐ชจ"
            case .steel:
                return "๐ฉ"
            case .water:
                return "๐"
        }
    }
    
    
}
