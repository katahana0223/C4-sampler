//
//  FourthViewController.swift
//  C4-Sampler
//
//  Created by hahahahahanananana on 2017/09/05.
//  Copyright © 2017年 片岡. All rights reserved.
//


import C4
class FourthViewController: CanvasController {
    var player: AudioPlayer!
    var timer: Timer?
    
    var maxPaths = (Path(),Path())
    var avgPaths = (Path(),Path())
    
    var maxShapes = (Shape(),Shape())
    var avgShapes = (Shape(),Shape())
    
    var θ = 0.0
    
    var maxPeak = (30.981050491333, 31.1506500244141)
    var avgPeak = (63.9939880371094, 63.8977127075195)
    
    
    override func setup() {
        canvas.backgroundColor = Color(red: 0.933, green: 1.0, blue:0.0, alpha: 1.0)
        setupShapes()
        setupPlayer()
        setupLogo()
        setupTimer()
    }
    
    func styleShape(shape: Shape){
        shape.lineWidth = 0.5
        shape.fillColor = clear
        shape.strokeColor = black
    }
    
    func setupShapes(){
        maxShapes.0.path = maxPaths.0
        maxShapes.1.path = maxPaths.1
        
        avgShapes.0.path = avgPaths.0
        avgShapes.1.path = avgPaths.1
        
        styleShape(shape: maxShapes.0)
        styleShape(shape: maxShapes.1)
        styleShape(shape: avgShapes.0)
        styleShape(shape: avgShapes.1)
        
        canvas.add(maxShapes.0)
        canvas.add(maxShapes.1)
        canvas.add(avgShapes.0)
        canvas.add(avgShapes.1)
        
        maxShapes.1.transform.rotate(M_PI)
        avgShapes.0.transform.rotate(M_PI_2)
        avgShapes.1.transform.rotate(M_PI_2 * 3)
        
    }
    func setupPlayer(){
        player = AudioPlayer("BlackVelvet.m4a")
        player?.meteringEnabled = true
        player?.loops = true
        player?.play()
    }
    func setupLogo(){
        let logo = Image("ushi1.gif")
        logo?.anchorPoint = Point(0.337, 0.468)
        logo?.center = canvas.center
        canvas.add(logo)
    }
    func generatePoint(radius: Double) -> Point {
        return Point(radius * cos(θ), radius * (θ))
    }
    func normalize(val: Double, max: Double) -> Double {
        var normMax = abs(val)
        normMax /= max
        return map(normMax, min: 0, max: 1, toMin: 100, toMax: 200)
    }
    func resetPaths(){
        maxPaths = (Path(),Path())
        avgPaths = (Path(),Path())
    }
    func generateNextPoints(){
        let max0 = normalize(val: player.peakPower(0), max: maxPeak.0)
        maxPaths.0.addLineToPoint(generatePoint(radius: max0))
        
        let max1 = normalize(val: player.peakPower(1), max: maxPeak.1)
        maxPaths.1.addLineToPoint(generatePoint(radius: max1))
        
        let avg0 = normalize(val: player.peakPower(0), max: avgPeak.0)
        avgPaths.0.addLineToPoint(generatePoint(radius: avg0))
        
        let avg1 = normalize(val: player.peakPower(1), max: avgPeak.1)
        avgPaths.1.addLineToPoint(generatePoint(radius: avg1))
        
        θ += M_PI / 180.0
        
        if θ >= 2 * M_PI {
            θ = 0.0
            resetPaths()
        }
    }
    func updateShapes(){
        maxShapes.0.path = maxPaths.0
        maxShapes.0.center = canvas.center
        
        maxShapes.1.path = maxPaths.1
        maxShapes.1.center = canvas.center
        
        avgShapes.0.path = maxPaths.0
        avgShapes.0.center = canvas.center
        
        avgShapes.1.path = maxPaths.1
        avgShapes.1.center = canvas.center
    }
    func setupTimer(){
        timer = Timer (interval: 1.0/60.0){
            self.player.updateMeters()
            self.generateNextPoints()
            self.updateShapes()
        }
        timer?.start()
    }
}
