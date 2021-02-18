//
//  StoreListViewModel.swift
//  GroceryApp
//
//  Created by Faraz Haider on 17/02/2021.
//

import Foundation

class StoreListViewModel : ObservableObject{
    
    private var firestoreManage : FirestoreManager
    @Published var store : [StoreViewModel]  = []
    
    init(){
        firestoreManage = FirestoreManager()
    }
    
    func getAll(){
        firestoreManage.getAllStores { result in
            switch result{
            case .success(let stores):
                if let stores = stores{
                    DispatchQueue.main.async {
                        self.store = stores.map(StoreViewModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
    
}

 
struct StoreViewModel{
    let store : Store
    
    var storeId : String{
        store.id ?? ""
    }
    
    var name : String{
        store.name
    }
    
    var address : String{
        store.address
    }
    
}
