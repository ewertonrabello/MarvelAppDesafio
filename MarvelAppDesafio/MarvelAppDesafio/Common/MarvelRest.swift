//
//  MarvelRest.swift
//  MarvelAppDesafio
//
//  Created by Ewerton Rabello on 09/02/21.
//

import Foundation
import SwiftHash
import CoreData

class MarvelRest {
    
    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    static private let privateKey = "c35d7d6551851b43a18b092901058a8e568d55cf"
    static private let publicKey = "8f47cebdf25221fa7a7eb752a875cd4a"
    static private let limit = 30
    
    private static let configuration: URLSessionConfiguration = {
        
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-Type" : "application/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 5
        return config
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    
    class func loadMarvelAPI(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo?) -> Void){
        
        let offset = page * limit
        let nameStartsWith: String
        if let name = name, !name.isEmpty{
            nameStartsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        }
        else{
            nameStartsWith = ""
        }
        
        let urlstring = basePath + "offset=\(offset)&limit=\(limit)&" + nameStartsWith + getCredentials()
        print(urlstring)
        
        guard let url = URL(string: urlstring) else { return }
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if(error == nil){

                guard let response = response as? HTTPURLResponse else {return}
                if(response.statusCode == 200){
                    // Recebemos da api
                    guard let data = data else {return}
                    
                    do{
                        let heros =  try JSONDecoder().decode(MarvelInfo.self, from: data)
                        onComplete(heros)
                    }catch{
                        print("Erro a receber: \(error.localizedDescription)")
                        onComplete(nil)
                    }
                }
            }
            else{ // error
                print(error!)
                onComplete(nil)
            }
        }
        dataTask.resume()
        
    }
    
    private class func getCredentials() -> String {
        
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
