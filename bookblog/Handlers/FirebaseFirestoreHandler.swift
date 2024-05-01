//
//  FirebaseFirestoreHandler.swift
//  bookblog
//
//  Created by Artyom Danko on 29.04.24.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseFirestoreHandler : ObservableObject {
    
    func getUser(completion: @escaping(User) -> Void) {
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser
        db.collection("users").document(user!.uid).getDocument { snapshot, error in
            guard let dictionary = snapshot?.data() else { return }
            let user = User(dictionary: dictionary)
            completion(user)
        }
    }
    
    func isFavorite(book : Book, competion: @escaping(Bool) -> Void){
        getUser() {
            user in
                print("ABOBA")
                print(user.favorite_posts)
            let res = user.favorite_posts.contains(where: { $0.compare(bookToCompare: book) })
                    competion(res)
        }
    }
    
    func changeFav(book : Book, isFav: Bool, competion: @escaping(Bool) -> Void) {
        let user = Auth.auth().currentUser
        let db = Firestore.firestore().collection("users").document(user!.uid)
        let bookToSend : BookToSend = BookToSend(author: book.author, description: book.description, images: book.images, title: book.title)
        let bookData = try! Firestore.Encoder().encode(bookToSend)
        if isFav {
            db.updateData([
                "favorite_posts": FieldValue.arrayRemove([bookData])
            ])
        } else {
            db.updateData([
                "favorite_posts": FieldValue.arrayUnion([bookData])
            ])
        }
        competion(!isFav)
    }
    
    func getFavoriteBooks(completion: @escaping([Book]) -> Void) {
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser
        db.collection("users").document(user!.uid).getDocument { snapshot, error in
            guard let dictionary = snapshot?.data() else { return }
            let user = User(dictionary: dictionary)
            print(user)
            completion(user.favorite_posts)
        }
    }
    
    func getBooks(completion: @escaping([Book]) -> Void) {
        let db = Firestore.firestore()
        db.collection("books").getDocuments { snapshot, error in
            guard let dictionaryData = snapshot?.documents else {
                print("Error getting data")
                return
                
            }
                    var books : [Book] = dictionaryData.map{
                        Book(dictionary: $0.data())
                    }
            print(books[0].title)
            completion(books)
        }
    }
}
