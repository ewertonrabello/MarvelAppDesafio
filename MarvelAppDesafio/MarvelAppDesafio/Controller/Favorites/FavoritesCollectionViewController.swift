//
//  FavoritesCollectionViewController.swift
//  MarvelAppDesafio
//
//  Created by Ewerton Rabello on 09/02/21.
//

import UIKit

@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
class FavoritesCollectionViewController: UICollectionViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    var marvelManagerStored = MarvelManagerStored.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        loadViewFavorites()
    }
    
    func loadViewFavorites(){
        
        marvelManagerStored.loadCharacters(context: context)
        collectionView.reloadData()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailsViewController
        let favoriteCell = sender as! FavoriteCollectionViewCell
        
        vc.characterCore = favoriteCell.hero

    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        let count = marvelManagerStored.characters.count

        label.text = "Not favorite."
        collectionView.backgroundView = count < 1 ? label : nil

        return count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FavoriteCollectionViewCell
    
        // Configure the cell
        let hero = marvelManagerStored.characters[indexPath.row]
        cell.prepareCell(character: hero)
        
        return cell
    }

}
