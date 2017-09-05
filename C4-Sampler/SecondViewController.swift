//
//  SecondViewController.swift
//  C4-Sampler
//
//  Created by hahahahahanananana on 2017/09/05.
//  Copyright © 2017年 片岡. All rights reserved.
//

import UIKit
import C4
class SecondViewController: CanvasController {
    override func setup() {
        canvas.addPanGestureRecognizer{ locations, center, translation, velocity, tate in
            ShapeLayer.disableActions = true
            let circle = Circle(center: center, radius: 30)
            self.canvas.add(circle)
            ShapeLayer.disableActions = false
            
            let a = ViewAnimation(duration: 1.0, animations: {
                circle.opacity = 0.0
                circle.transform.scale(0.01, 0.01)
                
            })
            a.addCancelObserver {
                circle.removeFromSuperview()
            }
            a.curve = .Linear
            a.animate()
        }
    }
}
