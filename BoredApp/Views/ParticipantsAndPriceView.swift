//
//  ParticipantsAndPriceView.swift
//  BoredApp
//
//  Created by mac on 26.09.2021.
//

import UIKit

final class ParticipantsAndPriceView: UIView {
    private lazy var view: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var participantsView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.gray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var priceView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.gray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var participantsLabel: UILabel = {
        let label = UILabel()
        label.text = "PARTICIPANTS"
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: Constants.fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var participantsTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Type the number of participants"
        field.contentHorizontalAlignment = .center
        field.contentVerticalAlignment = .center
        field.keyboardType = .asciiCapableNumberPad
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "PRICE"
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: Constants.fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.preferredStyle = .sliding
        switcher.isOn = true
        switcher.translatesAutoresizingMaskIntoConstraints = false
        return switcher
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureParticipantsAndPriceView(frame: CGRect) {
        self.addSubview(view)
        view.frame = frame
        view.addSubview(participantsView)
        view.addSubview(priceView)
        priceView.addSubview(priceLabel)
        priceView.addSubview(priceSwitch)
        participantsView.addSubview(participantsLabel)
        participantsView.addSubview(participantsTextField)
        
        NSLayoutConstraint.activate([
            participantsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            participantsView.topAnchor.constraint(equalTo: view.topAnchor),
            participantsView.widthAnchor.constraint(equalTo: view.widthAnchor),
            participantsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.66),
        
            participantsLabel.leadingAnchor.constraint(equalTo: participantsView.leadingAnchor, constant: Constants.semiIndent),
            participantsLabel.topAnchor.constraint(equalTo: participantsView.topAnchor),
            participantsLabel.widthAnchor.constraint(equalTo: participantsView.widthAnchor, constant: -Constants.semiIndent),
            participantsLabel.heightAnchor.constraint(equalTo: participantsView.heightAnchor, multiplier: 0.5),
    
            participantsTextField.leadingAnchor.constraint(equalTo: participantsView.leadingAnchor, constant: Constants.semiIndent),
            participantsTextField.topAnchor.constraint(equalTo: participantsLabel.bottomAnchor),
            participantsTextField.bottomAnchor.constraint(equalTo: participantsView.bottomAnchor),
            participantsTextField.widthAnchor.constraint(equalTo: participantsView.widthAnchor, constant: -Constants.semiIndent),
    
            priceView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            priceView.topAnchor.constraint(equalTo: participantsTextField.bottomAnchor),
            priceView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.34),
            priceView.widthAnchor.constraint(equalTo: view.widthAnchor),
    
            priceLabel.leadingAnchor.constraint(equalTo: priceView.leadingAnchor, constant: Constants.semiIndent),
            priceLabel.topAnchor.constraint(equalTo: priceView.topAnchor),
            priceLabel.heightAnchor.constraint(equalTo: priceView.heightAnchor),
            priceLabel.widthAnchor.constraint(equalTo: priceView.widthAnchor, multiplier: 0.7),
        
            priceSwitch.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            priceSwitch.trailingAnchor.constraint(equalTo: priceView.trailingAnchor, constant: -Constants.semiIndent),
            priceSwitch.centerYAnchor.constraint(equalTo: priceView.centerYAnchor)
        ])
    }
    
    
}
