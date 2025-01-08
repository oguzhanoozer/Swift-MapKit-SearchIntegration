//
//  MapKitSearchApp.swift
//  MapKitSearch
//
//  Created by oguzhan on 8.01.2025.
//

import SwiftUI

@main
struct MapKitSearchApp: App {
    @StateObject var homeViewModel = HomeViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .environmentObject(homeViewModel)
            }
        }
    }
}
