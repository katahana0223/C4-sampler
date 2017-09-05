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
    private var blueShape: Shape!
    private var greenShape: Shape!
    private var redShape: Shape!
    override func setup(){
        self.canvas.backgroundColor = black
        loadShape()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        blueShape.rotation = -0.5 * M_PI
        greenShape.rotation = -0.5 * M_PI
        redShape.rotation = -0.5 * M_PI
    }
    
    func loadShape(){
       
        blueShape = createShape(center: canvas.center, color: Color(0x00E5FF), radius: 30.0)
        blueShape.strokeStart = 0.0
        blueShape.strokeEnd = 0.001
        
        greenShape = createShape(center: canvas.center, color: Color(0x76FF03), radius: 65.0)
        greenShape.strokeStart = 0.0
        greenShape.strokeEnd = 0.001
        
        redShape = createShape(center: canvas.center, color: Color(0xFF1744), radius: 100.0)
        redShape.strokeStart = 0.0
        redShape.strokeEnd = 0.001
    }
    
    func createShape(center: Point, color: Color, radius: Double) -> Shape {
        let shape = Circle(center: center, radius: radius)
        shape.lineWidth = 30.0
        shape.strokeColor = color
        shape.fillColor = clear
        self.canvas.add(shape)
        return shape
    }
    
    
    //動かない！！！！！！！！！！！！！
    @IBAction func didTapCanvas(_ sender: Any) {
        // canvasをタップした時にランダムでアニメーション
        let move = ViewAnimation(duration:1.0) {
            // 0~1の範囲でランダム値を代入
            self.blueShape.strokeEnd = random01()
            self.greenShape.strokeEnd = random01()
            self.redShape.strokeEnd = random01()
        }
        move.animate()
    }
}
