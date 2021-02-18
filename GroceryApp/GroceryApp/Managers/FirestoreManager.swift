//
//  FirestoreManager.swift
//  GroceryApp
//
//  Created by Faraz Haider on 16/02/2021.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

class FirestoreManager{
    
    private  var db: Firestore
    
    init() {
        db = Firestore.firestore()
    }
    
    func save(store: Store, completion: @escaping (Result<Store?,Error>)->Void){
        do{
            let ref =  try db.collection("store").addDocument(data: store.asDictionary())
            ref.getDocument { (snapshot, error) in
                guard let snapshot = snapshot, error == nil else{
                    completion(.failure(error! ))
                    return
                }
                let store = try? snapshot.data(as: Store.self)
                completion(.success(store ))
            }
        }catch let error{
            completion(.failure(error))
        }
    }
    
    func getAllStores(completion: @escaping (Result<[Store]?,Error>)->Void){
        db.collection("store").getDocuments { (snapshot, error) in
            if let error = error{
                completion(.failure(error))
            }else{
                if let snapshot = snapshot{
                    let stores:[Store]? = snapshot.documents.compactMap{doc in
                        var store = try? doc.data(as: Store.self)
                        if store != nil{
                            store!.id = doc.documentID
                        }
                        return store
                    }
                    completion(.success(stores))
                }
            }
        }
    }
}
