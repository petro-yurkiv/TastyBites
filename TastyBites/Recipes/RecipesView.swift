//
//  HomeView.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 24.05.2024.
//

import SwiftUI

struct RecipesView: View {
    @ObservedObject var viewModel: RecipesViewModel
    @State private var selectedIndex: Int = 0
    private let columns: [GridItem] = [
        GridItem(.flexible(minimum: 100.0, maximum: 200.0)),
        GridItem(.flexible(minimum: 100.0, maximum: 200.0))
    ]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 0.0) {
                if viewModel.screenType == .home {
                    title("Hi, User")
                }
                
                VStack(spacing: 16.0) {
                    SearchField()
                    category(viewModel.categories) {
                        
                    }
                    
                    recipes(geometry) {
                        viewModel.goToRecipe()
                    }
                }
                .padding(.top, 16.0)
            }
            .padding(.horizontal, 16.0)
        }
        .navigationTitle(setTitle())
    }
    
    func setTitle() -> String {
        switch viewModel.screenType {
        case .home:
            return ""
        case .myRecipes:
            return "My recipes"
        case .liked:
            return "Liked"
        }
    }
}

extension RecipesView {
    func title(_ text: String) -> some View {
        VStack(alignment: .leading) {
            Text(text)
                .font(.system(size: 32.0, weight: .medium))
            Text("What do you want to cook?")
                .font(.system(size: 20.0, weight: .regular))
        }
        .foregroundStyle(Color(AppColor.secondary.rawValue))
    }
    
    func subtitle(_ text: String) -> some View {
        Text(text)
            .foregroundStyle(Color(AppColor.secondary.rawValue))
            .font(.system(size: 24.0, weight: .medium))
    }
    
    func category(_ categories: [String], action: @escaping () -> Void) -> some View {
        VStack(alignment: .leading) {
            subtitle("Category")
            categoriesStack(categories, action: action)
        }
    }
    
    func categoriesStack(_ items: [String], action: @escaping () -> Void) -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(Array(items.enumerated()), id: \.element) { index, category in
                    categoryButton(category: category, index: index) {
                        action()
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
    
    func categoryButton(category: String, index: Int, action: @escaping () -> Void) -> some View {
        Button(category) {
            action()
            selectedIndex = index
        }
        .font(.system(size: 16.0))
        .foregroundStyle(selectedIndex == index ? Color.white : Color(AppColor.object.rawValue))
        .padding(.horizontal, 16.0)
        .padding(.vertical, 8.0)
        .background(selectedIndex == index ? Color(AppColor.accent.rawValue) : Color(AppColor.light.rawValue))
        .cornerRadius(8.0)
    }
    
    // TODO: like action
    
    func recipes(_ geometry: GeometryProxy, action: @escaping () -> Void) -> some View {
        VStack(alignment: .leading) {
            subtitle("Recipes")
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, content: {
                    ForEach(Array(viewModel.recipes.enumerated()), id: \.element) { element, index in
                        RecipeCell {
                            print("like")
                        } onTap: {
                            action()
                        }
                        .frame(height: geometry.size.height / 3)
                    }
                })
                .padding(.bottom, 16.0)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    RecipesView(viewModel: RecipesViewModel(screenType: .home))
}
