//
//  AddRecipeView.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import SwiftUI

struct AddRecipeView: View {
    @ObservedObject var viewModel: AddRecipeViewModel
    @State private var text = String()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    AddRecipeTextField()
                    Subtitle(text: "Photo")
                    addPhoto(geometry) {
                        
                    }
                    
                    category(text: "Category", categories: viewModel.categories) {
                        
                    }
                }
                .padding(.horizontal, 16.0)
            }
            .scrollIndicators(.hidden)
        }
    }
    
    func addPhoto(_ geometry: GeometryProxy, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            ZStack {
                Text("+")
                    .font(.system(size: 32.0, weight: .bold))
                    .foregroundStyle(Color(AppColor.object.rawValue))
            }
            .frame(width: geometry.size.width - 32.0, height: 176.0)
            .background(Color(AppColor.light.rawValue))
            .cornerRadius(8.0)
        }
    }
    
    func addButton(action: @escaping () -> Void) -> some View {
        Button("+") {
            action()
        }
        .font(.system(size: 16.0, weight: .bold))
        .foregroundStyle(.white)
        .padding(.horizontal, 8.0)
        .padding(.vertical, 4.0)
        .background(Color(AppColor.accent.rawValue))
        .cornerRadius(8.0)
    }
    
    func category(text: String, categories: [String], action: @escaping () -> Void) -> some View {
        VStack {
            HStack {
                Subtitle(text: text)
                
                Spacer()
                
                addButton {
                    action()
                }
            }
            
            categoriesStack(categories)
        }
    }
    
    func categoriesStack(_ items: [String]) -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(Array(items.enumerated()), id: \.element) { index, category in
                    categoryButton(category: category, index: index)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
    
    func categoryButton(category: String, index: Int) -> some View {
        Text(category)
            .font(.system(size: 16.0))
            .foregroundStyle(Color(AppColor.object.rawValue))
            .padding(.horizontal, 16.0)
            .padding(.vertical, 8.0)
            .background(Color(AppColor.light.rawValue))
            .cornerRadius(8.0)
    }
}

#Preview {
    AddRecipeView(viewModel: AddRecipeViewModel())
}
