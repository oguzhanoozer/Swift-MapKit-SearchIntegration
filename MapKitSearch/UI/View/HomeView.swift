//
//  HomeView.swift
//  MapKitSearch
//
//  Created by oguzhan on 8.01.2025.
//

import SwiftUI


struct HomeView: View {
    @State private var mapState = MapViewState.noInput
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        Group {
            NavigationStack {
                mapView
            }
        }
    }
}

extension HomeView {
    var mapView: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                MapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                
                if mapState == .searchingForLocation {
                    LocationSearchView()
                } else if mapState == .noInput {
                    LocationSearchActivationView()
                        .padding(.top, 88)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                mapState = .searchingForLocation
                            }
                        }
                }
                
                MapViewActionButton(mapState: $mapState)
                    .padding(.leading)
                    .padding(.top, 4)
            }
            
            if homeViewModel.isTripRequested {
                homeViewModel.viewForState(mapState)
                    .transition(.move(edge: .bottom))
            }
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .onReceive(LocationManager.shared.$userLocation) { location in
            if let location = location {
                homeViewModel.userLocation = location
            }
        }
        .onReceive(homeViewModel.$selectedTripLocation) { location in
            if location != nil {
                self.mapState = .locationSelected
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}
