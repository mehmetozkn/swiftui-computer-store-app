//
//  ComputerImageView.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 21.09.2023.
//

import SwiftUI

struct ComputerImageView: View {
    private let url: String
    @ObservedObject var imageDownloader = ImageDownloader()

    init(url: String) {
        self.url = url
        self.imageDownloader.imageDownload(url: self.url)
    }

    var body: some View {
        if let data = self.imageDownloader.downloadedImage {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
           
                
        } else {
            return Image("placeholder")
                .resizable()

        }
    }
}

#Preview {
    ComputerImageView(url: "https://firebasestorage.googleapis.com/v0/b/marketapp-fd5d2.appspot.com/o/lenova.jpeg?alt=media&token=44d3417e-869f-4cdc-acdf-cfb0d07c786c")
}
