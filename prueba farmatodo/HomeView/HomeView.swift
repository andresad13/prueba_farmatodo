//
//  HomeView.swift
//  prueba farmatodo
//
//  Created by Leonel Alfonso on 5/01/22.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionTop {
            return arrayViewUrl.count

        }
        if collectionView == collectionSeason{
            return arrayViewUrlSeason.count
        }
        else{
            return 0
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = "cell"
        if collectionView == collectionTop {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! TopViewCell
        cell.topImageCell.load(url: URL(string: arrayViewUrl[indexPath.row].image_url)!)
            return cell
        }
        if collectionView == collectionSeason{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! SeasonViewCell
            cell.seasonImageCell.load(url: URL(string: arrayViewUrlSeason[indexPath.row].image_url)!)
            cell.seasonTitleCell.text = arrayViewUrlSeason[indexPath.row].title
            cell.seasonTypeCell.layer.cornerRadius = 8
            cell.seasonTypeCell.layer.masksToBounds = true
            cell.seasonTypeCell.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
            switch arrayViewUrlSeason[indexPath.row].type {
            case "TV":
                cell.seasonTypeCell.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            case "Movie":
                cell.seasonTypeCell.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            case "OVA":
                cell.seasonTypeCell.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
            default:
                cell.seasonTypeCell.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)

            }
            cell.seasonTypeCell.text = arrayViewUrlSeason[indexPath.row].type
            
            cell.seasonEpisodesCell.text = arrayViewUrlSeason[indexPath.row].episodes.description



            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! TopViewCell
            return cell
        }
                
       
     
           
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == collectionTop {
            presenter?.showDetailView(with: arrayViewUrl[indexPath.row])
        }
        else{
        presenter?.showDetailView(with: arrayViewUrlSeason[indexPath.row])
        }
    }
    
    

    // MARK: Properties
    @IBOutlet weak var collectionTop: UICollectionView!
    @IBOutlet weak var collectionSeason: UICollectionView!
    var seasonTop = true

    @IBOutlet weak var searchAnime: UISearchBar!
    
    var arrayViewUrl: [DatoURL.Animes] = []
    var arrayViewUrlSeason: [DatoURL.Animes] = []
    var presenter: HomePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        print("aqui paro view")
    }
}

extension HomeView: HomeViewProtocol {
    func reloadBySearch(receivedData: [DatoURL.Animes]) {
        print(receivedData)
        arrayViewUrlSeason = receivedData
        self.collectionSeason.reloadData()
        searchAnime.endEditing(true)

    }
    
    func cargarActivity() {
        DispatchQueue.main.async {
           // self.activity.startAnimating()
        }
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.searchAnime(receivedData: searchBar.text!, receivedArray: arrayViewUrl)
    }
    
    
    func stoptAndHideActivity() {
        DispatchQueue.main.async {
           // self.activity.stopAnimating()
           // self.activity.hidesWhenStopped = true
        }
}
    
    func presenterPushDataView(receiverdData: DatoURL) {
        
        DispatchQueue.main.async { [self] in
            print(receiverdData)
            arrayViewUrl = receiverdData.top
           self.collectionTop.reloadData()
           
        }
        
        
    }
    func presenterPushDataViewSeason(receiverdData: DatoURL) {
        DispatchQueue.main.async { [self] in
            
            print(receiverdData)
            arrayViewUrlSeason = receiverdData.top
            self.collectionSeason.reloadData()

            arrayViewUrlSeason.removeFirst()
            arrayViewUrlSeason.removeFirst()

            print(receiverdData)
        }
    }
        
}

