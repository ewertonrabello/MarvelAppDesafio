//
//  Hero.swift
//  MarvelAppDesafio
//
//  Created by Ewerton Rabello on 09/02/21.
//

import Foundation

struct Hero : Codable {
    let id: Int
    let name: String
    let description: String
    var verifiedDescription: String {
        if(!description.isEmpty){ return description }
        else{ return "there is no description for this character."}
    }
    let thumbnail: Thumbnail
}

