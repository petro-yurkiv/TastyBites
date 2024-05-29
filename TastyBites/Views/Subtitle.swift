//
//  Subtitle.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 29.05.2024.
//

import SwiftUI

struct Subtitle: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 24.0, weight: .medium))
            .foregroundStyle(Color(AppColor.secondary.rawValue))
    }
}

#Preview {
    Subtitle(text: "Hello")
}
