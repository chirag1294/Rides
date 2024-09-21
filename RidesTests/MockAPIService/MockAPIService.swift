//
//  MockAPIService.swift
//  RidesTests
//
//  Created by Chirag Anghan on 2024-09-21.
//

import Foundation
@testable import Rides

class MockAPIService: APIServiceDelegate {
    var shouldReturnError = false
    var mockData: Data?
    var error: Error?
    
    func fetch<T: Decodable>(from urlString: String, expecting: T.Type) async throws -> T {
        
        if shouldReturnError {
            throw error ?? URLError(.badServerResponse)
        }
        
        guard let mockData = mockData else {
            throw URLError(.badURL)
        }
        
        let decodedData = try JSONDecoder().decode(T.self, from: mockData)
        return decodedData
    }
}

