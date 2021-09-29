//
//  SortRouter.swift
//  BoredApp
//
//  Created by mac on 26.09.2021.
//

import UIKit

protocol SortRouterProtocol: AnyObject {
    func popToMainController()
}

final class SortRouter: SortRouterProtocol {
    weak var viewController: SortControllerProtocol!
    
    init(viewController: SortControllerProtocol) {
        self.viewController = viewController
    }
    
    func popToMainController() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromBottom
        viewController.backToMainController(transition: transition)
    }
}
