//
//  MainView.swift
//  bookblog
//
//  Created by Artyom Danko on 30.04.24.
//

import SwiftUI

struct MainView: View {
    @State private var title : String = "Title"
    @ObservedObject private var viewModel = bookViewModel()
    @State private var firebaseHandler : FirebaseFirestoreHandler = FirebaseFirestoreHandler()
    @EnvironmentObject var loginManager : LoginManager
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 40){
                    ForEach(0..<viewModel.books.count, id: \.self) {
                        index in
                        NavigationLink(destination: BookView(book: $viewModel.books[index])) {
                            Text(viewModel.books[index].title)
                            
                        }
                        Divider()
                    }
                }
            }.navigationTitle("Books")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink(destination: FavoriteView()) {
                            Image(systemName: "heart")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink(destination: ProfileView()) {
                            Image(systemName: "person")
                        }
                    }
                    ToolbarItem(placement: .automatic) {
                        Button {
                            loginManager.signOut()
                        } label: {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                    }
                }
                
        }.onAppear() {
            viewModel.fetchData()
        }
    }
}
