//
//  RootViewController.swift
//  WBProject
//
//  Created by Shawn Miller on 4/3/19.
//  Copyright © 2019 Shawn Miller. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @objc func setupView(){
    let appearance = UITabBarItem.appearance(whenContainedInInstancesOf: [RootViewController.self])
        appearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
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
