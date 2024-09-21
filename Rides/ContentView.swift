//
//  ContentView.swift
//  Rides
//
//  Created by Chirag Anghan on 2024-09-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VehicleListView(viewModel: VehicleListViewModel(service: APIService()))
    }
}

#Preview {
    ContentView()
}
