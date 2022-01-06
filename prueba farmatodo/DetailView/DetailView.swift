//
//  DetailView.swift
//  prueba farmatodo
//
//  Created by Leonel Alfonso on 5/01/22.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController {

    @IBOutlet weak var titleAnime: UILabel!
    @IBOutlet weak var imageAnime: UIImageView!
    @IBOutlet weak var releaseAnime: UILabel!
    @IBOutlet weak var ratingAme: UIProgressView!
    @IBOutlet weak var airedAnime: UILabel!
    @IBOutlet weak var ratingLabelAnime: UILabel!
    @IBOutlet weak var menbersAnime: UILabel!
    var linkAnime = ""
    // MARK: Properties
    var presenter: DetailPresenterProtocol?

    @IBAction func toWathAnime(_ sender: Any) {
      
        if let url = URL(string: linkAnime), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, completionHandler: nil)
        }
    }
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        airedAnime.layer.cornerRadius = 8
        airedAnime.layer.masksToBounds = true
        releaseAnime.layer.cornerRadius = 8
        releaseAnime.layer.masksToBounds = true
        presenter?.viewDidLoad()

    }
}

extension DetailView: DetailViewProtocol {
  
    func setAnime(withData: DatoURL.Animes) {
        print(withData)
        titleAnime.text = withData.title
        imageAnime.load(url: URL(string: withData.image_url)!)
        releaseAnime.text = "released  \(withData.start_date)"
        ratingAme.progress = (withData.score/10)
        
        ratingLabelAnime.text = withData.score.description
        menbersAnime.text = "( \(withData.members.description))"
        linkAnime = withData.url
    }
    
  
    
    // TODO: implement view output methods
}
