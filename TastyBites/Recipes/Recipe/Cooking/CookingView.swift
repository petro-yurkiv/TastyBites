//
//  CookingView.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 28.05.2024.
//

import SwiftUI

struct CookingView: View {
    @ObservedObject var viewModel: CookingViewModel
    @State private var selectedIndex = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 16.0) {
                title("Step \(selectedIndex + 1)")
                    .padding(.top, 16.0)
                steps(viewModel.steps)
                recipeImage(geometry)
                advice("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor")
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                    .font(.system(size: 20.0, weight: .regular))
                    .foregroundStyle(Color(AppColor.text.rawValue))
                
                Spacer()
                
                SpecialButton(title: selectedIndex == 4 ? "Finish" : "Next", isAccent: true) {
                    if selectedIndex == 4 {
                        print("Done")
                        viewModel.finish()
                    }
                    
                    if selectedIndex < 4 {
                        selectedIndex += 1
                    }
                }
                
                SpecialButton(title: "Back", isAccent: false) {
                    if selectedIndex > 0 {
                        selectedIndex -= 1
                    }
                }
                .padding(.bottom, 16.0)
            }
            .navigationTitle("Cooking")
            .padding(.horizontal, 16.0)
        }
    }
    
    func title(_ text: String) -> some View {
        HStack {
            Text(text)
                .font(.system(size: 32.0, weight: .medium))
                .foregroundStyle(Color(AppColor.secondary.rawValue))
            Spacer()
        }
    }
    
    // TODO: add scroll logic
    
    func steps(_ items: [String]) -> some View {
//        ScrollView(.horizontal) {
            HStack {
                ForEach(Array(items.enumerated()), id: \.element) { index, category in
                    itemButton(step: category, index: index)
                }
            }
//        }
//        .scrollIndicators(.hidden)
    }
    
    func itemButton(step: String, index: Int) -> some View {
        Button {
            selectedIndex = index
        } label: {
            HStack {
                Spacer()
                Text(step)
                Spacer()
            }
            .font(.system(size: 16.0))
            .foregroundStyle(selectedIndex == index ? Color.white : Color(AppColor.object.rawValue))
            .padding(.horizontal, 16.0)
            .padding(.vertical, 8.0)
            .background(selectedIndex == index ? Color(AppColor.accent.rawValue) : Color(AppColor.light.rawValue))
            .cornerRadius(8.0)
        }
    }
    
    func recipeImage(_ geometry: GeometryProxy) -> some View {
        AsyncImage(url: URL(string: "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg")) { result in
            result.image?
                .resizable()
                .scaledToFill()
        }
        .frame(width: geometry.size.width - 32.0, height: geometry.size.height / 3)
        .cornerRadius(8.0)
    }
    
    func advice(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 16.0, weight: .regular))
            .foregroundStyle(Color(AppColor.object.rawValue))
            .padding(8.0)
            .background(Color(AppColor.light.rawValue))
            .cornerRadius(8.0)
    }
}

#Preview {
    CookingView(viewModel: CookingViewModel())
}
