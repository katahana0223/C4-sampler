//
//  SixthViewController.swift
//  C4-Sampler
//
//  Created by hahahahahanananana on 2017/10/24.
//  Copyright © 2017年 片岡. All rights reserved.
//

import C4

class SixthViewController: CanvasController {
    var timer: Timer!
    var gradients = [Gradient]()
    
    override func setup() {
        //        let g =  createGradient(canvas.center)
        //        self.createAnim(g)
        var x = 2.0
        repeat {
            gradients.append(createGradient(point: Point(x,canvas.center.y)))
            x += 3.0
        } while x < canvas.width
        
        
        timer = Timer(interval: 0.02, count:gradients.count ){ () -> () in
            let g = self.gradients[self.timer.step]
            self.createAnimation(g: g)
        }
        timer.start()
    }
    func createGradient(point: Point) -> Gradient {
    var colors = [C4Blue,C4Pink]
    
    if random(below: 2) == 1 {
    colors = [C4Pink,C4Blue]
    }
    
    let g = Gradient(frame: Rect(0,0,2,2))
    g.colors = colors
    g.center = point
    canvas.add(g)
    return g
}

func createAnimation(g: Gradient){
    let anim = ViewAnimation(duration: 2.0){
        var f = g.frame
        let c = g.center
        f.height = 100
        f.center = c
        g.frame = f
    }
    anim.curve = .EaseInOut
    anim.autoreverses = true
    anim.repeats = true
    anim.animate()
}
}

