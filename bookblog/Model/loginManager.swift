//
//  loginManager.swift
//  bookblog
//
//  Created by Artyom Danko on 1.05.24.
//

import Foundation
class LoginManager : ObservableObject {
    @Published var isLoggedIn = false
    var firebaseAuthHandler = FirebaseAuthHandler()
    
    func login(email: String, password: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.firebaseAuthHandler.signIn(email: email, password: password) {
                authResult, error in
                if authResult?.user != nil {
                    self.isLoggedIn = true
                }
            }
        }
    }
    
    func register(email: String, name: String, surname: String, about: String, age: String, favoriteAuthors: String, favoriteJanars: String, favoriteBooks: String, password: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.firebaseAuthHandler.register(email: email, name: name, surname: surname, about: about, age: age, favoriteAuthors: favoriteAuthors, favoriteJanars: favoriteJanars, favoriteBooks: favoriteBooks, password: password) {
                authResult, error in
                if authResult?.user != nil {
                    self.isLoggedIn = true
                }
            }
        }
    }
    
    func signOut() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.firebaseAuthHandler.signOut()
            self.isLoggedIn = false
        }
    }
}
