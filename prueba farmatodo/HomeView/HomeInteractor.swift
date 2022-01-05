//
//  HomeInteractor.swift
//  prueba farmatodo
//
//  Created by Leonel Alfonso on 5/01/22.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    func interactorGetData() {
        remoteDatamanager?.externalGetDataTop()

    }
    

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    var arrayURL = [AnimeURL]()
  

}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    
    func RemoteDataManagerCallbackData(with category: DatoURL) {
        
     
        presenter?.interactorPushDataPresenter(receiverData: category)
        
    }
}
