//
//  AddStoreView.swift
//  GroceryApp
//
//  Created by Faraz Haider on 16/02/2021.
//

import SwiftUI

struct AddStoreView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var addStoreVm = AddStoreViewModel()
    
    var body: some View {
        
        Form{
            Section{
                TextField("Name", text: $addStoreVm.name)
                TextField("Address", text: $addStoreVm.address)
                
                HStack{
                    Spacer()
                    Button(action: {
                        addStoreVm.save()
                    }, label: {
                        Text("Save")
                    }).onChange(of: addStoreVm.saved, perform: { value in
                        if value{
                            presentationMode.wrappedValue.dismiss()
                        }
                    })
                    Spacer()
                }
                Text(addStoreVm.message)
            }
        }.navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
        }))
        .navigationTitle("Add New Store")
        .embedInNavigationView()
    }
}

struct AddStoreView_Previews: PreviewProvider {
    static var previews: some View {
        AddStoreView()
    }
}
