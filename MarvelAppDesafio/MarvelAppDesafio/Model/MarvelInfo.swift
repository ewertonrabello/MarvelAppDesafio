//
//  MarvelInfo.swift
//  MarvelAppDesafio
//
//  Created by Ewerton Rabello on 09/02/21.
//

import Foundation

struct MarvelInfo : Codable {
    let code: Int
    let status: String
    let data: MarvelData
}
