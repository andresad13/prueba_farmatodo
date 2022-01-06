//
//  HomeProtocols.swift
//  prueba farmatodo
//
//  Created by Leonel Alfonso on 5/01/22.
//  
//

import Foundation
import UIKit

protocol HomeViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? { get set }
    func presenterPushDataView(receiverdData: DatoURL)
    func presenterPushDataViewSeason(receiverdData: DatoURL)
    func reloadBySearch(receivedData: [DatoURL.Animes] )
    func cargarActivity()
    func stoptAndHideActivity()
}

protocol HomeWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createHomeModule() -> UIViewController
    func presentViewNewDetail(from view: HomeViewProtocol, withData: DatoURL.Animes)

}

protocol HomePresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    func showDetailView(with data: DatoURL.Animes)
    func searchAnime(receivedData: String, receivedArray: [DatoURL.Animes])

    func viewDidLoad()
}

protocol HomeInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func interactorPushDataPresenter(receiverData: DatoURL)
    func interactorPushDataSeasonPresenter(receiverData: DatoURL)

}

protocol HomeInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }
    func interactorGetDataTop()
    func interactorGetDataSeason() 
}

protocol HomeDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol HomeRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol? { get set }
    func externalGetDataTop()
    func externalGetDataSeason() 
}

protocol HomeRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func RemoteDataManagerCallbackData(with categoty: DatoURL)
    func RemoteDataManagerCallbackDataSeason(with categoty: DatoURL)

}

protocol HomeLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
