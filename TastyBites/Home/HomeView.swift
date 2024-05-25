//
//  HomeView.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 24.05.2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State private var text = String()
    
    var body: some View {
        VStack {
            Text(viewModel.text ?? "")
                .padding()
                .foregroundColor(.red)
            
            Button("Tap") {
                viewModel.onTap()
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
