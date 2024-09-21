//
//  VehicleDetailView.swift
//  Rides
//
//  Created by Chirag Anghan on 2024-09-21.
//

import SwiftUI

struct VehicleDetailView: View {
    @ObservedObject var viewModel: VehicleDetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("VIN: \(viewModel.vehicle.vin)")
            Text("Make and Model: \(viewModel.vehicle.makeAndModel)")
            Text("Color: \(viewModel.vehicle.color)")
            Text("Car Type: \(viewModel.vehicle.carType)")
        }
        .padding()
    }
}

#Preview {
    VehicleDetailView(viewModel: VehicleDetailViewModel(vehicle: Vehicle.mockVehicle))
}
