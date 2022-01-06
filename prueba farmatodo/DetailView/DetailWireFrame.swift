//
//  DetailWireFrame.swift
//  prueba farmatodo
//
//  Created by Leonel Alfonso on 5/01/22.
//  
//

import Foundation
import UIKit

class DetailWireFrame: DetailWireFrameProtocol {


    static func createDetailModule(with data: DatoURL.Animes) -> UIViewController {
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "DetailView")
        if let view = viewController as? DetailView {
                let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
                let interactor: DetailInteractorInputProtocol & DetailRemoteDataManagerOutputProtocol = DetailInteractor()
                let localDataManager: DetailLocalDataManagerInputProtocol = DetailLocalDataManager()
                let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
                let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
                
                view.presenter = presenter
                presenter.view = view
                presenter.wireFrame = wireFrame
                presenter.interactor = interactor
                presenter.datoURLrecibido = data
                interactor.presenter = presenter
                interactor.localDatamanager = localDataManager
                interactor.remoteDatamanager = remoteDataManager
                remoteDataManager.remoteRequestHandler = interactor
                
                return view
            }
            return UIViewController()
        }
        
        static var mainStoryboard: UIStoryboard {
            return UIStoryboard(name: "DetailView", bundle: Bundle.main)
        }
        
        
    }

