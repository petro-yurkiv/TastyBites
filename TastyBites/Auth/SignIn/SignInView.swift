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
    @State private var email = ""
    
    var body: some View {
        VStack {
            //            Text(viewModel.text ?? "")
            //                .padding()
            //                .foregroundColor(.red)
            //
            //            Button("Tap") {
            //                viewModel.signIn()
            //            }
            //
            //            Button("Sign Up") {
            //                viewModel.goToSignUp()
            //            }
            
            container
        }
    }
    
    private var container: some View {
        VStack(spacing: 16.0) {
            mainTextContainer
            textFieldsContainer
            socialButtonContainer
            singInButtonContainer
            signUpContainer
        }
        .padding(.horizontal, 16.0)
    }
    
    private var mainTextContainer: some View {
        Text("Sign in")
            .font(.title)
            .fontWeight(.medium)
            .foregroundStyle(Color(AppColor.secondary.rawValue))
    }
    
    private var textFieldsContainer: some View {
        VStack(spacing: 16.0) {
            SignTextField(text: text, placeholder: "Email")
            
            SignTextField(text: text, placeholder: "Password")
            
            HStack {
                Spacer()
                
                Button {
                    viewModel.signIn()
                } label: {
                    Text("Forgot password?")
                        .foregroundStyle(Color(AppColor.secondary.rawValue))
                }
                
            }
        }
    }
    
    private var socialButtonContainer: some View {
        HStack(spacing: 12.0) {
            HStack {
                Image(AppImage.google.rawValue)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(lineWidth: 1.0)
                    .foregroundStyle((Color(AppColor.secondary.rawValue)))
            )
            .onTapGesture {
                print("Google tapped!!!")
            }
            HStack {
                Image(AppImage.apple.rawValue)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(lineWidth: 1.0)
                    .foregroundStyle((Color(AppColor.secondary.rawValue)))
            )
            .onTapGesture {
                print("Apple tapped!!!")
            }
        }
    }
    
    private var singInButtonContainer: some View {
        VStack {
            Button {
                print("SIGN IN TAPPED!!!")
            } label: {
                Text("Sign in")
                    .padding()
                    .foregroundStyle(.white)
                    .font(.system(size: 16.0, weight: .medium))
                    .frame(maxWidth: .infinity)
                    .background((Color(AppColor.secondary.rawValue)))
                    .cornerRadius(8.0)
            }
        }
    }
    
    private var signUpContainer: some View {
        HStack(spacing: 8.0) {
            Text("Don't have an account?")
                .font(.system(size: 16.0, weight: .regular))
                .foregroundStyle(.black)
                
            Button {
                print("SignUP Tapped!!!")
            } label: {
                Text("Sign up")
                    .font(.system(size: 16.0, weight: .regular))
                    .foregroundStyle((Color(AppColor.secondary.rawValue)))
            }
            
            Spacer()
        }
    }
}

#Preview {
    SignInView(viewModel: SignInViewModel())
}
