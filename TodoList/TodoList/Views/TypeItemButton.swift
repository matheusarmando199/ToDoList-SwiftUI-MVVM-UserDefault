//
//  TypeItemButton.swift
//  TodoList
//
//  Created by MACBOOK M1 on 01/07/23.
//

import SwiftUI

struct TypeItemButton: View {
    @State private var isButtonClicked = false
    @State var iconButton: String
    @State var textButton: String
    
    var body: some View {
        Button(action: {
            isButtonClicked.toggle()
        }) {
            HStack {
                Image(iconButton)
                    .resizable()
                    .frame(width: 70, height: 70)
                Text(textButton)
                    .foregroundColor(isButtonClicked ? .white : .black)
                    .font(.headline)
            }
            .padding()
            .background(isButtonClicked ? Color("Selected") : Color("NonSelected"))
            .cornerRadius(10)
        }
    }
}

struct TypeItemButton_Previews: PreviewProvider {
    static var previews: some View {
        TypeItemButton(iconButton: "Work", textButton: "testeasdasdad")
    }
}
