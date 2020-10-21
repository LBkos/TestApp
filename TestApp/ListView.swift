//
//  ListView.swift
//  TestApp
//
//  Created by Константин Лопаткин on 20.10.2020.
//

import SwiftUI

struct ListView: View {
    
    @State var image: Data
    @State var name: String
    @State var show: Bool = false
    @State var number: String
    @State var email: String
    var newName: String
    var body: some View {
                NavigationLink(
                    destination: PersonView(image: $image, name: name, number: number, email: email, newName: newName),
                    label: {
                        PersonItem(name: name, image: $image)
                    })
        
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}
