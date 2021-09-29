//
//  ViewController.swift
//  BoredApp
//
//  Created by mac on 21.09.2021.
//

import UIKit
import CDAlertView

protocol MainControllerProtocol: AnyObject {
    func configureActivityProperties(activity: Activity)
    func configureUI()
    func showAlertView(with text: String)
    func showSortViewController(_ controller: UIViewController, transition: CATransition)
}

final class MainController: UIViewController, MainControllerProtocol, DataDelegateProtocol {
    var presenter: MainPresenterProtocol!
    var configurator: MainConfiguratorProtocol = MainConfigurator()
    
    private let menuButton = UIButton()
    private let redoButton = UIButton(type: .custom)
    private let mediumConfig = UIImage.SymbolConfiguration(pointSize: Constants.indent, weight: .bold, scale: .medium)
    private let activityCardView = ActivityCardView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.requestActivity()
        presenter.configureView()
    }
    // MARK: - TODO
    
    // MARK: - public methods
    func configureActivityProperties(activity: Activity) {
        DispatchQueue.main.async{
            self.activityCardView.configure(activity: activity)
        }
    }
    
    func configureUI() {
        view.backgroundColor = Constants.backgroundColor
        configureActivityCard()
        configureMenu()
        configureRedo()
    }
    
    func showAlertView(with text: String) {
        DispatchQueue.main.async {
            CDAlertView(title: "Error", message: text, type: .error).show()
        }
    }
    
    func showSortViewController(_ controller: UIViewController, transition: CATransition) {
        controller.modalPresentationStyle = .overCurrentContext
        navigationController?.view.layer.add(transition, forKey: kCATransition)
        navigationController?.pushViewController(controller, animated: false)
    }
    
    func transferRequestActivity(requestActivity: RequestActivity) {
        presenter.requestActivity()
    }
    
    // MARK: - private methods
    
    @objc private func menuButtonClicked() {
        presenter.menuButtonClicked()
    }
    
    @objc private func redoButtonClicked() {
        presenter.requestActivity()
    }
    
    private func configureMenu() {
        view.addSubview(menuButton)
        menuButton.setImage(UIImage(systemName: "slider.horizontal.3", withConfiguration: mediumConfig), for: .normal)
        menuButton.tintColor = .black
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.addTarget(self, action: #selector(menuButtonClicked), for: .touchDown)
        
        NSLayoutConstraint.activate([
            menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuButton.bottomAnchor.constraint(equalTo: activityCardView.topAnchor, constant: -Constants.semiIndent),
            menuButton.widthAnchor.constraint(equalToConstant: Constants.mainViewButtonsHeigth)
        ])
    }
    
    private func configureRedo() {
        view.addSubview(redoButton)
        redoButton.setImage( UIImage(systemName: "arrow.counterclockwise", withConfiguration: mediumConfig), for: .normal)
        redoButton.tintColor = .black
        redoButton.translatesAutoresizingMaskIntoConstraints = false
        redoButton.addTarget(self, action: #selector(redoButtonClicked), for: .touchDown)
        
        NSLayoutConstraint.activate([
            redoButton.topAnchor.constraint(equalTo: activityCardView.bottomAnchor, constant: Constants.semiIndent),
            redoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            redoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            redoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])

    }
    
    private func configureActivityCard() {
        view.addSubview(activityCardView)
        activityCardView.configure(frame: CGRect(x: 0, y: 0, width: view.frame.width - 2 * Constants.activityCardIndend, height: view.frame.height - 2.5 * Constants.mainViewButtonsHeigth))
        activityCardView.layer.shadowColor = UIColor.gray.cgColor
        activityCardView.layer.shadowRadius = Constants.activityCardIndend
        activityCardView.layer.shadowOpacity = 0.5
        activityCardView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.activityCardIndend),
            activityCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.activityCardIndend),
            activityCardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityCardView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
