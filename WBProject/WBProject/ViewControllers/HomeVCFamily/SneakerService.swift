//
//  SneakerService.swift
//  WBProject
//
//  Created by Shawn Miller on 4/5/19.
//  Copyright © 2019 Shawn Miller. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
import Realm

struct SneakerService {
    static func fetchSneakerData( completion: @escaping (Data?) -> Void) {
        Alamofire.request(Constants.API.sneakerAPI).responseJSON { response in
            
            switch response.result {
            case .success:
                completion(response.data)
            case .failure:
                completion(response.data)
            }
        }
    }
    
    static func sendSneakerDataToRealm (completion: @escaping (Bool?) -> Void){
        fetchSneakerData { (val) in
            guard let sneakerData = val else {
                return
            }
            
            do {
                //                let sneakers = try JSONDecoder().decode(Sneaker.self, from: sneakerData)
                
                let sneakersTemp = try JSONDecoder().decode(SneakerTemp.self, from: sneakerData)
                
                var setTemp = Set<SneakerInfoTemp>()
                
                
                //remove duplicates from json data
                
                //Adidas
                for sneakers in (sneakersTemp.sneakers?.brands?.adidas)! {
                    if setTemp.contains(sneakers){
                        continue
                    }else{
                        setTemp.insert(sneakers)
                    }
                  
                }
                
                
                sneakersTemp.sneakers?.brands?.adidas.removeAll()
                sneakersTemp.sneakers?.brands?.adidas.append(objectsIn: setTemp)
                setTemp.removeAll()
                
    
                //Air Jordan
                for sneakers in (sneakersTemp.sneakers?.brands?.airjordan)! {
                    if setTemp.contains(sneakers){
                        continue
                    }else{
                        setTemp.insert(sneakers)
                    }
                    
                }
                
                
                sneakersTemp.sneakers?.brands?.airjordan.removeAll()
                sneakersTemp.sneakers?.brands?.airjordan.append(objectsIn: setTemp)
                setTemp.removeAll()

                
                //Air Jordan
                for sneakers in (sneakersTemp.sneakers?.brands?.nike)! {
                    if setTemp.contains(sneakers){
                        continue
                    }else{
                        setTemp.insert(sneakers)
                    }
                    
                }
                
                sneakersTemp.sneakers?.brands?.nike.removeAll()
                sneakersTemp.sneakers?.brands?.nike.append(objectsIn: setTemp)
                setTemp.removeAll()
                
                let realm = try! Realm()
                print(realm.configuration.fileURL?.absoluteString ?? "")
                
                try realm.write {
                    realm.add(sneakersTemp, update: true)
                    completion(true)
                }
                
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
                completion(false)

                
            }
            
            
        }
        
        
    }

    
    
    static func fetchSneakerDataFromRealm(brand: String, completion: @escaping (Results<SneakerInfoTemp>) -> Void){
        let realm = try! Realm()
        let results = realm.objects(SneakerInfoTemp.self).filter("brand = '\(brand.lowercased())' ")
        print(results.count)
        completion(results)
    }
    
    
    
}
