//
//  SignUpView.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @State private var text = String()
    
    var body: some View {
        VStack {
            Text(viewModel.text ?? "")
                .padding()
                .foregroundColor(.red)
            
            Button("Tap") {
                viewModel.signUp()
            }
            
            Button("Sign In") {
                viewModel.goToSignIn()
            }
        }
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel())
}
