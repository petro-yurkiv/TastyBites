//
//  RecipeView.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 27.05.2024.
//

import SwiftUI

struct RecipeView: View {
    @ObservedObject var viewModel: RecipeViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                recipeImage(geometry, urlString: "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg")
                    .padding(.top, 24.0)
                content(time: 30, kkal: 500, ingredients: viewModel.ingredients)
                    .padding(.horizontal, 16.0)
                    .background(.white)
                    .cornerRadius(8.0)
                
                Spacer()
                
                SpecialButton(title: "Start cooking", isAccent: true) {
                    viewModel.goToCooking()
                }
                .frame(width: geometry.size.width - 32.0)
                .padding(.bottom, 16.0)
            }
            .navigationTitle("Recipe")
        }
    }
}

extension RecipeView {
    func recipeImage(_ geometry: GeometryProxy, urlString: String) -> some View {
        AsyncImage(url: URL(string: urlString)) { result in
            result.image?
                .resizable()
                .scaledToFill()
        }
        .frame(width: geometry.size.width, height: geometry.size.height / 3)
    }
    
    func content(time: Int, kkal: Int, ingredients: [String]) -> some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text("Dish with strowberry")
                .font(.system(size: 32.0, weight: .medium))
                .padding(.top, 16.0)
            
            HStack {
                indicator(icon: "clock", title: "\(time) min")
                indicator(icon: "bolt", title: "\(kkal) kkal")
            }
            
            Subtitle(text: "Ingredients")
                .padding(.top, 8)
            
            ingredientsView(ingredients)
                .padding(.top, 8)
        }
        .foregroundStyle(Color(AppColor.secondary.rawValue))
    }
                         
    func indicator(icon: String, title: String) -> some View {
        HStack {
            Image(systemName: icon)
            Text(title)
        }
        .font(.system(size: 16.0, weight: .regular))
    }
    
    func ingredientsView(_ items: [String]) -> some View {
        VStack(spacing: 16.0) {
            ForEach(items, id: \.self) { item in
                ingredientCell(item)
            }
        }
    }
    
    func ingredientCell(_ item: String) -> some View {
        HStack {
            Text(item)
            Spacer()
            Text("100 g.")
        }
        .font(.system(size: 16.0, weight: .regular))
        .foregroundStyle(Color(AppColor.text.rawValue))
    }
}

#Preview {
    RecipeView(viewModel: RecipeViewModel())
}
