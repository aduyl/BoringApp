//
//  SortController.swift
//  BoredApp
//
//  Created by mac on 22.09.2021.
//

import UIKit

protocol SortControllerProtocol: AnyObject {
    func configure()
    func backToMainController(transition: CATransition)
    func chooseCertainType(sender: UIButton)
    func chooseRandomType(sender: UIButton)
    func getRequestActivity()
}

protocol DataDelegateProtocol: AnyObject {
    func transferRequestActivity(requestActivity: RequestActivity)
}

final class SortController: UIViewController, SortControllerProtocol {
    var presenter: SortPresenterProtocol!
    var configurator: SortConfiguratorProtocol = SortConfigurator()
    
    private let activityTypeView = ActivityTypeView(frame: .zero)
    private let participantsAndPriceView = ParticipantsAndPriceView(frame: .zero)
    private var collectionview: UICollectionView!
    weak var delegate: DataDelegateProtocol?
    var request = RequestActivity(type: nil, participants: nil, price: nil)
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.addTarget(self, action: #selector(closeBuottonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let requestTypeButtons: [UIButton] = {
        let allButton = makeLeafButton(name: "all", color: .gray)
        allButton.addTarget(self, action: #selector(allButtonClicked), for: .touchDown)
        var b: [UIButton] = [allButton]
        for item in Constants.typeColors {
            let button = makeLeafButton(name: item.key, color: item.value)
            button.addTarget(self, action: #selector(typeButtonClicked), for: .touchDown)
            b.append(button)
        }
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    // MARK: - private methods
    @objc private func closeBuottonClicked() {
        presenter.goToPreviousController()
    }
    @objc private func typeButtonClicked(sender: UIButton) {
        presenter.certainTypeButtonClicked(sender: sender)
    }
    
    @objc private func allButtonClicked(sender: UIButton) {
        presenter.randomTypeButtonClicked(sender: sender)
    }
    
    private func reloadCollection() {
        for item in requestTypeButtons {
            item.alpha = 1
        }
        activityTypeView.getButtons(requestTypeButtons)
        activityTypeView.collectionview.reloadData()
    }
    
    // MARK: - public methods
    func backToMainController(transition: CATransition) {
        navigationController?.view.layer.add(transition, forKey: nil)
        _ = navigationController?.popViewController(animated: false)
    }
    
    func getRequestActivity(){
        request.participants = participantsAndPriceView.participantsTextField.text
        request.price = participantsAndPriceView.priceSwitch.isOn
        delegate?.transferRequestActivity(requestActivity: request)
    }
    
    // MARK: - TODO
    func configure() {
        view.backgroundColor = Constants.backgroundColor
        view.addSubview(closeButton)
        view.addSubview(activityTypeView)
        view.addSubview(participantsAndPriceView)
        
        activityTypeView.configure(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.5))
        activityTypeView.getButtons(requestTypeButtons)
        participantsAndPriceView.configureParticipantsAndPriceView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.4))
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            closeButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            closeButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            activityTypeView.topAnchor.constraint(equalTo: closeButton.bottomAnchor),
            activityTypeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            activityTypeView.widthAnchor.constraint(equalTo: view.widthAnchor),
            activityTypeView.bottomAnchor.constraint(equalTo: participantsAndPriceView.topAnchor),
            
            participantsAndPriceView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            participantsAndPriceView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            participantsAndPriceView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            participantsAndPriceView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])
    }
    
    func chooseCertainType(sender: UIButton) {
        reloadCollection()
        sender.alpha = 0.4
        if let type = sender.currentTitle {
            request.type = type
            participantsAndPriceView.participantsTextField.placeholder = "Type the number of participants"
            participantsAndPriceView.participantsTextField.backgroundColor = nil
            participantsAndPriceView.participantsTextField.isEnabled = true
            participantsAndPriceView.priceSwitch.isEnabled = true
        }
    }
    
    func chooseRandomType(sender: UIButton) {
        reloadCollection()
        sender.alpha = 0.4
        request.type = nil
        request.price = nil
        request.participants = nil
        participantsAndPriceView.participantsTextField.text = ""
        participantsAndPriceView.participantsTextField.placeholder = "just no"
        participantsAndPriceView.participantsTextField.isEnabled = false
        participantsAndPriceView.priceSwitch.isEnabled = false
    }
    
}

func makeLeafButton(name: String, color: UIColor) -> UIButton {
    let typeButton = UIButton()
    typeButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
    typeButton.layer.cornerRadius = Constants.radius
    typeButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    typeButton.setTitle(name, for: .normal)
    typeButton.backgroundColor = color
    return typeButton
}
