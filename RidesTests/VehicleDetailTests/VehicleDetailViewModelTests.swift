//
//  VehicleDetailViewModelTests.swift
//  RidesTests
//
//  Created by Chirag Anghan on 2024-09-21.
//

import XCTest
@testable import Rides

class VehicleDetailViewModelTests: XCTestCase {

    func testCalculateCarbonEmissions_UnderOrEqual5000Km() {
        let vehicle = Vehicle(vin: "123456", makeAndModel: "Toyota Prius", color: "Red", carType: "Sedan", kilometrage: 3000)
        let viewModel = VehicleDetailViewModel(vehicle: vehicle)

        let emissions = viewModel.calculateCarbonEmissions(for: vehicle.kilometrage)

        XCTAssertEqual(emissions, 3000.0, "Emissions should be equal to the kilometrage when under 5000 km.")
    }

    func testCalculateCarbonEmissions_Over5000Km() {
        let vehicle = Vehicle(vin: "123456", makeAndModel: "Toyota Prius", color: "Red", carType: "Sedan", kilometrage: 7000)
        let viewModel = VehicleDetailViewModel(vehicle: vehicle)

        let emissions = viewModel.calculateCarbonEmissions(for: vehicle.kilometrage)

        let expectedEmissions = (5000 * 1.0) + (2000 * 1.5)
        XCTAssertEqual(emissions, expectedEmissions, "Emissions should be 1.5 times of vehicle km when over 5000 km.")
    }
}
