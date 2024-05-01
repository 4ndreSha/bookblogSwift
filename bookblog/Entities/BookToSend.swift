//
//  BookToSend.swift
//  bookblog
//
//  Created by Artyom Danko on 1.05.24.
//

import Foundation
public struct BookToSend : Codable {
    var author : String
    var description : String
    var images : [String]
    var title : String
    
    init(author: String, description: String, images: [String], title: String) {
        self.author = author
        self.description = description
        self.images = images
        self.title = title
    }
}
