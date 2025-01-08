//
//  RideRequestedView.swift
//  MapKitSearch
//
//  Created by oguzhan on 8.01.2025.
//

import SwiftUI

struct RideRequestView: View {
    @State private var selectedRideType: RideType = .taxiWhite
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    let confirmRide = "CONFIRM RIDE"
    let currentLocation = "Current location"
    let suggestedRides = "SUGGESTED RIDES"
    let visa = "VISA"
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            HStack {
                RoutePathView()
                
                TripLocationsInfo()
            }
            .padding()
            
            Divider()
                        
            Text(suggestedRides)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            SuggestedRidesView()
            
            Divider()
                .padding(.vertical, 8)
            
            VisaInfo()
            
            ConfirmButton()
            
        }
        .padding(.horizontal)
        .padding(.bottom, 30)
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
    }
    
    @ViewBuilder
    fileprivate func RoutePathView() -> some View {
        VStack {
            Circle()
                .fill(Color(.systemGray3))
                .frame(width: 8, height: 8)
            
            Rectangle()
                .fill(Color(.systemGray3))
                .frame(width: 1, height: 32)
            
            Rectangle()
                .fill(Color.black)
                .frame(width: 8, height: 8)
        }
    }
    
    @ViewBuilder
    fileprivate func TripLocationsInfo() -> some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack {
                Text(currentLocation)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text(homeViewModel.pickupTime ?? "")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 10)
            
            HStack {
                if let location = homeViewModel.selectedTripLocation {
                    Text(location.title)
                        .font(.system(size: 16, weight: .semibold))
                }
                
                Spacer()
                
                Text(homeViewModel.dropOffTime ?? "")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.gray)
            }
            
            if let distance = homeViewModel.tripDistance{
                Text("\(distance.toKilometers)")
            }
            
        }
        .padding(.leading, 8)
    }
    
    @ViewBuilder
    fileprivate func SuggestedRidesView() -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(RideType.allCases) { type in
                    VStack(alignment: .leading) {
                        Image(type.imageName)
                            .resizable()
                            .scaledToFit()
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(type.description)
                                .font(.system(size: 14, weight: .semibold))
                            
                            Text(homeViewModel.computeRidePrice(forType: type).toCurrency())
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .padding()
                        
                    }
                    .frame(width: 112, height: 140)
                    .foregroundColor(type == selectedRideType ? .white : Color.theme.primaryTextColor)
                    .background(type == selectedRideType ? .orange : Color.theme.secondaryBackgroundColor)
                    .scaleEffect(type == selectedRideType ? 1.2 : 1.0)
                    .cornerRadius(10)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedRideType = type
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    fileprivate func VisaInfo() -> some View {
        HStack(spacing: 12) {
            Text(visa)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(6)
                .background(.orange)
                .cornerRadius(4)
                .foregroundColor(.white)
                .padding(.leading)
            
            Text("**** 1234")
                .fontWeight(.bold)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .imageScale(.medium)
                .padding()
        }
        .frame(height: 50)
        .background(Color.theme.secondaryBackgroundColor)
        .cornerRadius(10)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    fileprivate func ConfirmButton() -> some View {
        Button {
        } label: {
            Text(confirmRide)
                .fontWeight(.bold)
                .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                .background(.orange)
                .cornerRadius(10)
                .foregroundColor(.white)
        }
    }
}


#Preview {
    RideRequestView()
        .environmentObject(HomeViewModel())
}
