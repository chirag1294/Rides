//
//  Vehicle.swift
//  Rides
//
//  Created by Chirag Anghan on 2024-09-21.
//

import Foundation

struct Vehicle: Identifiable, Codable {
    let id: UUID = UUID()
    let vin: String
    let makeAndModel: String
    let color: String
    let carType: String
    let kilometrage: Int

    enum CodingKeys: String, CodingKey {
        case vin
        case makeAndModel = "make_and_model"
        case color
        case carType = "car_type"
        case kilometrage
    }
}

extension Vehicle {
    static let mockVehicle = Vehicle(
        vin: "1234567890",
        makeAndModel: "Toyota Prius",
        color: "Red",
        carType: "Sedan",
        kilometrage: 10000
    )
}
