//
//  ActivityCardView.swift
//  BoredApp
//
//  Created by mac on 21.09.2021.
//
//



import UIKit

final class ActivityCardView: UIView {
    private lazy var view: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = Constants.radius
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
        label.layer.cornerRadius = Constants.radius
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var activityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 10
        label.font = UIFont.boldSystemFont(ofSize: Constants.hugeFontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var participantsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: Constants.fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var participantsImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person", withConfiguration: UIImage.SymbolConfiguration(pointSize: Constants.fontSize, weight: .light, scale: .small))
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: Constants.fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "dollarsign.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: Constants.fontSize, weight: .light, scale: .small))
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(frame: CGRect) {
        self.addSubview(view)
        view.frame = frame
        view.addSubview(typeLabel)
        view.addSubview(activityLabel)
        view.addSubview(participantsLabel)
        view.addSubview(participantsImageView)
        view.addSubview(priceLabel)
        view.addSubview(priceImageView)
        
        activityLabel.font = UIFont.boldSystemFont(ofSize: (view.frame.height - 2 * Constants.indent) / 10 )
        
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: view.topAnchor),
            typeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            typeLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35),
            typeLabel.heightAnchor.constraint(equalToConstant: Constants.indent),
            
            activityLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: Constants.semiIndent),
            activityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.semiIndent),
            activityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.indent),
            activityLabel.bottomAnchor.constraint(equalTo: participantsImageView.topAnchor, constant: Constants.semiIndent),
            
            participantsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.semiIndent),
            participantsImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.semiIndent),
            participantsImageView.widthAnchor.constraint(equalToConstant: Constants.indent),
            participantsImageView.heightAnchor.constraint(equalToConstant: Constants.indent),
            
            participantsLabel.leadingAnchor.constraint(equalTo: participantsImageView.trailingAnchor),
            participantsLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.semiIndent),
            participantsLabel.widthAnchor.constraint(equalToConstant: Constants.indent),
            participantsLabel.heightAnchor.constraint(equalToConstant: Constants.indent),
            
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.semiIndent),
            priceLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.semiIndent),
            priceLabel.widthAnchor.constraint(equalToConstant: Constants.indent),
            priceLabel.heightAnchor.constraint(equalToConstant: Constants.indent),
            
            priceImageView.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -Constants.semiIndent),
            priceImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.semiIndent),
            priceImageView.widthAnchor.constraint(equalToConstant: Constants.indent),
            priceImageView.heightAnchor.constraint(equalToConstant: Constants.indent),
            
        ])
    }
    
    func configure(activity: Activity) {
        var price = ""
        if activity.price == 0.0 {
            price = "free"
        } else {
            price = String(activity.price)
        }
        UIView.transition(with: typeLabel,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations:{
                            self.typeLabel.text = activity.type
                            self.typeLabel.backgroundColor = Constants.typeColors[activity.type]
                          })
        UIView.transition(with: activityLabel,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.activityLabel.text = activity.activity
                          })
        UIView.transition(with: priceLabel,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.priceLabel.text = price
                          })
        UIView.transition(with: participantsLabel,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.participantsLabel.text = String(Int(activity.participants))
                          })
    }
    
}
