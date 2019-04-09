//
//  SneakerCell.swift
//  WBProject
//
//  Created by Shawn Miller on 4/5/19.
//  Copyright © 2019 Shawn Miller. All rights reserved.
//

import UIKit

class SneakerCell: UICollectionViewCell {
    
    @IBOutlet weak var sneakerImage: CustomImageView!
    @IBOutlet weak var sneakerNameLabel: UILabel!
    @IBOutlet weak var sneakerPrice: UILabel!
    
    var sneakerViewModel: SneakerViewModel? {
        didSet{
            guard let sneaker = sneakerViewModel else {
                return
            }
            sneakerImage.loadImage(urlString: sneaker.imagesrc)
            sneakerNameLabel.text = sneaker.name
        }
    }
    

    
}
