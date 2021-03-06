//
//  FifthViewController.swift
//  C4-Sampler
//
//  Created by hahahahahanananana on 2017/09/12.
//  Copyright © 2017年 片岡. All rights reserved.
//

import C4

class FifthViewContriller: CanvasController {
    
    var b1: Shape!
    var b2: Shape!
    var b3: Shape!
    var b1ToX: ViewAnimation!
    var b1ToCheck: ViewAnimation!
    var b2ToX: ViewAnimation!
    var b2ToCheck: ViewAnimation!
    var b3ToX: ViewAnimation!
    var b3ToCheck: ViewAnimation!
    var x = false
    let d = 0.5
    let dc = 0.25
    
    
    
    override func setup() {
        canvas.backgroundColor = C4Purple
        createB1Animations()
        createB2Animations()
        createB3Animations()
        b1 = createBezier1()
        b2 = createBezier2()
        b3 = createBezier3()
        canvas.add(b1)
        b1.center = canvas.center
        b1.add(b2)
        b1.add(b3)
        canvas.add(b1)
        canvas.addTapGestureRecognizer{locations, center, state in
            if self .x{
                self .animate(color:C4Blue)
            }else{
                self.animate(color: C4Pink)
            }
            self .x = !self.x
        }
        
    }
    func createBezier1() -> Shape{
        let bezier = UIBezierPath()
        bezier.move(to: CGPoint(x: 177.2, y: 30.4))
        bezier.addCurve(to: CGPoint(x: 103.8, y: 0), controlPoint1:CGPoint(x:158.4,y:11.6) , controlPoint2: CGPoint(x:132.5,y:0))
        bezier.addCurve(to: CGPoint(x: 0, y: 103.8), controlPoint1: CGPoint(x:46.5,y:0) , controlPoint2: CGPoint(x:0,y:46.5))
        bezier.addCurve(to: CGPoint(x: 103.8, y: 207.6), controlPoint1: CGPoint(x:0,y:161.1) , controlPoint2: CGPoint(x:46.5,y:207.6))
        bezier.addCurve(to: CGPoint(x: 207.6, y: 103.8), controlPoint1: CGPoint(x:161.1,y:207.6) , controlPoint2: CGPoint(x:207.6,y:161.1))
        bezier.addCurve(to: CGPoint(x: 177.2, y: 30.4), controlPoint1: CGPoint(x:207.6,y:75.1) , controlPoint2: CGPoint(x:196,y:49.2))
        bezier.addLine(to: CGPoint(x: 69.2, y: 138.4))
        let path = Path(path: bezier.cgPath)
        let shape = Shape(path)
        shape.fillColor = clear
        shape.lineWidth = 2.0
        shape.strokeStart = 0.0
        shape.strokeEnd = 0.81
        shape.strokeColor = C4Blue
        return shape
    }
    func createBezier2() -> Shape{
        let bezier = UIBezierPath()
        bezier.move(to: CGPoint(x:90.9, y:138.4))
        bezier.addLine(to: CGPoint(x:10.6, y:58.1))
        bezier.addCurve(to: CGPoint(x:0, y:103.8), controlPoint1:CGPoint(x:3.8, y:71.9) , controlPoint2: CGPoint(x:
            0, y:87.4))
        bezier.addCurve(to: CGPoint(x:103.8, y:207.6), controlPoint1:CGPoint(x:0, y:161.1) , controlPoint2: CGPoint(x:
            46.5, y:207.6))
        bezier.addCurve(to: CGPoint(x:207.7, y:103.8), controlPoint1:CGPoint(x:161.1, y:207.6) , controlPoint2: CGPoint(x:207.7, y:161.1))
        bezier.addCurve(to: CGPoint(x:103.9, y:0), controlPoint1:CGPoint(x:207.7, y:46.5) , controlPoint2: CGPoint(x:
            161.3 , y:0))
        bezier.addCurve(to: CGPoint(x:10.7, y:58.1), controlPoint1:CGPoint(x:63, y:0) , controlPoint2: CGPoint(x:
            27.6, y:23.7))
        let path = Path(path: bezier.cgPath)
        let shape = Shape(path)
        shape.fillColor = clear
        shape.lineWidth = 2.0
        shape.strokeStart = 0.0
        shape.strokeEnd = 0.06
        shape.strokeColor = C4Blue
        return shape
    }
    func createBezier3() -> Shape{
        let bezier = UIBezierPath()
        bezier.move(to: CGPoint(x: 138.4, y:138.4))
        bezier.addLine(to: CGPoint(x: 30.4, y: 30.4))
        bezier.addCurve(to: CGPoint(x:0, y:103.8), controlPoint1: CGPoint(x:11.6, y:49.2), controlPoint2: CGPoint(x:0, y:75.1))
        bezier.addCurve(to: CGPoint(x:42, y:187.2), controlPoint1: CGPoint(x:0, y:138), controlPoint2: CGPoint(x:16.5, y:168.3))
        bezier.addLine(to: CGPoint(x:160, y:69.2))
        let path = Path(path: bezier.cgPath)
        let shape = Shape(path)
        shape.fillColor = clear
        shape.lineWidth = 2.0
        shape.strokeStart = 0.804
        shape.strokeEnd = 1.0
        shape.strokeColor = C4Blue
        return shape
    }
    func animate(color: Color){
        ViewAnimation(duration: d + dc){
            self.b1.strokeColor = color
            self.b2.strokeColor = color
            self.b3.strokeColor = color
            }.animate()
    }
    func createB1Animations() {
        b1ToX = ViewAnimation(duration: d) {
            self.b1.strokeStart = 0.6
        }
        b1ToX.curve = .EaseIn
        
        b1ToX.addCompletionObserver { () -> Void in
            let a = ViewAnimation(duration: self.dc) {
                self.b1.strokeStart = 0.88
                self.b1.strokeEnd = 1.0
            }
            a.curve = .EaseOut
            a.animate()
        }
        
        b1ToCheck = ViewAnimation(duration: d) {
            self.b1.strokeStart = 0.6
            self.b1.strokeEnd = 0.81
        }
        b1ToCheck.curve = .EaseIn
        b1ToCheck.addCompletionObserver { () -> Void in
            let a = ViewAnimation(duration: self.dc) {
                self.b1.strokeStart = 0.0
            }
            a.curve = .EaseOut
            a.animate()
        }
        
    }
    func createB2Animations() {
        b2ToX = ViewAnimation(duration: d) {
            self.b2.strokeStart = 0.15
            self.b2.strokeEnd = 0.21
        }
        b2ToX.curve = .EaseIn
        b2ToX.addCompletionObserver { () -> Void in
            let a = ViewAnimation(duration: self.dc) {
                self.b2.strokeEnd = 1.0
            }
            a.curve = .EaseOut
            a.animate()
        }
        
        b2ToCheck = ViewAnimation(duration: d) {
            self.b2.strokeEnd = 0.21
        }
        b2ToCheck.curve = .EaseIn
        b2ToCheck.addCompletionObserver { () -> Void in
            let a = ViewAnimation(duration: self.dc) {
                self.b2.strokeStart = 0.0
                self.b2.strokeEnd = 0.06
            }
            a.curve = .EaseOut
            a.animate()
        }
        
    }
    
    func createB3Animations() {
        b3ToX = ViewAnimation(duration: d) {
            self.b3.strokeStart = 0.0
            self.b3.strokeEnd = 0.19
        }
        
        b3ToCheck = ViewAnimation(duration: d) {
            self.b3.strokeStart = 0.804
            self.b3.strokeEnd = 1.0
        }
    }
}
