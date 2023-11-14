//
//  TabBarView.swift
//  DesertsLovers
//
//  Created by Leandro Diaz on 11/13/23.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var viewModel: AppViewModel
    var body: some View {
            TabView {
                Home(viewModel: self.viewModel)
                    .tabItem {
                        Image(systemName: "birthday.cake.fill")
                        Text("DESERT")
                    }
                
                
                Favorites(viewModel: self.viewModel)
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("FAVORITES")
                    }
                
                Text("COMING SOON...")
                    .tabItem {
                        Image(systemName: "takeoutbag.and.cup.and.straw")
                        Text("MAIN COURSE")
                    }
            }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewModel: AppViewModel())
    }
}
