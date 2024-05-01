//
//  User.swift
//  bookblog
//
//  Created by Artyom Danko on 29.04.24.
//

import Foundation

public struct User : Codable {
    var name : String = ""
    var surname : String = ""
    var about : String = ""
    var age : Int = 0
    var email : String = ""
    var favorite_authors : String = ""
    var favorite_books : String = ""
    var favorite_janars : String = ""
    
    var favorite_posts : [Book] = []
    init(){}
    init(name: String, surname: String, about: String, age: Int, email: String, favorite_authors: String, favorite_books: String, favorite_janars: String, favorite_posts: [Book]) {
            self.name = name
            self.surname = surname
            self.about = about
            self.age = age
            self.email = email
            self.favorite_authors = favorite_authors
            self.favorite_books = favorite_books
            self.favorite_janars = favorite_janars
            self.favorite_posts = favorite_posts
        }
    
    init(dictionary: [String: Any]) {
            self.name = dictionary["name"] as? String ?? ""
            self.surname = dictionary["surname"] as? String ?? ""
            self.about = dictionary["about"] as? String ?? ""
            self.age = dictionary["age"] as? Int ?? 0
            self.email = dictionary["email"] as? String ?? ""
            self.favorite_authors = dictionary["favorite_authors"] as? String ?? ""
            self.favorite_books = dictionary["favorite_books"] as? String ?? ""
            self.favorite_janars = dictionary["favorite_janars"] as? String ?? ""
            let arr = dictionary["favorite_posts"] as! NSArray
            let arrMut = NSMutableArray(array: arr)
            let books : [[String : Any]] = arrMut.compactMap({ $0 as? [String : Any] })
            print(books)
            self.favorite_posts = books.map {
                Book(dictionary: $0)
            }
            
        }
    
    
}
