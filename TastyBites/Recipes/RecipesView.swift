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
                    title
                }
                
                VStack(spacing: 16.0) {
                    SearchField()
                    category
                    recipes(geometry)
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
    
    var title: some View {
        VStack(alignment: .leading) {
            Text("Hi, User")
                .font(.system(size: 32.0, weight: .medium))
            Text("What do you want to cook?")
                .font(.system(size: 20.0, weight: .regular))
        }
        .foregroundStyle(Color(AppColor.secondary.rawValue))
    }
    
    var category: some View {
        VStack(alignment: .leading) {
            Text("Category")
                .foregroundStyle(Color(AppColor.secondary.rawValue))
                .font(.system(size: 24.0, weight: .medium))
            categoriesStack(viewModel.categories)
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
        Button(category) {
            selectedIndex = index
        }
        .font(.system(size: 16.0))
        .foregroundStyle(selectedIndex == index ? Color.white : Color(AppColor.object.rawValue))
        .padding(.horizontal, 16.0)
        .padding(.vertical, 8.0)
        .background(selectedIndex == index ? Color(AppColor.accent.rawValue) : Color(AppColor.light.rawValue))
        .cornerRadius(8.0)
    }
    
    func recipes(_ geometry: GeometryProxy) -> some View {
        VStack(alignment: .leading) {
            Text("Recipes")
                .foregroundStyle(Color(AppColor.secondary.rawValue))
                .font(.system(size: 24.0, weight: .medium))
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, content: {
                    ForEach(Array(viewModel.recipes.enumerated()), id: \.element) { element, index in
                        RecipeCell {
                            print("like")
                        } onTap: {
                            viewModel.goToRecipe()
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
