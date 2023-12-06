//
//  AuthScreenView.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 7.12.2023.
//

import SwiftUI

struct AuthScreenView: View {
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
    AuthScreenView()
}
