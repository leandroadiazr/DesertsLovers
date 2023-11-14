//
//  DessertDetailView.swift
//  DesertsLovers
//
//  Created by Leandro Diaz on 11/13/23.
//

import SwiftUI

struct DessertDetailView: View {
    @ObservedObject var viewModel: AppViewModel
    var meal: Meal
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                // MARK: - Main Title
                CustomLabelView(labelString: meal.strMeal, labelFontType: .title)
                
                // MARK: - MainImage
                HStack {
                    RoundedCornersImageView(imageName: viewModel.detailedMeal?.strMealThumb, maxSize: 150)
                    
                    Spacer()
                    
                    Button {
                        toggleFavorite(meal: meal)
                    } label: {
                        VStack {
                            Text(self.viewModel.isFavoriteMeal(meal) ? "Remove Favorites" : "Add to Favorites")
                            Image(systemName: self.viewModel.isFavoriteMeal(meal) ? "star.fill" : "star")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        .foregroundColor(self.viewModel.isFavoriteMeal(meal) ? .accentColor : .gray)
                    }
                    
                }
                
                // MARK: - Instructions
                CustomLabelView(labelString: "Instructions", labelFontType: .headline)
                    .font(.headline)
                CustomLabelView(labelString: viewModel.detailedMeal?.strInstructions ?? "Loading...", labelFontType: .caption, lineLimit: .max)
                
                // MARK: - Ingredients & Masurements
                HStack {
                    // MARK: - Ingredients
                    VStack {
                        HStack {
                            CustomLabelView(labelString: "Ingredients", labelFontType: .headline)
                            Spacer()
                        }
                        .padding()
                        
                        ForEach(viewModel.detailedMeal?.ingredients ?? [], id: \.self) { ingredient in
                            VStack {
                                HStack {
                                    CustomLabelView(labelString: ingredient ?? "")
                                        .padding(.leading, 3)
                                    Spacer()
                                }
                                Divider()
                            }
                        }
                    }
                    
                    // MARK: - Measurements
                    VStack {
                        HStack {
                            Spacer()
                            CustomLabelView(labelString: "Measuremets", labelFontType: .headline)
                        }
                        .padding()
                        
                        ForEach(viewModel.detailedMeal?.measures ?? [], id: \.self) { measure in
                            VStack {
                                HStack {
                                    Spacer()
                                    CustomLabelView(labelString: measure ?? "")
                                }
                                Divider()
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            .onAppear {
                viewModel.fetchDetailedMeal(for: meal)
            }
        }
    }
    
    private func toggleFavorite(meal: Meal) {
        self.viewModel.saveFavoriteMeal(meal)
    }
}

struct DessertDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailView(viewModel: AppViewModel(), meal: Meal(idMeal: "t", strMeal: "t", strMealThumb: "t"))
    }
}
