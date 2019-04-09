//
//  Storyboard+Utility.swift
//  WBProject
//
//  Created by Shawn Miller on 4/5/19.
//  Copyright © 2019 Shawn Miller. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    enum OType: String {
        case main
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    convenience init(type: OType, bundle: Bundle? = nil) {
        self.init(name: type.filename, bundle: bundle)
    }
    
    static func initialViewController(for type: OType) -> UIViewController {
        let storyboard = UIStoryboard(type: type)
        guard let initialViewController = storyboard.instantiateInitialViewController() else {
            fatalError("Couldn't instantiate initial view controller for \(type.filename) storyboard.")
        }
        
        return initialViewController
    }
    
}

