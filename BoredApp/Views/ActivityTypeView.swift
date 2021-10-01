//
//  ActivityTypeView.swift
//  BoredApp
//
//  Created by mac on 23.09.2021.

import UIKit

final class ActivityTypeView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var collectionview: UICollectionView!
    var name: Int = 0
    var buttons: [UIButton]?
    
    private lazy var view: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var typeLabel: UILabel =  {
        let label = UILabel()
        label.text = "TYPE"
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: Constants.fontSize)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func getButtons(_ buttons: [UIButton]) {
        self.buttons = buttons
    }
    
    func configure(frame: CGRect) {
        self.addSubview(view)
        view.frame = frame
        view.addSubview(typeLabel)
        configureCollection()
        
        NSLayoutConstraint.activate([
            typeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.semiIndent),
            typeLabel.topAnchor.constraint(equalTo: view.topAnchor),
            typeLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            typeLabel.heightAnchor.constraint(equalToConstant: Constants.indent),
            
            collectionview.topAnchor.constraint(equalTo: typeLabel.bottomAnchor),
            collectionview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureCollection() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        collectionview = UICollectionView(frame: CGRect(x: 0, y: Constants.indent, width: view.frame.width, height: view.frame.height - Constants.indent), collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = Constants.backgroundColor
        view.addSubview(collectionview)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let buttons = buttons else {
            return 0
        }
        return buttons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        guard let buttons = buttons else { return cell }
        let button = buttons[indexPath.item]
        guard let name = button.currentTitle else { return cell }
        let width = name.size(withAttributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: Constants.fontSize)
        ]).width + Constants.fontSize
        let heigth: CGFloat = Constants.indent
        button.frame = CGRect(x: 0, y: 0, width: width, height: heigth)
        cell.contentView.addSubview(button)
        return cell
    }
    
}

extension ActivityTypeView {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let buttons = buttons else { return CGSize(width: 0, height: 0) }
        let item = buttons[indexPath.item].currentTitle ?? ""
        let width = item.size(withAttributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: Constants.fontSize)
        ]).width + Constants.fontSize
        let heigth: CGFloat = Constants.indent
        let size = CGSize(width: width, height: heigth)
        return size
    }
}
