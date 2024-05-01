//
//  Book.swift
//  bookblog
//
//  Created by Artyom Danko on 29.04.24.
//

import Foundation

public struct Book : Codable, Equatable, Identifiable {
    public var id : String = UUID().uuidString
    var author : String
    var description : String
    var images : [String]
    var title : String
    
    func compare(bookToCompare : Book) -> Bool {
        return (self.title == bookToCompare.title) && (self.description == bookToCompare.description) && (self.author == bookToCompare.author)
    }
    
    init(dictionary: [String: Any]) {
            self.title = dictionary["title"] as? String ?? ""
            self.author = dictionary["author"] as? String ?? ""
            self.description = dictionary["description"] as? String ?? ""
            self.images = dictionary["images"] as? [String] ?? []
            self.title = dictionary["title"] as? String ?? ""
        }
}
