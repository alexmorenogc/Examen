//
//  MasterModel.swift
//  UsuarioCV
//
//  Created by Alexander Moreno Guillén on 8/12/19.
//  Copyright © 2019 Alexander Moreno Guillén. All rights reserved.
//

import Foundation
import RealmSwift

class MasterModel {
    let realm = try! Realm()
    
    init() {
    }
    
    func getUsersCount() -> Int {
        let users = realm.objects(User.self)
        return users.count
    }
    
    func getNameAndSurname(_ id: Int) -> String {
        let users = realm.objects(User.self)
        return users[id].name + " " + users[id].surname
    }
    
    func getUser(_ id: Int) -> User {
        let user = realm.objects(User.self)
        return user[id]
    }
    
    func deleteUser(_ id: Int) {
        let users = realm.objects(User.self)
        
        let userTodelete = users[id]
                
        try! realm.write {
            realm.delete(userTodelete)
        }
    }
}
