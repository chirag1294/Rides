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
}
