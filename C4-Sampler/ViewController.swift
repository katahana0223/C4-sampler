//
//  ViewController.swift
//  C4-Sampler
//
//  Created by hahahahahanananana on 2017/08/29.
//  Copyright © 2017年 片岡. All rights reserved.
//

import UIKit
import C4

class ViewController: CanvasController {
    private var isCircle = false
    override func setup(){
        canvas.backgroundColor = darkGray
        let square = Rectangle(frame: Rect(0, 0, 100, 100))
        square.corner = Size(10, 10)
        square.center = canvas.center
        canvas.add(square)
        
        _ = square.addTapGestureRecognizer { (locations, center, state) in
            self.isCircle = !self.isCircle
            if self.isCircle {
                ViewAnimation(duration: 1.0, animations: {
                    square.corner = Size(10, 10)
                }).animate()
            } else {
                ViewAnimation(duration: 1.0, animations: {
                    square.corner = Size(50, 50)
                }).animate()
            }
        }
    }
}
