//
//  VehicleDetailViewModel.swift
//  Rides
//
//  Created by Chirag Anghan on 2024-09-21.
//

import Foundation

class VehicleDetailViewModel: ObservableObject {
    let vehicle: Vehicle

    init(vehicle: Vehicle) {
        self.vehicle = vehicle
    }
    
    func calculateCarbonEmissions(for kilometrage: Int) -> Double {
        let first5000KmEmission = min(kilometrage, 5000)
        let remainingKm = max(0, kilometrage - 5000)
        
        let emissionsFromFirst5000 = Double(first5000KmEmission) * 1.0
        let emissionsFromRemaining = Double(remainingKm) * 1.5
        
        return emissionsFromFirst5000 + emissionsFromRemaining
    }
}
