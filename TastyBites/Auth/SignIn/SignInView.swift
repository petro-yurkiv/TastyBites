//
//  SignInView.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var viewModel: SignInViewModel
    @State private var text = String()
    
    var body: some View {
        VStack {
            Text(viewModel.text ?? "")
                .padding()
                .foregroundColor(.red)
            
            Button("Tap") {
                viewModel.signIn()
            }
            
            Button("Sign Up") {
                viewModel.goToSignUp()
            }
        }
    }
}

#Preview {
    SignInView(viewModel: SignInViewModel())
}
