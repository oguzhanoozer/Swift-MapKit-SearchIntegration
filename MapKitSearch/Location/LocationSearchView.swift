//
//  LocationSearchView.swift
//  MapKitSearch
//
//  Created by oguzhan on 8.01.2025.
//

import SwiftUI


struct LocationSearchView: View {
    @State private var startLocationText = ""
    @EnvironmentObject var viewModel: HomeViewModel

    let currentLocation = "Current location"
    let whereTo = "Where to?"

    
    var body: some View {
        VStack {
            HStack {
                RoutePath()
                
                InputTextViews()
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            LocationSearchResultsView(viewModel: viewModel)
        }
        .background(Color.white)
        .background(.white)
    }
    
    @ViewBuilder
    fileprivate func RoutePath() -> some View {
        VStack {
            Circle()
                .fill(Color(.systemGray3))
                .frame(width: 6, height: 6)
            
            Rectangle()
                .fill(Color(.systemGray3))
                .frame(width: 1, height: 24)
            
            Rectangle()
                .fill(Color.black)
                .frame(width: 6, height: 6)
        }
    }
    
    @ViewBuilder
    fileprivate func InputTextViews() -> some View {
         VStack {
            TextField(currentLocation, text: $startLocationText)
                .frame(height: 32)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemGroupedBackground))
                )
                .padding(.trailing)
            
            TextField(whereTo, text: $viewModel.queryFragment)
                .frame(height: 32)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemGray4))
                )
                .padding(.trailing)
            
        }
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView()
            .environmentObject(HomeViewModel())
    }
}
