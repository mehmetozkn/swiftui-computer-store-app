//
//  ComputerImageView.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 21.09.2023.
//

import SwiftUI
import Kingfisher

struct ComputerImageView: View {
     let imageUrl: String
  
    var body: some View {
        VStack {
            KFImage(URL(string: imageUrl))
                .resizable()

        }
    }
}

#Preview {
    ComputerImageView(imageUrl: "https://firebasestorage.googleapis.com/v0/b/marketapp-fd5d2.appspot.com/o/lenova.jpeg?alt=media&token=44d3417e-869f-4cdc-acdf-cfb0d07c786c")
}
