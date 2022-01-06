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
    func searchAnime(receivedData: String, receivedArray: [DatoURL.Animes]) {
        print(receivedData)
        
        var arrayAnimes: [DatoURL.Animes] = []
        let textFind =  receivedData
        if textFind == "" {
            arrayAnimes = receivedArray
        }else{
               for index in receivedArray{
                if index.title.contains(textFind) {
                    arrayAnimes.append(index)
                   }
               }
        }
        view!.reloadBySearch(receivedData: arrayAnimes)
              
               
           
    }
    
  
    
   
    

    func showDetailView(with data: DatoURL.Animes) {
        wireFrame?.presentViewNewDetail(from: view!, withData: data)
    }
    func viewDidLoad() {
        view?.cargarActivity()
        interactor?.interactorGetDataTop()
       // interactor?.interactorGetDataSeason()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func interactorPushDataPresenter(receiverData: DatoURL) {
        view?.presenterPushDataView(receiverdData: receiverData)
        //view?.stoptAndHideActivity()
        
    }
    func interactorPushDataSeasonPresenter(receiverData: DatoURL) {
        view?.presenterPushDataViewSeason(receiverdData: receiverData)
    }

}
