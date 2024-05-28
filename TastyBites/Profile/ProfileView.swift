//
//  ProfileView.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        GeometryReader(content: { geometry in
            VStack {
                userView(geometry)
                    .padding(.top, 24.0)
                
                aboutMe()
                    .padding(.top, 16.0)
                
                Spacer()
                
                VStack(spacing: 16.0) {
                    SpecialButton(title: "My recipes", isAccent: true) {
                        
                    }
                    
                    SpecialButton(title: "Liked", isAccent: true) {
                        
                    }
                    
                    SpecialButton(title: "Sign out", isAccent: false) {
                        
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 16.0)
        })
        .navigationTitle("Profile")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    viewModel.goToSettings()
                }) {
                    Image(systemName: "gearshape")
                        .foregroundStyle(.black)
                }
            }
        }
    }
    
    func userView(_ geometry: GeometryProxy) -> some View {
        VStack {
            userImage(geometry)
            personalInfo()
        }
    }
    
    func userImage(_ geometry: GeometryProxy) -> some View {
        AsyncImage(url: URL(string: "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg")) { result in
            result.image?
                .resizable()
                .scaledToFill()
        }
        .frame(width: geometry.size.width / 4, height: geometry.size.width / 4)
        .cornerRadius(geometry.size.width / 8)
    }
    
    func personalInfo() -> some View {
        VStack {
            Text("Petro")
                .font(.system(size: 24.0, weight: .medium))
            Text("Ukraine, Lviv")
                .font(.system(size: 14.0, weight: .regular))
        }
        .foregroundStyle(Color(AppColor.secondary.rawValue))
    }
    
    func aboutMe() -> some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text("About me")
                .font(.system(size: 24.0, weight: .medium))
                .foregroundStyle(Color(AppColor.secondary.rawValue))
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                .font(.system(size: 16.0, weight: .regular))
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel())
}
