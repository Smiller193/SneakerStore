//
//  CustomImageView.swift
//  WBProject
//
//  Created by Shawn Miller on 4/8/19.
//  Copyright © 2019 Shawn Miller. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage
import Alamofire

class CustomImageView: UIImageView {
    
    //custom imageview class to grab image using alamofire
    //will also add activity indicator for UI purposes
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    func loadImage(urlString: String){
        addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { (make) in
            make.height.width.equalTo(46)
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
            
        }
        
        self.activityIndicator.startAnimating()
        self.image = nil
        
        
        Alamofire.request(urlString).responseImage { response in
//            debugPrint(response)
            if let image = response.result.value {
                self.activityIndicator.stopAnimating()
                self.image = image
            }
        }
        
    }
    

}
