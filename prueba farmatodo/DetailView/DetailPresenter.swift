//
//  DetailPresenter.swift
//  prueba farmatodo
//
//  Created by Leonel Alfonso on 5/01/22.
//  
//

import Foundation

class DetailPresenter  : DetailPresenterProtocol{
    
    func viewDidLoad() {
        print("llego vistas detail y tengo \(String(describing: datoURLrecibido))")
        view?.setAnime(withData: (datoURLrecibido!))
    
    }
    
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    var datoURLrecibido: DatoURL.Animes?
}

    



extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
