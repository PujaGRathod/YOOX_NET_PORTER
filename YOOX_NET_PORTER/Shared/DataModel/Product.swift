//
//  Product.swift
//  YOOX_NET_PORTER
//
//  Created by Intelivex Labs on 19/06/18.
//  Copyright © 2018 Intelivex Labs. All rights reserved.
//

import Foundation

struct Product {
    var productID:Int
    var name : String = ""
    var price : Int
    var image : URL
}

struct Price {
    var currency : String = ""
    var divisor : Int
    var amount : Int
}

struct Image {
    var imgUrl : URL?
}
