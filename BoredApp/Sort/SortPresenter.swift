//
//  SortPresenter.swift
//  BoredApp
//
//  Created by mac on 26.09.2021.
//

import UIKit

protocol SortPresenterProtocol: AnyObject {
    func configureView()
    func goToPreviousController()
    func certainTypeButtonClicked(sender: UIButton)
    func randomTypeButtonClicked(sender: UIButton)
}

final class SortPresenter: SortPresenterProtocol {
    
    weak var view: SortControllerProtocol!
    var router: SortRouterProtocol!
    
    required init(view: SortControllerProtocol) {
        self.view = view
    }
    
    func configureView() {
        view.configure()
    }
    
    func certainTypeButtonClicked(sender: UIButton) {
        view.chooseCertainType(sender: sender)
    }
    
    func randomTypeButtonClicked(sender: UIButton) {
        view.chooseRandomType(sender: sender)
    }
    
    func goToPreviousController() {
        view.getRequestActivity()
        router.popToMainController()
    }
}
