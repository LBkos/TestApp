//
//  PersonItem.swift
//  TestApp
//
//  Created by Константин Лопаткин on 16.10.2020.
//

import SwiftUI

struct PersonItem: View {
    var name: String
    @Binding var image: Data
    var body: some View {
        HStack {
            ImageView(width: 50.0, height: 50.0, image: $image)
            Text(name)
                .font(.title3)
                .padding(10)
        }
    }
}

//struct PersonItem_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonItem(name: "Jorg", image: )
//    }
//}
