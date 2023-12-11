//
//  CustomAuthView.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 11.12.2023.
//

import SwiftUI

struct CustomAuthView: View {
    var body: some View {
        Color.blue
            .ignoresSafeArea()
        Circle()
            .scale(1.7)
            .foregroundColor(.white.opacity(0.15))
        Circle()
            .scale(1.35)
            .foregroundColor(.white)
    }
}

#Preview {
    CustomAuthView()
}
