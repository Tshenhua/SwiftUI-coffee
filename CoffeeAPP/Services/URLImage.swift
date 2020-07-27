//
//  URLImage.swift
//  CoffeeAPP
//
//  Created by Medcon on 2020/7/27.
//

import SwiftUI


struct URLImage:View {
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url:String,placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        } else {
           return Image(self.placeholder)
            .resizable()
        }
    }
}
