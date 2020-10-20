//
//  ImageView.swift
//  TestApp
//
//  Created by Константин Лопаткин on 16.10.2020.
//

import SwiftUI

struct ImageView: View {
    @State var width: CGFloat
    @State var height: CGFloat
    @Binding var image: Data
    
    var body: some View {
        if self.image.count != 0 {
        Image(uiImage: UIImage(data: self.image)!)
            .resizable()
            .frame(width: width, height: height)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
            .shadow(radius: 10)
        } else {
            Image("noimage")
                .resizable()
                .frame(width: width, height: height)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                .shadow(radius: 10)
        }
            
    }
}

//struct ImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageView(width: 200.0, height: 200.0, image: )
//    }
//}
