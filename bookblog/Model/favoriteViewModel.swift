//
//  favoriteViewModel.swift
//  bookblog
//
//  Created by Artyom Danko on 30.04.24.
//

import Foundation

class favoriteViewModel : ObservableObject {
    @Published var books = [Book]()
    var firestoreHandler = FirebaseFirestoreHandler()
    
    func fetchData() {
        firestoreHandler.getFavoriteBooks {
            books in
                print(books)
                self.books = books
        }
        print(books)
    }
}
