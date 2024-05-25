//
//  ProfileView.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
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
        .onAppear {
            print(viewModel.coordinator?.parentCoordinator.childCoordinators)
        }
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel())
}
