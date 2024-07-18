//
//  BookData.swift
//  SwiftUIExample
//
//  Created by Techcreatix on 6/17/20.
//  Copyright © 2020 Techcreatix. All rights reserved.
//

import Foundation

class BookSlideData: Identifiable {
    var id: String = UUID().uuidString
    var imageName: String
    var isExpand: Bool
    
    init(imageName: String, isExpand: Bool) {
        self.imageName = imageName
        self.isExpand = isExpand
    }
    
    static var bookDatas: [BookSlideData] {
        return [
            BookSlideData(imageName: "b_book1", isExpand: false),
            BookSlideData(imageName: "b_book4", isExpand: false),
            BookSlideData(imageName: "b_book5", isExpand: false),
            BookSlideData(imageName: "b_book7", isExpand: false)
        ]
    }
}

extension BookSlideData: ObservableObject {
    
}

struct BestSellerData: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var imageName: String
    var author: String
    var price: String
    var rating: String
    var comment: Int
    
    static var datas: [BestSellerData] {
        return [
            BestSellerData(name: "Harry Potter and the Goblet of Fire", imageName: "b_book4", author: "J.K. Rowling", price: "19.99", rating: "4.8", comment: 2390),
            BestSellerData(name: "The Jungle Book", imageName: "b_book1", author: "Rudyard Kipling", price: "19.99", rating: "4.8", comment: 2390),
            BestSellerData(name: "Star Wars Return of the Jedi", imageName: "b_book5", author: "James Kahn", price: "19.99", rating: "4.8", comment: 2390),
            BestSellerData(name: "Batman The Dark Knight Rises", imageName: "b_book7", author: "Greg Cox", price: "19.99", rating: "4.8", comment: 2390)
        ]
    }
}
