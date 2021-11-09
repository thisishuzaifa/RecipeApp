//
//  Recipie.swift
//  CookIt
//
//  Created by Muhammad Huzaifa Khalid on 2021-11-09.
//

import Foundation


class Recipie{
    var title: String
    var steps: [String]
    var imageURL: String
    
    init(title: String, steps: [String], imageURL: String){
        self.title = title
        self.steps = steps
        self.imageURL = imageURL
    }
}
