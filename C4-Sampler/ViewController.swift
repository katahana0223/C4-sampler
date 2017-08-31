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
    override func setup(){
       let string = "C4"
        let textShape = TextShape(text: string)!
       textShape.center = canvas.center
        canvas.add(textShape)
    }
}
