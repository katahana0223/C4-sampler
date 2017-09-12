//
//  UIImageExtension.swift
//  C4-Sampler
//
//  Created by hahahahahanananana on 2017/09/12.
//  Copyright © 2017年 片岡. All rights reserved.
//

import UIKit

extension UIImage {
    func resize(ratio: CGFloat) -> UIImage? {
        let resizedSize = CGSize(width: Int(self.size.width * ratio), height: Int(self.size.height * ratio))
        UIGraphicsBeginImageContextWithOptions(resizedSize, false, 2)
        draw(in: CGRect(x: 0, y: 0, width: resizedSize.width, height: resizedSize.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
