//
//  MainConfigurator.swift
//  BoredApp
//
//  Created by mac on 25.09.2021.
//

import Foundation

protocol MainConfiguratorProtocol: AnyObject {
    func configure(with viewController: MainController)
}

final class MainConfigurator: MainConfiguratorProtocol {
    
    func configure(with viewController: MainController) {
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(presenter: presenter)
        let router = MainRouter(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
