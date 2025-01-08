//
//  RideType.swift
//  MapKitSearch
//
//  Created by oguzhan on 8.01.2025.
//

import Foundation


enum RideType: Int, CaseIterable, Identifiable {
    case taxiWhite
    case taxiBlack
//    case taxiOther
    
    var id: Int { return rawValue }
    
    var description: String {
        switch self {
        case .taxiWhite: return "Taxi White"
        case .taxiBlack: return "Taxi Black"
//        case .taxiOther: return "Taxi"
        }
    }
    
    var imageName: String {
        switch self {
        case .taxiWhite: return "car-white"
        case .taxiBlack: return "car-black"
//        case .taxiOther: return "car-white"
        }
    }
    
    var baseFare: Double {
        switch self {
        case .taxiWhite: return 5
        case .taxiBlack: return 20
//        case .taxiOther: return 10
        }
    }
    
    func computePrice(for distanceInMeters: Double) -> Double {
        let distanceInMiles = distanceInMeters / 1600
        
        switch self {
        case .taxiWhite: return distanceInMiles * 1.5 + baseFare
        case .taxiBlack: return distanceInMiles * 2.0 + baseFare
//        case .taxiOther: return distanceInMiles * 1.75 + baseFare
        }
    }
}
