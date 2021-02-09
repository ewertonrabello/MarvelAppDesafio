//
//  MarvelManagerStored.swift
//  MarvelAppDesafio
//
//  Created by Ewerton Rabello on 09/02/21.
//

import CoreData

class MarvelManagerStored{
    
    static let shared = MarvelManagerStored()
    var characters: [MarvelStorage] = []
    
    func loadCharacters(context: NSManagedObjectContext){
        let fetchRequest: NSFetchRequest<MarvelStorage> = MarvelStorage.fetchRequest()
        let sortDescritor = NSSortDescriptor(key: "nameCharacter", ascending: true)
        fetchRequest.sortDescriptors = [sortDescritor]
        
        do{
            characters = try context.fetch(fetchRequest)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func deleteCharacter(index:Int, context: NSManagedObjectContext){
        let character = characters[index]
        context.delete(character)
        
        do{
            try context.save()
            characters.remove(at: index)
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func insertCharacter(hero: Hero, context: NSManagedObjectContext) -> Bool{
        
        let marvel :MarvelStorage = MarvelStorage(context: context)
        
        marvel.idCharacter = Int64(hero.id)
        marvel.nameCharacter = hero.name
        marvel.descriptonCharacter = hero.description
        marvel.imageCharacter = hero.thumbnail.url
        
        do{
            try context.save()
            return true
        }
        catch{
            print("Error ao gravar: \(error.localizedDescription)")
            return false
        }
        
    }
    
}
