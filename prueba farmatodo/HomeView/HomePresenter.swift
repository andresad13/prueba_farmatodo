//
//  HomePresenter.swift
//  prueba farmatodo
//
//  Created by Leonel Alfonso on 5/01/22.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.cargarActivity()
        interactor?.interactorGetData()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func interactorPushDataPresenter(receiverData: DatoURL) {
        view?.presenterPushDataView(receiverdData: receiverData)
        //view?.stoptAndHideActivity()
        
    }

}
