//
//  ImageView.swift
//  TestApp
//
//  Created by Константин Лопаткин on 16.10.2020.
//

import SwiftUI

struct ImageView: View {

    var width: CGFloat
    var height: CGFloat
    var image: Data

    var body: some View {
        if image.count != 0 {
            Image(uiImage: UIImage(data: image)!)
            .resizable()
            .frame(width: width, height: width)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
            .shadow(radius: 10)
        } else {
            Image("noimage")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                .shadow(radius: 10)
        }
    }
}
