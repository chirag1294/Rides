//
//  APIService.swift
//  Rides
//
//  Created by Chirag Anghan on 2024-09-21.
//
import Foundation

protocol APIServiceDelegate {
    func fetch<T: Decodable>(from urlString: String, expecting: T.Type) async throws -> T
}

class APIService: APIServiceDelegate {
    func fetch<T: Decodable>(from urlString: String, expecting: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}
