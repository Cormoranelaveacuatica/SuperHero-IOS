//
//  SuperHeroProvider.swift
//  SuperHero-IOS
//
//  Created by Mañanas on 20/5/25.
//

import Foundation

class SuperheroProvider {
    
    static let API_KEY = "dbc2e43ab98b528a958fda749b830fa3"
    
    static func findSuperheroesByName(query: String) async -> [Superhero] {
        let url = URL(string: "https://www.superheroapi.com/api/\(API_KEY)/search/\(query)")
        
        guard let url = url else {
            print("Error building URL")
            return []
            
        }
        do {
            let (data, response) = try await URLSession.shared.data (from: url)
            let result = try JSONDecoder().decode(SuperheroResponse.self, from: data)
            return result.results
        } catch {
            print(error)
            return []
        }
    }
}




