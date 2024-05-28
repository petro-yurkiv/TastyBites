//
//  SearchField.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import SwiftUI

struct SearchField: View {
    @State var searchText = String()
    @State var isEdited: Bool = false
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color(AppColor.object.rawValue))
                TextField("Search", text: $searchText)
                    .foregroundStyle(Color(AppColor.secondary.rawValue))
                
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(Color(AppColor.object.rawValue))
                }
            }
            .padding(8.0)
            .background(Color(AppColor.light.rawValue))
            .cornerRadius(8.0)
            
            if isEdited == true {
                Button("Cancel") {
                    isEdited.toggle()
                }
            }
        }
        .onChange(of: searchText) { newValue in
            withAnimation {
                isEdited = false
                if !searchText.isEmpty {
                    isEdited.toggle()
                }
            }
        }
    }
}

#Preview {
    SearchField()
}
