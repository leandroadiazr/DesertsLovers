//
//  Home.swift
//  DesertsLovers
//
//  Created by Leandro Diaz on 11/13/23.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                FeaturedMealsView(viewModel: viewModel)
                
                DessertListView(viewModel: viewModel)
                    .navigationBarTitle("Desserts")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(viewModel: AppViewModel())
    }
}
