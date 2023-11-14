//
//  Favorites.swift
//  DesertsLovers
//
//  Created by Leandro Diaz on 11/13/23.
//

import SwiftUI

struct Favorites: View {
    @StateObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.favorites.isEmpty {
                    // MARK: Empty state
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.yellow)
                    Text("No favorite meals yet.\nAdd meals to your favorites!")
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    // MARK: - Favorited meals
                    List {
                        ForEach(viewModel.favorites, id: \.self) { meal in
                            NavigationLink(destination: DessertDetailView(viewModel: self.viewModel, meal: meal)) {
                                MealRow(meal: meal)
                            }
                        }
                        .onDelete { indices in
                            indices.forEach { index in
                                let meal = viewModel.favorites[index]
                                self.viewModel.saveFavoriteMeal(meal)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Favorites")
        }
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites(viewModel: AppViewModel())
    }
}

struct MealRow: View {
    var meal: Meal
    
    var body: some View {
        HStack {
            Text(meal.strMeal)
            Spacer()
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
        }
        .padding()
    }
}
