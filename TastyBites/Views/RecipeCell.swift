//
//  RecipeCell.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 25.05.2024.
//

import SwiftUI

struct RecipeCell: View {
    var likeAction: () -> Void
    var onTap: () -> Void
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                AsyncImage(url: URL(string: "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg")) { result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                
                content
                    .padding(8.0)
                    .foregroundStyle(.white)
            }
            .cornerRadius(8.0)
            .onTapGesture {
                onTap()
            }
        })
    }
    
    var content: some View {
        VStack {
            heartView
            
            Spacer()
            
            HStack {
                Text("Dish with strowberry")
                    .font(.system(size: 20.0, weight: .medium))
                Spacer()
            }
            
            HStack {
                indicator(icon: "clock", title: "30 min")
                indicator(icon: "bolt", title: "500 kkal")
            }
        }
    }
    
    var heartView: some View {
        HStack {
            Spacer()
            
            Button(action: {
                likeAction()
            }, label: {
                Image(systemName: "heart")
            })
        }
    }
    
    func indicator(icon: String, title: String) -> some View {
        HStack {
            Image(systemName: icon)
            Text(title)
        }
        .font(.system(size: 13.0, weight: .regular))
    }
}

#Preview {
    RecipeCell {
        
    } onTap: {
        
    }
}
