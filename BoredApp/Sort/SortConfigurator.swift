//
//  SortConfigurator.swift
//  BoredApp
//
//  Created by mac on 26.09.2021.
//

protocol SortConfiguratorProtocol: AnyObject {
    func configure(with viewController: SortController)
}

final class SortConfigurator: SortConfiguratorProtocol {
    
    func configure(with viewController: SortController) {
        let presenter = SortPresenter(view: viewController)
        let router = SortRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.router = router
    }
}

