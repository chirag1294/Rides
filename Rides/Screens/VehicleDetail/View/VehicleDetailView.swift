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
        TabView {
            // First Tab: Vehicle Details
            vehicleDetailsView
                .tabItem {
                    Text("Details")
                }
            
            // Second Tab: Carbon Emissions
            carbonEmissionsView
                .tabItem {
                    Text("Emissions")
                }
        }
        .tabViewStyle(PageTabViewStyle()) // For swipeable behavior
    }
    
    private var vehicleDetailsView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("VIN: \(viewModel.vehicle.vin)")
            Text("Make and Model: \(viewModel.vehicle.makeAndModel)")
            Text("Color: \(viewModel.vehicle.color)")
            Text("Car Type: \(viewModel.vehicle.carType)")
            
            Text("Swipe right to see Estimated Carbon Emissions ")
                .foregroundStyle(.blue)
                .padding(.top, 50)
        }
        .padding()
    }
    
    private var carbonEmissionsView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Estimated Carbon Emissions")
                .font(.title)
            
            let emissions = viewModel.calculateCarbonEmissions(for: viewModel.vehicle.kilometrage)
            Text("Kilometrage: \(viewModel.vehicle.kilometrage) km")
            Text("Emissions: \(emissions, specifier: "%.2f") units")
        }
        .padding()
    }
}

#Preview {
    VehicleDetailView(viewModel: VehicleDetailViewModel(vehicle: Vehicle.mockVehicle))
}
