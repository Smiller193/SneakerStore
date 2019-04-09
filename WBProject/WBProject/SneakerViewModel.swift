//
//  ViewModels.swift
//  WBProject
//
//  Created by Shawn Miller on 4/8/19.
//  Copyright © 2019 Shawn Miller. All rights reserved.
//

import Foundation
import Realm
import RealmSwift



protocol SneakerViewModelDelegate {
    func didFinishFetchingRealmObjects(sneakers: Results<SneakerInfoTemp>)
}




class SneakerViewModel {
    //delegate
     var sneakerViewModelDelegate: SneakerViewModelDelegate?
    
    //current item for segmentio and data switching(by brand)
    var currentItem:String?
    
     private let sneakerInfo: SneakerInfoTemp
    //dependency injection via the init
    
    init(sneakaer: SneakerInfoTemp) {
        self.sneakerInfo = sneakaer
    }
}


//will handle fetching of sneaker objects from realm and passing it back to View using delegate
extension SneakerViewModel {
    @objc func fetchData(){
        guard let currentItem = currentItem?.lowercased() else {
            return
        }
        SneakerService.fetchSneakerDataFromRealm(brand:currentItem ) { (sneakers) in
            self.sneakerViewModelDelegate?.didFinishFetchingRealmObjects(sneakers: sneakers)
        }
    }
    
}



extension SneakerViewModel {
    //will safely unwrap all values to pass back to view
    var name: String {
        guard let name = sneakerInfo.name else {
            return "No name found at the moment"
        }
        return name
    }
    
    var brand: String {
        guard let brand = sneakerInfo.brand else {
            return "No brand found at the moment"
        }
        return brand
    }
    
    var category: String {
        guard let category = sneakerInfo.category else {
            return "No category found at the moment"
        }
        return category
    }
    
    
    var colorway: String {
        guard let colorway = sneakerInfo.colorway else {
            return "No colorway found at the moment"
        }
        return colorway
    }
    
    var currentdescription: String {
        guard let currentdescription = sneakerInfo.currentdescription else {
            return "No description found at the moment"
        }
        return currentdescription
    }
    
    var designer: String {
        guard let designer = sneakerInfo.designer else {
            return "No designer found at the moment"
        }
        return designer
    }
    
    var imagesrc: String {
        guard let imagesrc = sneakerInfo.imagesrc else {
            return ""
        }
        return imagesrc
    }
    var maincolor: String {
        guard let maincolor = sneakerInfo.maincolor else {
            return "No main color found at the moment"
        }
        return maincolor
    }
    var nickname: String {
        guard let nickname = sneakerInfo.nickname else {
            return "No nickname found at the moment"
        }
        return nickname
    }
    var price: String {
        guard let price = sneakerInfo.price else {
            return "No price found at the moment"

        }
        return price
    }
    var productlink: String {
        guard let productlink = sneakerInfo.productlink else {
            return "No product link found at the moment"
        }
        return productlink
    }
    var productlinkhref: String {
        guard let productlinkhref = sneakerInfo.productlinkhref else {
            return ""
        }
        return productlinkhref
    }
    var releasedate: String {
        guard let releasedate = sneakerInfo.releasedate else {
            return "No release date found at the moment"
        }
        return releasedate
    }
    var silhouette: String {
        guard let silhouette = sneakerInfo.silhouette else {
            return "No silhouette found at the moment"
        }
        return silhouette
    }
    var technology: String {
        guard let technology = sneakerInfo.technology else {
            return "No technology found at the moment"
        }
        return technology
    }
    
}
