//
//  CharacterCollectionViewCell.swift
//  MarvelAppDesafio
//
//  Created by Ewerton Rabello on 09/02/21.
//

import UIKit
import Kingfisher

@available(iOS 13.0, *)
class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var lbCharacter: UILabel!
    @IBOutlet weak var viewBack: UIView!
    @IBOutlet weak var btnAddFavorite: UIButton!
    var hero: Hero!
    var marvelManagerStored = MarvelManagerStored.shared
    var heros: [MarvelStorage]!
    var controllerCharacter: CharactersCollectionViewController!
    
    func prepareCell(character: Hero, characters: [MarvelStorage], controller: CharactersCollectionViewController){
        
        hero = character
        heros = characters
        controllerCharacter = controller
        
        if checkHero(id: hero.id) {
            btnAddFavorite.setImage(UIImage(named: "starHero"), for: .normal)
        }
        else{
            btnAddFavorite.setImage(UIImage(named: "starGray"), for: .normal)
        }

        viewBack.layer.cornerRadius = 5
        lbCharacter.text = String(character.name)
        
        if let url = URL(string: hero.thumbnail.url){
            imgCharacter.kf.indicatorType = .activity
            imgCharacter.kf.setImage(with: url)
            imgCharacter.layer.cornerRadius = 5
        }
        
    }
    
    func checkHero(id: Int) -> Bool {
        
        for fav in heros{
            if hero.id == fav.idCharacter{
                return true
            }
        }
        
        return false
    }
    
    @IBAction func addFavorite(_ sender: UIButton) {
        
        if !checkHero(id: hero.id) {
        
            let ret = marvelManagerStored.insertCharacter(hero: hero, context: context)
            
            if !ret {
                print("erro ao gravar")
            }
            else{
                controllerCharacter.loadCharacters()
            }
        }
        
    }
}
