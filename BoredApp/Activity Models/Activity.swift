//
//  Activity.swift
//  BoredApp
//
//  Created by mac on 21.09.2021.
//

import Foundation

struct Activity: Decodable {
    let activity: String
    let accessibility: Double
    let type: String
    let participants: Double
    let price: Double
    let link: String?
    let key: String
}
