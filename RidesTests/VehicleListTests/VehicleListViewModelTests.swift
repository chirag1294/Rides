//
//  VehicleListViewModelTests.swift
//  RidesTests
//
//  Created by Chirag Anghan on 2024-09-21.
//

import XCTest
@testable import Rides

class VehicleListViewModelTests: XCTestCase {
    func testValidInput() {
        let mockService = MockAPIService()
        let viewModel = VehicleListViewModel(service: mockService)
        
        viewModel.validateInput("")
        XCTAssertTrue(viewModel.isValidInput)
        
        viewModel.validateInput("50")
        XCTAssertTrue(viewModel.isValidInput)
        
        viewModel.validateInput("050")
        XCTAssertTrue(viewModel.isValidInput)
    }
    
    func testInvalidInput() {
        let mockService = MockAPIService()
        let viewModel = VehicleListViewModel(service: mockService)
        
        viewModel.validateInput("0")
        XCTAssertFalse(viewModel.isValidInput)
        
        viewModel.validateInput("abc")
        XCTAssertFalse(viewModel.isValidInput)
        
        viewModel.validateInput("150")
        XCTAssertFalse(viewModel.isValidInput)
    }
}
