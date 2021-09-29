//
//  MainRouter.swift
//  BoredApp
//
//  Created by mac on 23.09.2021.
//

import UIKit

protocol MainRouterProtocol: AnyObject {
    func showSortViewController()
}

final class MainRouter: MainRouterProtocol, DataDelegateProtocol {
    weak var presenter: MainPresenterProtocol!
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func showSortViewController() {
        let sortController = SortController()
        sortController.delegate = self
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = .push
        transition.subtype = .fromTop
        presenter.pushSortController(controller: sortController, transition: transition)
    }
    
    func transferRequestActivity(requestActivity: RequestActivity) {
        presenter.changeActivity(requestActivity: requestActivity)
    }
    
}
