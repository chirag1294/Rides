//
//  VehicleListView.swift
//  Rides
//
//  Created by Chirag Anghan on 2024-09-21.
//

import SwiftUI

struct VehicleListView: View {
    @StateObject private var viewModel: VehicleListViewModel
    @State private var count: String = ""
    @FocusState private var isInputFocused: Bool
    
    init(viewModel: VehicleListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                inputSection
                filterSection
                vehicleListSection
            }
            .navigationTitle("Vehicle List")
        }
    }
    
    // Input section for entering number and fetch button
    private var inputSection: some View {
        HStack {
            VStack {
                TextField("Enter a number", text: $count)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onChange(of: count) { newValue in
                        withAnimation {
                            viewModel.validateInput(newValue)
                        }
                    }
                    .focused($isInputFocused)
                
                if !viewModel.isValidInput {
                    Text("Please enter a number between 1 and 100.")
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.horizontal)
                        .transition(.opacity)
                }
            }
            
            Button {
                Task {
                    if let countInt = Int(count), countInt > 0 && countInt <= 100 {
                        await viewModel.fetchVehicles(count: countInt)
                    } else {
                        viewModel.vehicles = []
                    }
                }
            } label: {
                Text("Fetch Vehicles")
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .foregroundColor(.white)
            .background(!viewModel.isValidInput ? Color.gray : Color.blue)
            .cornerRadius(10)
            .padding(.horizontal)
            .disabled(!viewModel.isValidInput)
        }
    }
    
    // Filter section for sorting options
    private var filterSection: some View {
        Section("Filter by") {
            Picker("Sort by", selection: $viewModel.sortByVin) {
                Text("VIN").tag(true)
                Text("Car Type").tag(false)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .onChange(of: viewModel.sortByVin) { _ in
                viewModel.toggleSortOption()
            }
        }
    }
    
    // List section to display vehicles
    private var vehicleListSection: some View {
        List(viewModel.vehicles) { vehicle in
            NavigationLink(destination: VehicleDetailView(viewModel: VehicleDetailViewModel(vehicle: vehicle))) {
                VStack(alignment: .leading) {
                    Text(vehicle.makeAndModel)
                        .font(.headline)
                    Text("VIN: \(vehicle.vin)")
                        .font(.subheadline)
                }
            }
        }
    }
}


#Preview {
    VehicleListView(viewModel: VehicleListViewModel(service: APIService()))
}
