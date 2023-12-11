//
//  SwiftUIView.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 11.12.2023.
//

import SwiftUI

struct CustomButtonView: View {
    let title: LocalizedStringKey
    var action: () -> Void

    var body: some View {
        Button(title) {
            action()
        }
        .foregroundColor(.white)
        .frame(width: AppConstants.Sizes.generalButtonWidthValue, height: AppConstants.Sizes.generalButtonHeightValue)
        .background(Color.blue)
        .cornerRadius(AppConstants.Radius.radiusValue)
    }
}
