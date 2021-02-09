//
//  MarvelData.swift
//  MarvelAppDesafio
//
//  Created by Ewerton Rabello on 09/02/21.
//

import Foundation

struct MarvelData : Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Hero]
}
