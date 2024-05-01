//
//  favoriteBookViewModel.swift
//  bookblog
//
//  Created by Artyom Danko on 30.04.24.
//

import Foundation
class favoriteBookViewModel : ObservableObject {
    @Published var isFav = false
    var firestoreHandler = FirebaseFirestoreHandler()
    
    func checkIsFav(book : Book) {
        firestoreHandler.isFavorite(book: book) {
            isFav in
                self.isFav = isFav
        }
    }
    
    func changeFav(book: Book) {
        firestoreHandler.changeFav(book: book, isFav: self.isFav) {
            isFav in
                self.isFav = isFav
        }
    }
}
