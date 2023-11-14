//
//  FeaturedmealsView.swift
//  DesertsLovers
//
//  Created by Leandro Diaz on 11/13/23.
//

import SwiftUI

struct FeaturedMealsView: View {
    @StateObject var viewModel: AppViewModel
    @State private var selectedItem: Meal? = nil 
    @State private var shouldExpand: Bool = false
    var body: some View {
        ZStack {
            VStack {
                CustomLabelView(labelString: "Featured", labelFontType: .title, labelFontColor: .primary, bolded: true, italic: true)
                    .padding(.bottom, -15)
                
                TabView {
                    ForEach(self.viewModel.desserts.prefix(5), id: \.idMeal) { meal in
                        SingleMealCardView(title: meal.strMeal, description: meal.strMeal, imageName: meal.strMealThumb, isSelected: false, bodyColor: .gray) {
                            self.selectedItem = meal
                            
                            withAnimation(.easeInOut(duration: 0.5)) {
                                self.shouldExpand.toggle()
                            }
                        }
                        .padding()
                    }
                }
                .frame(height: 270)
                .tabViewStyle(PageTabViewStyle())
            }
            
            // MARK: - PopUp
            if shouldExpand {
                FeaturedMealPopUp(item: self.selectedItem, shouldExpand: $shouldExpand)
            }
        }
    }
}

struct FeaturedMealsView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedMealsView(viewModel: AppViewModel())
    }
}
