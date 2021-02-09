//
//  FavoriteCollectionViewCell.swift
//  MarvelAppDesafio
//
//  Created by Ewerton Rabello on 09/02/21.
//

import UIKit
import Kingfisher

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var lbNameCharacter: UILabel!
    @IBOutlet weak var imgCharacter: UIImageView!
    
    var hero: MarvelStorage!
    
    func prepareCell(character: MarvelStorage){
        
        hero = character
        
        viewBackground.layer.cornerRadius = 5
        lbNameCharacter.text = hero.nameCharacter
        
        
        if let url = URL(string: hero.imageCharacter!){
         imgCharacter.kf.indicatorType = .activity
         imgCharacter.kf.setImage(with: url)
         imgCharacter.layer.cornerRadius = 5
        }

    }
    
}
