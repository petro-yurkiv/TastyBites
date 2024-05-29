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
                VStack(alignment: .leading, spacing: 16.0) {
                    AddRecipeTextField()
                    
                    VStack(alignment: .leading) {
                        Subtitle(text: "Photo")
                        addPhoto(geometry) {
                            
                        }
                    }
                    
                    category(categories: viewModel.categories) {
                        
                    }
                    
                    addIngredients(items: viewModel.ingredients) {
                        
                    }
                    
                    addStep(geometry, num: 1) {
                        
                    } addPhotoAction: {
                        
                    }
                    .padding(.bottom, 16.0)
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
    
    func category(categories: [String], action: @escaping () -> Void) -> some View {
        VStack {
            HStack {
                Subtitle(text: "Category")
                
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
    
    func addIngredients(items: [String], action: @escaping () -> Void) -> some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Subtitle(text: "Ingredients")
            ingredientsView(items)
            SpecialButton(title: "Add ingredient", isAccent: true) {
                action()
            }
        }
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
    
    func addStep(_ geometry: GeometryProxy, num: Int, addStepAction: @escaping () -> Void, addPhotoAction: @escaping () -> Void) -> some View {
        VStack {
            HStack {
                Subtitle(text: "Step \(num)")
                Spacer()
                addButton {
                    addStepAction()
                }
            }
            
            addPhoto(geometry) {
                addPhotoAction()
            }
            
            addTextView("Advice")
            addTextView("Description")
        }
    }
    
    func addTextView(_ text: String) -> some View {
        VStack(alignment: .leading) {
            Subtitle(text: text)
            textView()
        }
    }
    
    func textView() -> some View {
        TextEditor(text: $text)
            .frame(height: 80.0)
            .border(Color(AppColor.object.rawValue), width: 1.0)
    }
}

#Preview {
    AddRecipeView(viewModel: AddRecipeViewModel())
}
