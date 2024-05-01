//
//  AuthManager.swift
//  bookblog
//
//  Created by Artyom Danko on 29.04.24.
//

import Foundation
import FirebaseAuth

final class AuthManager {
    static let shared = AuthManager()
    private init(){}
    
    func createUser(email : String, password: String) async {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func signIn() {
        
    }
    
    
}
