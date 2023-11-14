//
//  AppViewModel.swift
//  DesertsLovers
//
//  Created by Leandro Diaz on 11/13/23.
//

import SwiftUI

class AppViewModel: ObservableObject {
    private var favoriteManager = FavoriteManager()
    private var networkManager = NetworkManager()
    @Published var desserts: [Meal] = []
    @Published var detailedMeal: DetailedMeal?
    @Published var favorites: [Meal] = []
    
    init() {
        fetchDesserts()
        favorites = getFavoriteMeals()
    }
    
    // MARK: - FAVORITES
    func saveFavoriteMeal(_ meal: Meal) {
        favoriteManager.toggleFavoriteMeal(meal)
        favorites = favoriteManager.getFavoriteMeals()
    }
    
    func getFavoriteMeals() -> [Meal] {
        return favoriteManager.getFavoriteMeals()
    }
    
    func isFavoriteMeal(_ meal: Meal) -> Bool {
        return favoriteManager.isFavoriteMeal(meal)
    }
    
    // MARK: - NETWORK OPERATIONS
    func fetchDesserts() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return
        }

        networkManager.fetchData(from: url, responseType: MealsResponse.self) { result in
            switch result {
            case .success(let result):
                self.desserts = result.meals
            case .failure(let error):
                print("Error fetching desserts: \(error)")
            }
        }
    }

    func fetchDetailedMeal(for meal: Meal) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(meal.idMeal)") else {
            return
        }

        networkManager.fetchData(from: url, responseType: DetailedMealResponse.self) { result in
            switch result {
            case .success(let result):
                self.detailedMeal = result.meals.first
            case .failure(let error):
                print("Error fetching detailed meal: \(error)")
            }
        }
    }
}
