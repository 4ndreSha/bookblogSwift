//
//  FirebaseAuthHandler.swift
//  bookblog
//
//  Created by Artyom Danko on 29.04.24.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseAuthHandler : ObservableObject {
    
    func isAuth() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    func register(email: String, name: String, surname: String, about: String, age: String, favoriteAuthors : String, favoriteJanars : String, favoriteBooks : String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        let db = Firestore.firestore()
        let ageInt : Int? = Int(age)
        let user : User = User(name: name, surname: surname, about: about, age: ageInt!, email: email, favorite_authors: favoriteAuthors, favorite_books: favoriteBooks, favorite_janars: favoriteJanars, favorite_posts: [])
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in completion(authResult, error)
            if let error = error {
                print("Erorr creating user")
            } else if let userData = authResult?.user {
                print("Welcome")
                do {
                    try db.collection("users").document(userData.uid).setData(from: user)
                } catch let error {
                  print("Error writing user to Firestore: \(error)")
                }
            }
            
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                completion(authResult, error)
            }
    }
    
    func signOut() {
        do {
            try
                Auth.auth().signOut()
        } catch let error {
            print("Error writing user to Firestore: \(error)")
          }
        
    }
}
