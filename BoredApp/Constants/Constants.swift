//
//  Properties.swift
//  BoredApp
//
//  Created by mac on 23.09.2021.

import UIKit

struct ActivityType {
    let key: String
    let value: UIColor
}

final class Constants {
    static let typeColors = [
        "education": educationColor,
        "recreational": recreationalColor,
        "social": socialColor,
        "diy": diyColor,
        "charity": charityColor,
        "cooking": cookingColor,
        "relaxation": relaxationColor,
        "music": musicColor,
        "busywork": busyworkColor
    ]
    
    static let activityCardIndend: CGFloat = 10
    static let mainViewButtonsHeigth: CGFloat = 80
    
    static let indent: CGFloat = 44
    static let semiIndent: CGFloat = 11
    static let radius: CGFloat = 10
    static let fontSize: CGFloat = 20
    static let hugeFontSize: CGFloat = 30
    static let spacing: CGFloat = 16
    static let url: String = "https://www.boredapi.com/api/activity"
    
    static let backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
    static let allColor = UIColor(red: 134/255, green: 134/255, blue: 134/255, alpha: 1)
    static let educationColor = UIColor(red: 214/255, green: 47/255, blue: 47/255, alpha: 1)
    static let recreationalColor = UIColor(red: 214/255, green: 133/255, blue: 62/255, alpha: 1)
    static let socialColor = UIColor(red: 239/255, green: 231/255, blue: 85/255, alpha: 1)
    static let diyColor = UIColor(red: 80/255, green: 185/255, blue: 66/255, alpha: 1)
    static let charityColor = UIColor(red: 234/255, green: 133/255, blue: 221/255, alpha: 1)
    static let cookingColor = UIColor(red: 150/255, green: 133/255, blue: 234/255, alpha: 1)
    static let relaxationColor = UIColor(red: 80/255, green: 159/255, blue: 228/255, alpha: 1)
    static let musicColor = UIColor(red: 178/255, green: 61/255, blue: 114/255, alpha: 1)
    static let busyworkColor = UIColor(red: 44/255, green: 172/255, blue: 192/255, alpha: 1)
    
}

