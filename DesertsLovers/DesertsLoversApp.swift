//
//  DesertsLoversApp.swift
//  DesertsLovers
//
//  Created by Leandro Diaz on 11/13/23.
//

import SwiftUI

@main
struct DesertsLoversApp: App {
    @StateObject private var viewModel = AppViewModel()
    var body: some Scene {
        WindowGroup {
            TabBarView(viewModel: self.viewModel)
        }
    }
}
