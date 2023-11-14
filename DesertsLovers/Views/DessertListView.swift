//
//  DessertListView.swift
//  DesertsLovers
//
//  Created by Leandro Diaz on 11/13/23.
//

import SwiftUI

struct DessertListView: View {
    @ObservedObject var viewModel: AppViewModel
    
    var body: some View {
        
        CustomLabelView(labelString: "Deserts", labelFontType: .headline)
        
        List(viewModel.desserts.sorted(by: { $0.strMeal < $1.strMeal }).dropFirst(5), id: \.idMeal) { dessert in
            NavigationLink(destination: DessertDetailView(viewModel: viewModel, meal: dessert)) {
                VStack {
                    Text(dessert.strMeal)
                }
                .frame(minHeight: 60)
            }
        }
        .listStyle(.plain)
    }
}

struct DessertListView_Previews: PreviewProvider {
    static var previews: some View {
        DessertListView(viewModel: AppViewModel())
    }
}
