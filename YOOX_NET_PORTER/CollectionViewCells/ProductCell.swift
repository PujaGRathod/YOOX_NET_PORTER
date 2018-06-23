//
//  ProductCell.swift
//  YOOX_NET_PORTER
//
//  Created by Intelivex Labs on 19/06/18.
//  Copyright © 2018 Intelivex Labs. All rights reserved.
//

import UIKit
import SDWebImage
import Foundation
class ProductCell: UICollectionViewCell {

    @IBOutlet var ProductName: UILabel!
    @IBOutlet var Price: UILabel!
    @IBOutlet var ProductImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
   }
    
    func setProduct(productDetail: Product) {
        self.ProductName.text = productDetail.name
        self.Price.text = String(productDetail.price)
        
//        DispatchQueue.main.async {
            self.ProductImage.sd_setImage(with: productDetail.image, placeholderImage: nil, options:.retryFailed ) { (image, _, _, _) in
                if let image = image {
                    self.ProductImage.image = image
//                    let size = image.size
//                    if size.width / size.height == 1 {
//                        self.ProductImage.contentMode = .scaleAspectFit
//                    } else {
//                        self.ProductImage.contentMode = .scaleAspectFill
//                    }
                }
            }
//        }
    }
    
}
