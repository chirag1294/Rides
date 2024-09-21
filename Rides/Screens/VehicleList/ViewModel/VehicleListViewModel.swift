//
//  VehicleListViewModel.swift
//  Rides
//
//  Created by Chirag Anghan on 2024-09-21.
//

import Foundation

class VehicleListViewModel: ObservableObject {
    @Published var vehicles: [Vehicle] = []
    @Published var sortByVin: Bool = true
    
    private let service: APIServiceDelegate
    
    init(service: APIServiceDelegate) {
        self.service = service
    }
    
    @MainActor
    func fetchVehicles(count: Int) async {
        let url = "https://random-data-api.com/api/vehicle/random_vehicle?size=\(count)"
        
        do {
            let fetchedVehicles = try await service.fetch(from: url, expecting: [Vehicle].self)
            vehicles = sortByVin ? fetchedVehicles.sorted(by: { $0.vin < $1.vin }) : fetchedVehicles.sorted(by: { $0.carType < $1.carType })
        } catch {
            vehicles = []
            print("Failed to fetch Vehicles.")
        }
    }
    
    func toggleSortOption() {
        sortByVin.toggle()
        vehicles = sortByVin ? vehicles.sorted(by: { $0.vin < $1.vin }) : vehicles.sorted(by: { $0.carType < $1.carType })
    }
}
