//
//  bookViewModel.swift
//  bookblog
//
//  Created by Artyom Danko on 30.04.24.
//

import Foundation

class bookViewModel : ObservableObject {
    @Published var books = [Book]()
    var firestoreHandler = FirebaseFirestoreHandler()
    
    func fetchData() {
        firestoreHandler.getBooks() {
            books in
                print(books)
                self.books = books
        }
        print(books)
    }
}
