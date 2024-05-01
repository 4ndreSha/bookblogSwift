//
//  RegisterView.swift
//  bookblog
//
//  Created by Artyom Danko on 29.04.24.
//

import SwiftUI

struct RegisterView: View {
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var about : String = ""
    @State private var favoriteAuthors : String = ""
    @State private var favoriteBooks : String = ""
    @State private var favoriteJanars : String = ""
    @State private var age : String = ""
    @State private var name : String = ""
    @State private var surname : String = ""
    @EnvironmentObject var loginManager : LoginManager
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Join Us!").font(.largeTitle).bold()
                    Spacer()
                }
                .padding()
                .padding(.top)
                
                List{
                    HStack{
                        Image(systemName: "mail")
                        TextField("Email", text: $email)
                    
                        Spacer()
                        
                    }.padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.black))
                    
                        .padding()
                    HStack{
                        Image(systemName: "calendar")
                        TextField("Age", text: $age).keyboardType(.numberPad)
                                    
                    
                        Spacer()
                        
                    }.padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.black))

                        .padding()
                    
                    HStack{
                        Image(systemName: "person")
                        TextField("Name", text: $name)
                                    
                    
                        Spacer()
                    
                    }.padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.black))

                    .padding()
                    
                    HStack{
                        Image(systemName: "person")
                        TextField("Surname", text: $surname)
                                    
                    
                        Spacer()
                    
                    }.padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.black))

                    .padding()
                    
                    HStack{
                        Image(systemName: "pencil")
                        TextField("About", text: $about)
                                    
                    
                        Spacer()
                    
                    }.padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.black))

                    .padding()
                    
                    HStack{
                        Image(systemName: "book")
                        TextField("Favorite Books", text: $favoriteBooks)
                                    
                    
                        Spacer()
                    
                    }.padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.black))

                    .padding()
                    
                    HStack{
                        Image(systemName: "bookmark")
                        TextField("Favorite Janars", text: $favoriteJanars)
                                    
                    
                        Spacer()
                    
                    }.padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.black))

                    .padding()
                    
                    HStack{
                        Image(systemName: "highlighter")
                        TextField("Favorite Authors", text: $favoriteAuthors)
                                    
                    
                        Spacer()
                    
                    }.padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.black))

                    .padding()
                    
                    
                    
                    HStack{
                        Image(systemName: "lock")
                        SecureField("Password", text: $password)
                        Spacer()
                        
                    }.padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.black)).padding()
                    
                    
                }
                
                Button(action: {}) {
                    Text("Do have an account?").foregroundColor(.black.opacity(0.7))
                    NavigationLink("Sign In", destination: LoginView().environmentObject(loginManager).navigationBarBackButtonHidden(true))
                }
                
                Button{
                    _signIn()
                } label: {
                    Text("Register").foregroundColor(.white).font(.title3).bold().frame(maxWidth: .infinity).padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.black)).padding()
                }
                .padding(.bottom)
                
                Spacer()
                Spacer()
                
            }
        }
        .onAppear {
            // isAuth = false
            // navigationManager.navigateToLogin = false
        }
    }
    
    func _signIn() {
        loginManager.register(email: email, name: name, surname: surname, about: about, age: age, favoriteAuthors: favoriteAuthors, favoriteJanars: favoriteJanars, favoriteBooks: favoriteBooks, password: password)
        

    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
