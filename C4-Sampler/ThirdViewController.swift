//
//  ThirdViewController.swift
//  C4-Sampler
//
//  Created by hahahahahanananana on 2017/09/05.
//  Copyright © 2017年 片岡. All rights reserved.
//

import UIKit
import C4
class ThirdViewController: CanvasController {
    override func setup(){
        let p = Path()
        let poly = Polygon()
        canvas.add(poly)
        canvas.addPanGestureRecognizer{ locations, center, translation, velocity, state in
            if state == .began {
                p.moveToPoint(center)
            }else{
                p.addLineToPoint(center)
            }
            poly.path = p
            
            }
        }
}
