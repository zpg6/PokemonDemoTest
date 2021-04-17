//
//  PokemonCodable.swift
//  PokemonDemoTest
//
//  Created by Zachary Grimaldi on 4/16/21.
//

import Foundation

struct Pokemon: Identifiable {
    
    let id: Int
    let num: String
    
    /// The name of the Pokemon
    let name: String
    
    let img: String
    let type: [PokemonType]
    let height, weight, candy: String
    let candyCount: Int?
    let egg: Egg
    let spawnChance, avgSpawns: Double
    let spawnTime: String
    let multipliers: [Double]?
    let weaknesses: [PokemonType]
    let nextEvolution, prevEvolution: [Evolution]?
    
    enum Egg: String, Codable {
        
        case notInEggs = "Not in Eggs"
        case omanyteCandy = "Omanyte Candy"
        case the10KM = "10 km"
        case the2KM = "2 km"
        case the5KM = "5 km"
    }

    struct Evolution: Codable {
        let num, name: String
    }
}


extension Pokemon: Codable {
    enum CodingKeys: String, CodingKey {
        case id, num, name, img, type, height, weight, candy
        case candyCount = "candy_count"
        case egg
        case spawnChance = "spawn_chance"
        case avgSpawns = "avg_spawns"
        case spawnTime = "spawn_time"
        case multipliers, weaknesses
        case nextEvolution = "next_evolution"
        case prevEvolution = "prev_evolution"
    }
}


struct PokemonResponse: Codable {
    let pokemon: [Pokemon]
}
