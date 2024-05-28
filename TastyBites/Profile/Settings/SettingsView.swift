//
//  SettingsView.swift
//  TastyBites
//
//  Created by Petro Yurkiv on 28.05.2024.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Toggle("Notifications", isOn: $isOn)
                    .font(.system(size: 20.0, weight: .regular))
                    .foregroundStyle(Color(AppColor.secondary.rawValue))
            }
            .padding(.top, 16.0)
            
            Spacer()
        }
        .navigationTitle("Settings")
        .padding(.horizontal, 16.0)
    }
}

#Preview {
    SettingsView(viewModel: SettingsViewModel())
}
