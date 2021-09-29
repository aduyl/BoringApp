//
//  MainPresenter.swift
//  BoredApp
//
//  Created by mac on 23.09.2021.
//

import UIKit

protocol MainPresenterProtocol: AnyObject {
    func configureView()
    func requestActivity()
    func changeActivity(requestActivity: RequestActivity)
    func updateActivity(activity: Activity)
    func menuButtonClicked()
    func showAlertView(with text: String)
    func pushSortController(controller: UIViewController, transition: CATransition)
    func animateButton(sender: UIButton)
}

final class MainPresenter: MainPresenterProtocol {
    weak var view: MainControllerProtocol!
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!
    
    required init(view: MainControllerProtocol) {
        self.view = view
    }
    
    func configureView() {
        view.configureUI()
    }
    
    func updateActivity(activity: Activity) {
        view.configureActivityProperties(activity: activity)
    }
    
    func menuButtonClicked() {
        router.showSortViewController()
    }
    
    func requestActivity() {
        interactor.getActivity()
    }
    
    func changeActivity(requestActivity: RequestActivity) {
        interactor.changeRequest(requerstActivity: requestActivity)
        interactor.getActivity()
    }
    
    func showAlertView(with text: String) {
        view.showAlertView(with: text)
    }
    
    func pushSortController(controller: UIViewController, transition: CATransition) {
        view.showSortViewController(controller, transition: transition)
    }
    
    func animateButton(sender: UIButton) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5) {
                sender.transform = sender.transform.rotated(by: CGFloat.pi)
                sender.transform = sender.transform.rotated(by: CGFloat.pi)
            }
        }
    }

}
