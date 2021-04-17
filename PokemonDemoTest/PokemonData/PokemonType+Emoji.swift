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
                return "🐛"
            case .dark:
                return "🌚"
            case .dragon:
                return "🐉"
            case .electric:
                return "⚡️"
            case .fairy:
                return "🧚🏾‍♂️"
            case .fighting:
                return "🥊"
            case .fire:
                return "🔥"
            case .flying:
                return "🦅"
            case .ghost:
                return "👻"
            case .grass:
                return "🍃"
            case .ground:
                return "⛰"
            case .ice:
                return "❄️"
            case .normal:
                return "👤"
            case .poison:
                return "🧪"
            case .psychic:
                return "☮️"
            case .rock:
                return "🪨"
            case .steel:
                return "🔩"
            case .water:
                return "🌊"
        }
    }
    
    
}
