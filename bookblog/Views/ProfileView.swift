//
//  ProfileView.swift
//  bookblog
//
//  Created by Artyom Danko on 30.04.24.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject private var profileModel = ProfileViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.cyan)
                    .frame(width: 100, height: 100)
                    .padding()
                ScrollView {
                    VStack (
                        alignment: .leading
                    ) {
                        HStack {
                            Image(systemName: "person").bold()
                            Text(profileModel.user.name + " " + profileModel.user.surname)
                            
                        }.padding()
                        HStack {
                            Image(systemName: "pencil").bold()
                            Text(profileModel.user.about)
                        }.padding()
                        HStack {
                            Image(systemName: "mail").bold()
                            Text(profileModel.user.email)
                        }.padding()
                        HStack {
                            Image(systemName: "calendar").bold()
                            Text("\(profileModel.user.age)")
                        }.padding()
                        HStack {
                            Image(systemName: "book").bold()
                            Text(profileModel.user.favorite_books)
                        }.padding()
                        HStack {
                            Image(systemName: "highlighter").bold()
                            Text(profileModel.user.favorite_authors)
                        }.padding()
                        HStack {
                            Image(systemName: "bookmark").bold()
                            Text(profileModel.user.favorite_janars)
                        }.padding()
                    }.padding(.horizontal)
                }
            }.navigationTitle("Welcome " + profileModel.user.name + " " + profileModel.user.surname)
                .navigationBarTitleDisplayMode(.inline)
        }.onAppear {
            profileModel.fetchData()
        }
                
    }
}


