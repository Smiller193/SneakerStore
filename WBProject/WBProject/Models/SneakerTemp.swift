//
//  SneakerTemp.swift
//  WBProject
//
//  Created by Shawn Miller on 4/6/19.
//  Copyright © 2019 Shawn Miller. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

@objcMembers class SneakerTemp: Object, Decodable {
    //unique id that will be associated with sneakers
    dynamic var id = "sneakers"
    dynamic var sneakers: SneakersTemp?
    
    enum CodingKeys: String, CodingKey {
        case sneakers
    }
    
    required init()
    {
        super.init()
    }
    
    override static func primaryKey() -> String?
    {
        return  "id"
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        //Decodes a value of the given type for the given key.
        sneakers = try container.decode(SneakersTemp.self, forKey: .sneakers)

        super.init()
    }
    
    required init(value: Any, schema: RLMSchema)
    {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema)
    {
        super.init(realm: realm, schema: schema)
    }
}


@objcMembers class SneakersTemp: Object, Decodable {
    //unique id that will be associated with brand
    dynamic var id = "brands"
    dynamic var brands:ShoeTemp?
    
    enum CodingKeys: String, CodingKey {
        case brands
    }
    
    required init()
    {
        super.init()
    }
    
    override static func primaryKey() -> String?
    {
        return  "id"
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        //Decodes a value of the given type for the given key.
        brands = try container.decode(ShoeTemp.self, forKey: .brands)
        
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema)
    {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema)
    {
        super.init(realm: realm, schema: schema)
    }
}


@objcMembers class ShoeTemp: Object, Decodable {
    //unique id that will be associated with shoe brand
    dynamic var id = "shoeType"
    //brands that will store a list of SneakerInfo objects
    let adidas = RealmSwift.List<SneakerInfoTemp>()
    let nike = RealmSwift.List<SneakerInfoTemp>()
    let airjordan = RealmSwift.List<SneakerInfoTemp>()
    let vans = RealmSwift.List<SneakerInfoTemp>()
    
    //coding keys to ensure corret key value is matched based off of json strucutre
    enum CodingKeys: String, CodingKey,CaseIterable {
        case adidas = "Adidas"
        case nike = "Nike"
        case airjordan = "Air Jordan"
        case vans = "Vans"
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        //decode list of sneakers that fall under adidas and append it to list
        let adidasList = try container.decode([SneakerInfoTemp].self, forKey: .adidas)
        adidas.append(objectsIn: adidasList)
        //decode list of sneakers that fall under  nike and append it to list
        let nikeList = try container.decode([SneakerInfoTemp].self, forKey: .nike)
        nike.append(objectsIn: nikeList)
        //decode list of sneakers that fall under air jordans and append it to list
        let airjordanList = try container.decode([SneakerInfoTemp].self, forKey: .airjordan)
        airjordan.append(objectsIn: airjordanList)
        //decode list of sneakers that fall under vans and append it to list
        let vansList = try container.decode([SneakerInfoTemp].self, forKey: .vans)
        vans.append(objectsIn: vansList)

        super.init()
    }
    
    required init()
    {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema)
    {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema)
    {
        super.init(realm: realm, schema: schema)
    }
}


@objcMembers class SneakerInfoTemp: Object, Decodable {
//    dynamic var id = UUID().uuidString

    //list of dynamic properties that will be deserialized from the json and then passed into realm
    dynamic var brand: String?
    dynamic var category: String?
    dynamic var colorway: String?
    dynamic var currentdescription: String?
    dynamic var designer: String?
    dynamic var imagesrc: String?
    dynamic var maincolor: String?
    dynamic var name: String?
    dynamic var nickname: String?
    dynamic var price: String?
    dynamic var productlink: String?
    dynamic var productlinkhref: String?
    dynamic var releasedate: String?
    dynamic var silhouette: String?
    dynamic var technology: String?
    dynamic var webscraperorder: String?
    dynamic var webscraperstarturl: String?
    
    enum CodingKeys: String, CodingKey {
        case brand, category, colorway, designer, imagesrc, maincolor, name, nickname, price, productlink, productlinkhref, releasedate, silhouette, technology,webscraperorder,webscraperstarturl,currentdescription
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //sneaker information that will be decoded
        //made optional due to the fact that some fields don't exist with every shoe
        brand = try? container.decode(String.self, forKey: .brand)
        category = try? container.decode(String.self, forKey: .category)
        colorway = try? container.decode(String.self, forKey: .colorway)
        currentdescription = try? container.decode(String.self, forKey: .currentdescription)
        designer = try? container.decode(String.self, forKey: .designer)
        imagesrc = try? container.decode(String.self, forKey: .imagesrc)
        maincolor = try? container.decode(String.self, forKey: .maincolor)
        name = try? container.decode(String.self, forKey: .name)
        nickname = try? container.decode(String.self, forKey: .nickname)
        
        price = try? container.decode(String.self, forKey: .price)
        productlink = try? container.decode(String.self, forKey: .productlink)
        productlinkhref = try? container.decode(String.self, forKey: .productlinkhref)
        releasedate = try? container.decode(String.self, forKey: .releasedate)
        silhouette = try? container.decode(String.self, forKey: .silhouette)
        technology = try? container.decode(String.self, forKey: .technology)
        webscraperorder = try? container.decode(String.self, forKey: .webscraperorder)
        webscraperstarturl = try? container.decode(String.self, forKey: .webscraperstarturl)
        super.init()
    }
    
    
    required init()
    {
        super.init()
    }
    
    override class func primaryKey() -> String? {
        return "name"
    }
    
    required init(value: Any, schema: RLMSchema)
    {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema)
    {
        super.init(realm: realm, schema: schema)
    }
    
    static func == (lhs: SneakerInfoTemp, rhs: SneakerInfoTemp) -> Bool {
        return lhs.name == rhs.name
    }

    override func isEqual(_ object: Any?) -> Bool {
        let obj = object as! SneakerInfoTemp
        if self.name == obj.name {
            return true
        } else {
            return false
        }
    }
}

