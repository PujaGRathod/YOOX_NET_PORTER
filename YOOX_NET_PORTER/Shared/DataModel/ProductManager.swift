//
//  ProductManager.swift
//  YOOX_NET_PORTER
//
//  Created by Intelivex Labs on 20/06/18.
//  Copyright © 2018 Intelivex Labs. All rights reserved.
//

import Foundation

class ProductManager : NSObject {
    
    func validResponse(json: [String: Any]) -> ([String:Any]?,String?)? {
        if let _ = json["summaries"] as? [[String:Any]] {
            return (json,nil)
        } else if let error = json["error"] as? String {
            return (nil,error)
        } else {
            return nil
        }
    }
    
//    func validResponse(json: [String: Any]) -> [[String:Any]]? {
//        if let response = json["summaries"] as? [[String:Any]] {
//            return response
//        }
//        return nil
//    }
    
    
    func GetProductList(data:[String :Any]) -> [Product]? {
        var productList:[Product] = []
        guard let list = data["summaries"] as? [[String:Any]] else {
            return nil
        }
        
        for dic in list {
            if let product = ToProduct(data: dic) {
                productList.append(product)
            }
        }
        return productList
    }
    
    
    func ToProduct(data:[String :Any]) -> Product? {
        
        guard let productId = data["id"] as? Int ,
           let name = data["name"] as? String ,
            let price = data["price"] as? [String:Any],
            let imgDic = data["images"] as? [String:Any],
            let img = ToImage(data: imgDic),
            let imgURL = img.imgUrl else {
            return nil
        }
        var priceValue = 0
        if let pri = ToPrice(data: price) {
            priceValue = pri.amount
        }
        
        let product = Product(productID: productId,
                              name: name,
                              price: priceValue,
                              image: imgURL)
        return product
    }

    func ToImage(data:[String :Any]) -> Image? {
        guard let str = data["urlTemplate"] as? String else {
                return nil
        }
        let imageString = URLSchemeFixer.fixMissingScheme(in: str)
        let image = Image(imgUrl:URL(string: imageString))
        return image
    }
    
    func ToPrice(data:[String :Any]) -> Price? {
        guard let currency = data["currency"] as? String,
            let divisor = data["divisor"] as? Int ,
            let amount = data["amount"] as? Int else {
                return nil
        }
        let price = Price(currency: currency, divisor: divisor, amount: amount)
        return price

//        var product:Price?
//        if let currency = data["currency"] as? String {
//            product?.currency = currency
//        }
//
//        if let divisor = data["divisor"] as? String {
//            product?.divisor = Double(divisor) ?? 0.0
//        }
//
//        if let divisor = data["amount"] as? String {
//            product?.amount = Double(divisor) ?? 0.0
//        }
//        return product
    }
    
    /*
     "images": {
     "shots": [
     "in",
     "ou",
     "fr",
     "bk",
     "cu",
     "e1"
     ],
     "sizes": [
     "dl",
     "l",
     "m",
     "m2",
     "mt",
     "mt2",
     "pp",
     "s",
     "sl",
     "xl",
     "xs",
     "xxl"
     ],
     "mediaType": "image/jpeg",
     "urlTemplate": "{{scheme}}//cache.net-a-porter.com/images/products/1054052/1054052_{{shot}}_{{size}}.jpg"
     }
 */
    

    
    
}
