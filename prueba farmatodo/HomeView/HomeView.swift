//
//  HomeView.swift
//  prueba farmatodo
//
//  Created by Leonel Alfonso on 5/01/22.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayViewUrl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = "cell"
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! TopViewCell
        cell.topImageCell.load(url: URL(string: arrayViewUrl[indexPath.row].image_url)!)
        return cell
           
    }
    

    // MARK: Properties
    @IBOutlet weak var collectionTop: UICollectionView!
    var arrayViewUrl: [DatoURL.Animes] = []
    var presenter: HomePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        print("aqui paro view")
    }
}

extension HomeView: HomeViewProtocol {
    func cargarActivity() {
        DispatchQueue.main.async {
           // self.activity.startAnimating()
        }
    }
    
    func stoptAndHideActivity() {
        DispatchQueue.main.async {
           // self.activity.stopAnimating()
           // self.activity.hidesWhenStopped = true
        }
}
    
    func presenterPushDataView(receiverdData: DatoURL) {
        
        arrayViewUrl = receiverdData.top
        DispatchQueue.main.async { [self] in
           self.collectionTop.reloadData()
        }
        
        
    }
}

