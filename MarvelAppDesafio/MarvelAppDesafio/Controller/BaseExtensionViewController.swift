//
//  BaseExtensionViewController.swift
//  MarvelAppDesafio
//
//  Created by Ewerton Rabello on 09/02/21.
//

import UIKit
import CoreData

@available(iOS 13.0, *)
extension UIViewController{
    
    var context: NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    func showAlertView(title: String, textMessage: String, titleButton: String, style: UIAlertAction.Style){
        
        let alert = UIAlertController(title: title, message: textMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: titleButton, style: style, handler: nil))
        
        present(alert,animated: true,completion: nil)
    }
 
}

@available(iOS 13.0, *)
extension UICollectionViewCell{
    
    var context: NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
