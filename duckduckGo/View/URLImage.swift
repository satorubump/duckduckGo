//
//  URLImage.swift
//  duckduckGo
//
//  Created by Satoru Ishii on 5/8/21.
//

import SwiftUI

///
///  URLImage Component Libraly
///   - A Sincronized Image Downloading from URL with Placeholder Image
///
///   Usage:  URLImage(url: <Image URL>)
///
struct URLImage: View {
    // Observed Image Downloading ViewModel
    @ObservedObject private var imageLoader = ImageLoader.shared
    @State var height : CGFloat
    let url: String

    // Initialize & Downloading Start
    init(url: String, height: CGFloat = Constants.ImageWidth) {
        self.url = url
        self.height = height
        self.imageLoader.downloadImage(url: self.url)
    }

    // View Part
    var body: some View {

        // After Image Downloading
        if let imageData = self.imageLoader.downloadData {
            let img = UIImage(data: imageData)
            return VStack {
                    Image(uiImage: img!)
                        .resizable()
                        .frame(width: height * Constants.ImageAspectRatio, height: height)
                        .aspectRatio(Constants.ImageAspectRatio, contentMode: .fit)
            }
        }
        // Before Image Downloading Set the Placeholder
        else {
            return VStack {
                Image(uiImage: UIImage(systemName: Constants.PlaceholderImage)!)
                    .resizable()
                    .frame(height: height)
                    .aspectRatio(Constants.ImageAspectRatio, contentMode: .fit)
            }
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "")
    }
}
