//
//  NetworkConnection.swift
//  MarvelAppDesafio
//
//  Created by Ewerton Rabello on 09/02/21.
//

import Network


class NetworkConnection{
    
    static let shared = NetworkConnection()
    
    func checkConnection() -> Bool{
        
        let status = Reach().connectionStatus()

        switch status {
        case .unknown, .offline:
            // Not connected
            return false
        case .online(.wwan):
            // Connected via WWAN
            return true
        case .online(.wiFi):
            // Connected via WiFi
            return true
        }
        
    }
    
}
