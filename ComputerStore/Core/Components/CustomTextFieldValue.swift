//
//  CustomTextFieldValue.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 11.12.2023.
//

import SwiftUI

struct CustomTextFieldView: View {
    let placeholder: LocalizedStringKey
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .frame(width: AppConstants.Sizes.textFieldWidthValue, height: AppConstants.Sizes.textFieldHeightValue)
            .background(Color.black.opacity(AppConstants.Theme.textFieldOpacityValue))
            .cornerRadius(AppConstants.Radius.radiusValue)
            .textInputAutocapitalization(.never)
    }
}
