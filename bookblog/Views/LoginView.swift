//
//  LoginView.swift
//  bookblog
//
//  Created by Artyom Danko on 29.04.24.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {    
    @StateObject var authHandler  = FirebaseAuthHandler()
    @EnvironmentObject var loginManager : LoginManager
    
    @State private var email : String = ""
    @State private var password : String = ""
    var body: some View {
        NavigationView {
//            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Welcome!").font(.largeTitle).bold()
                    Spacer()
                }
                .padding()
                .padding(.top)
                
                Spacer()
                
                HStack{
                    Image(systemName: "mail")
                    TextField("Email", text: $email)
                    
                    Spacer()
                    
                }.padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.black))
                
                    .padding()
                
                HStack{
                    Image(systemName: "lock")
                    SecureField("Password", text: $password)
                    Spacer()
                    
                }.padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.black)).padding()
                
                Button(action: {}) {
                    Text("Don't have an account?").foregroundColor(.black.opacity(0.7))
                    NavigationLink("Register", destination: RegisterView().environmentObject(loginManager).navigationBarBackButtonHidden(true))
                    
                }
                
                Button{
                    _login()
                } label: {
                    Text("Sign In").foregroundColor(.white).font(.title3).bold().frame(maxWidth: .infinity).padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.black)).padding()
                }
                .padding(.bottom)
                
                Spacer()
                Spacer()
                
            }
        }
    }
    
    func _login() {
        loginManager.login(email: email, password: password)
        print(Auth.auth().currentUser)
    }
}
