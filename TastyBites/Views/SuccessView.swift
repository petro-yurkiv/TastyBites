//
//  SuccessView.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 28.05.2024.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        VStack {
            Image(systemName: "checkmark.circle")
                .font(.system(size: 72.0))
                .foregroundStyle(Color(AppColor.accent.rawValue))
        }
        .background(.white)
    }
}

#Preview {
    SuccessView()
}
