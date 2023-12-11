//
//  LocalizedTitleTextView.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 11.12.2023.
//

import SwiftUI


struct LocalizedTitleTextView: View {
    var text: LocalizedStringKey
    
    var body: some View {
        Text(text)
            .font(.title)
            .bold()
            .padding()
    }
}
