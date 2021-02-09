//
//  Thumbnail.swift
//  MarvelAppDesafio
//
//  Created by Ewerton Rabello on 09/02/21.
//

import Foundation

struct Thumbnail : Codable {
    let path : String
    var url: String {
        return "\(path.replacingOccurrences(of: "http", with: "https")).jpg"
    }
}
