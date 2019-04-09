//
//  Sneakers.swift
//  WBProject
//
//  Created by Shawn Miller on 4/5/19.
//  Copyright © 2019 Shawn Miller. All rights reserved.
//

import Foundation
import RealmSwift
import Realm


struct Sneaker: Decodable {
    var sneakers : Sneakers
    
}

struct Sneakers: Decodable {
    let brands: Shoe
}



struct Shoe: Decodable {
    let adidas: [SneakerInfo]
    let nike: [SneakerInfo]
    let airjordan: [SneakerInfo]
    let vans: [SneakerInfo]
    enum CodingKeys: String, CodingKey {
        case adidas = "Adidas"
        case nike = "Nike"
        case airjordan = "Air Jordan"
        case vans = "Vans"
    }
}


struct SneakerInfo: Decodable {
    let brand, category, colorway, description: String?
    let designer: String?
    let imagesrc: String?
    let maincolor, name, nickname, price: String?
    let productlink: String?
    let productlinkhref: String?
    let releasedate, silhouette, technology, webscraperorder: String?
    let webscraperstarturl: String?
    enum CodingKeys: String, CodingKey {
        case brand, category, colorway, description, designer, imagesrc, maincolor, name, nickname, price, productlink, productlinkhref, releasedate, silhouette, technology,webscraperorder,webscraperstarturl
    }
}


