//
//  SneakerDetailViewController.swift
//  WBProject
//
//  Created by Shawn Miller on 4/9/19.
//  Copyright © 2019 Shawn Miller. All rights reserved.
//

import UIKit

class SneakerDetailViewController: UIViewController {

    
   
    var sneakerViewModel: SneakerViewModel? {
        didSet{
            guard let sneaker = sneakerViewModel else {
                return
            }
            
            print("got sneaker information")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
