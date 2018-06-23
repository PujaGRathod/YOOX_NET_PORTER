//
//  ProductAPICall.swift
//  YOOX_NET_PORTER
//
//  Created by Intelivex Labs on 19/06/18.
//  Copyright © 2018 Intelivex Labs. All rights reserved.
//

import Foundation

extension NetworkServices {
    func getProductList(responseClosure: (@escaping ([Product]?) ->Void)) {
        _ = self.makeGETRequest(with: "https://api.net-a-porter.com/NAP/GB/en/60/0/summaries?categoryIds=2") { (response) in
            if let res = response.result {
                let manager = ProductManager()
                if let products = manager.GetProductList(data: res) {
                    responseClosure(products)
                }
            }
        }
    }
}
