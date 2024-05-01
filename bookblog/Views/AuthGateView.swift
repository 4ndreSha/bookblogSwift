//
//  AuthGateView.swift
//  bookblog
//
//  Created by Artyom Danko on 29.04.24.
//

import SwiftUI
import Firebase
import Combine
import FirebaseAuth

struct AuthGateView: View {
    @State private var isAuth = false
    @StateObject var authHandler = FirebaseAuthHandler()
    @StateObject var loginManager = LoginManager()
    @ViewBuilder
    var body: some View {
        ZStack {
            if loginManager.isLoggedIn {
                MainView().environmentObject(loginManager)
            } else {
                LoginView().environmentObject(loginManager)
            }
        }.onAppear{
            DispatchQueue.main.async {
                loginManager.isLoggedIn = authHandler.isAuth()
                print(Auth.auth().currentUser)
            }
        }
    }
}
