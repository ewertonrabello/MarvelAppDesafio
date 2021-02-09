//
//  DetailsViewController.swift
//  MarvelAppDesafio
//
//  Created by Ewerton Rabello on 09/02/21.
//

import UIKit
import Kingfisher

@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
class DetailsViewController: UIViewController {

    
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var lbNameCharacter: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var viewPush: UIView!
    @IBOutlet weak var viewTransparent: UIView!
    @IBOutlet weak var btnAddFavorite: UIButton!
    
    var character: Hero!
    var characterCore: MarvelStorage?
    var marvelManagerStored = MarvelManagerStored.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadViewDetails()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        apresentAnimations()
    }
    
    func loadViewDetails(){
        
        // zerar alpha
        lbNameCharacter.alpha = 0.0
        lbDescription.alpha = 0.0
        imgCharacter.alpha = 0.0
        viewTransparent.alpha = 0.0
        
        btnAddFavorite.tintColor = UIColor.black
        viewPush.layer.cornerRadius = 4
        
        if characterCore == nil {
            
            //valores
            title = character?.name
            lbNameCharacter.text = character?.name
            lbDescription.text = character?.verifiedDescription
            
            if let url = URL(string: (character?.thumbnail.url)!){
                imgCharacter.kf.indicatorType = .activity
                imgCharacter.kf.setImage(with: url)
                imgCharacter.layer.cornerRadius = 5
            }
            
        }
        else{
            
            //valores
            title = characterCore?.nameCharacter
            lbNameCharacter.text = characterCore?.nameCharacter
            lbDescription.text = characterCore?.descriptonCharacter
            btnAddFavorite.isHidden = true
            
            if let url = URL(string: (characterCore?.imageCharacter)!){
                imgCharacter.kf.indicatorType = .activity
                imgCharacter.kf.setImage(with: url)
                imgCharacter.layer.cornerRadius = 5
            }
        }
    
    }
    
    func apresentAnimations(){
        
        UIView.animate(withDuration: 2.5, animations: {
            
            self.lbNameCharacter.alpha = 1.0
            self.lbDescription.alpha = 1.0
            self.imgCharacter.alpha = 1.0
            self.viewTransparent.alpha = 0.80
            
        })
    }
    
    @IBAction func addFavorite(_ sender: Any) {
        
        let ret = marvelManagerStored.insertCharacter(hero: character, context: context)
        
        if ret {
            
            showAlertView(title: "Sucess", textMessage: "\(character.name) add in favorite.", titleButton: "Ok", style: .default)
        }
        else{
            showAlertView(title: "Error", textMessage: "not insert \(character.name) in favorite.", titleButton: "Ok", style: .default)
        }
        
    }
    
}
