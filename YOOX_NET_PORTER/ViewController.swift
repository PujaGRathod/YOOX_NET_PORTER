//
//  ViewController.swift
//  YOOX_NET_PORTER
//
//  Created by Intelivex Labs on 19/06/18.
//  Copyright © 2018 Intelivex Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ClothingsList: UICollectionView!
    var listAdapter = ClothingsListAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listAdapter.set(collectionView: ClothingsList)
        // Do any additional setup after loading the view, typically from a nib.
    }
}

