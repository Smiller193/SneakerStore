//
//  HomeViewController.swift
//  WBProject
//
//  Created by Shawn Miller on 4/2/19.
//  Copyright © 2019 Shawn Miller. All rights reserved.
//

import UIKit
import Segmentio
import Alamofire
import RealmSwift
import Realm

class HomeViewController: UIViewController,SneakerViewModelDelegate {
    
    //IB OUTLETS
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var segmentioView: Segmentio!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Style for segmentio (segmented control view)
    var segmentStyle = SegmentioStyle.onlyLabel
    //selected index for segmetnio
    private func selectedSegmentioIndex() -> Int {
        return 0
    }
    //array of sneakerViewModels
    var sneakerVM = [SneakerViewModel]()
    //dummy delegate to make proper use of delegate functions
    var sneakerVMTemp = SneakerViewModel(sneakaer: SneakerInfoTemp())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("apples")
            NotificationCenter.default.post(name: heartAttackNotificationName, object: nil)
        setupSegmentioView()
        
        sneakerVMTemp.sneakerViewModelDelegate = self
        
        guard let currentItem = segmentioView.segmentioItems[segmentioView.selectedSegmentioIndex].title else {
            return
        }
        
        sneakerVMTemp.currentItem = currentItem
        
        sneakerVMTemp.fetchData()
    
        // Do any additional setup after loading the view.
    }
    

  
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false

    }
    
    func didFinishFetchingRealmObjects(sneakers: Results<SneakerInfoTemp>) {
        self.sneakerVM.removeAll()
         self.sneakerVM  = sneakers.map({return SneakerViewModel(sneakaer: $0)})
        self.collectionView.reloadData()
    }
    

    @objc func setupSegmentioView(){
    //will set up segmentio(segmented view) view using custom builder
        SegmentioBuilder.buildSegmentioView(
            segmentioView: segmentioView,
            segmentioStyle: segmentStyle
        )
        //will set selected index
        segmentioView.selectedSegmentioIndex = selectedSegmentioIndex()
        segmentioView.valueDidChange  = { segmentio, segmentIndex in
            //will fetch data for appropriate sneaker brand absed off of selection
            
            guard let currentItem = self.segmentioView.segmentioItems[segmentIndex].title else {
                return
            }
            self.sneakerVMTemp.currentItem = currentItem
            self.sneakerVMTemp.fetchData()
            
        }
        
       
    }
    



//     In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier = "sneakerDetailVC" {
//            let vc = segue.destination as! SneakerDetailViewController
//        }
//      
//    }
    

}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sneakerVM.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier.sneakerCell, for: indexPath) as! SneakerCell
        cell.sneakerViewModel = sneakerVM[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 20) / 2
        
        return CGSize(width: width, height: 200)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let sneakerViewModel = sneakerVM[indexPath.row]
//       let vc = SneakerDetailViewController()
//        vc.sneakerViewModel = sneakerViewModel
//        self.performSegue(withIdentifier: "sneakerDetailVC", sender: self)
//    }
    
    
}


extension HomeViewController: UICollectionViewDelegate {
    
}

