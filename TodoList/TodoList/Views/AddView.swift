//
//  AddView.swift
//  TodoList
//
//  Created by MACBOOK M1 on 17/06/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(uiColor: .placeholderText))
                    .cornerRadius(15)
                    .padding(.leading)
                    .padding(.trailing)
             
                ScrollView(.horizontal){
                    HStack{
                        TypeItemButton(iconButton: "Work", textButton: "Work")
                        TypeItemButton(iconButton: "Life", textButton: "Life")
                        TypeItemButton(iconButton: "Study", textButton: "Study")
                    }
                }
                .padding(.leading)
                .padding(.top)
                .scrollIndicators(.hidden)
                
             
                Button (action: saveButtonPressed, label: {
                    HStack{
                        Text("Save")
                        Image(systemName: "square.and.arrow.down")
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color("Selected"))
                    .foregroundColor(.black)
                    .cornerRadius(25)
                })
                .padding(.leading)
                .padding(.trailing)
                .padding(.top)
                
            }
           
        }
        .navigationTitle("Add an Item ✒️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        if textIsApproprieate(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsApproprieate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters.😰"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
