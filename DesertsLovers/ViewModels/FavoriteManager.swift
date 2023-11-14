//
//  FavoriteManager.swift
//  DesertsLovers
//
//  Created by Leandro Diaz on 11/13/23.
//

import Foundation

struct FavoriteManager {
    private let favoritesKey = "FavoriteMeals"
    
    func toggleFavoriteMeal(_ meal: Meal) {
        var favoriteMeals = getFavoriteMeals()
        
        if let index = favoriteMeals.firstIndex(of: meal) {
            // Meal is in favorites, remove it
            favoriteMeals.remove(at: index)
        } else {
            // Meal is not in favorites, add it
            favoriteMeals.append(meal)
        }
        
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(favoriteMeals) {
            UserDefaults.standard.set(encodedData, forKey: favoritesKey)
        }
    }
    
    func getFavoriteMeals() -> [Meal] {
        if let savedData = UserDefaults.standard.data(forKey: favoritesKey) {
            let decoder = JSONDecoder()
            if let favoriteMeals = try? decoder.decode([Meal].self, from: savedData) {
                return favoriteMeals
            }
        }
        return []
    }
    
    func isFavoriteMeal(_ meal: Meal) -> Bool {
        let favoriteMeals = getFavoriteMeals()
        return favoriteMeals.contains(meal)
    }
}
