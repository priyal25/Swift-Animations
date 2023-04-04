//
//  ViewController.swift
//  SwiftAnimation
//
//  Created by Priyal Jain on 03/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    let layer = CALayer()
    let bigLayer = CALayer()
    let thirdLayer = CALayer()
    let zerolayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayers()
        startAnimation()
    }
    
    func setupLayers() {
        zerolayer.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 0.8).cgColor
        zerolayer.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
        zerolayer.cornerRadius = zerolayer.frame.width/2
        
        layer.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.9).cgColor
        layer.frame = CGRect(x: 100, y: 150, width: 200, height: 200)
        layer.cornerRadius =  layer.frame.width/2

        bigLayer.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor
        bigLayer.frame =  CGRect(x: 50, y: 100, width: 300, height: 300)
        bigLayer.cornerRadius =  bigLayer.frame.width/2

        thirdLayer.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.3).cgColor
        thirdLayer.frame =  CGRect(x: 25, y: 75, width: 350, height: 350)
        thirdLayer.cornerRadius =  thirdLayer.frame.width/2
        
        view.layer.addSublayer(layer)
        view.layer.addSublayer(bigLayer)
        view.layer.addSublayer(thirdLayer)
    }
    
    func startAnimation(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.zeroMoveTransition()
            self.firstOpacityAnimation()
            self.rotateAnimation()
        })
    }
    
    
    func zeroMoveTransition() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: layer.frame.origin.x + layer.frame.width/2 , y: layer.frame.origin.y + layer.frame.width/2)
        animation.toValue = CGPoint(x: view.frame.width, y: view.frame.height * 0.5)
        animation.setDefaultValues()
        animation.addAnimationTo([layer, bigLayer, thirdLayer])
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            self.secondMoveTransition()
            self.secondOpacity()
        })
    }

    
    func firstMoveTransition() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: layer.frame.origin.x + layer.frame.width/2 , y: layer.frame.origin.y)
        animation.toValue = CGPoint(x: view.frame.width, y: view.frame.height * 0.5)
        animation.setDefaultValues()
        animation.addAnimationTo([layer, bigLayer, thirdLayer])
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            self.secondMoveTransition()
            self.secondOpacity()
        })
    }
    
    func firstOpacityAnimation() {
        let secondTransition = CABasicAnimation(keyPath: "opacity")
        secondTransition.fromValue = 1
        secondTransition.toValue = 0.1
        secondTransition.setDefaultValues()
        secondTransition.addAnimationTo([layer, bigLayer, thirdLayer, zerolayer])
    }
    
    func secondMoveTransition() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: view.frame.width, y: view.frame.height * 0.5)
        animation.toValue = CGPoint(x: view.frame.width/2, y: view.frame.height)
        animation.setDefaultValues()
        animation.addAnimationTo([layer, bigLayer, thirdLayer, zerolayer])
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            self.thirdMoveTransition()
            self.thirdOpacity()
        })
    }
    
    func secondOpacity() {
        let secondTransition = CABasicAnimation(keyPath: "opacity")
        secondTransition.fromValue =  0.1
        secondTransition.toValue = 1
        secondTransition.setDefaultValues()
        secondTransition.addAnimationTo([layer, bigLayer, thirdLayer, zerolayer])
    }
    
    func thirdMoveTransition() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: view.frame.width/2, y: view.frame.height)
        animation.toValue = CGPoint(x: view.frame.origin.x, y: view.frame.height/2)
        animation.setDefaultValues()
        animation.addAnimationTo([layer, bigLayer, thirdLayer, zerolayer])

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            self.fourthOpacity()
            self.fourthMoveTransition()
        })
    }
    
    func thirdOpacity() {
        let secondTransition = CABasicAnimation(keyPath: "opacity")
        secondTransition.fromValue =  1
        secondTransition.toValue = 0.1
        secondTransition.setDefaultValues()
        secondTransition.addAnimationTo([layer, bigLayer, thirdLayer, zerolayer])
    }
    
    func fourthMoveTransition()  {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: view.frame.origin.x, y: view.frame.height/2)
        animation.toValue =  CGPoint(x: layer.frame.origin.x + layer.frame.width/2 , y: layer.frame.origin.y)
        animation.setDefaultValues()
        animation.addAnimationTo([layer, bigLayer, thirdLayer, zerolayer])
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            self.firstMoveTransition()
            self.firstOpacityAnimation()
            self.rotateAnimation()
        })
    }
    
    func fourthOpacity() {
        let secondTransition = CABasicAnimation(keyPath: "opacity")
        secondTransition.fromValue =  0.1
        secondTransition.toValue = 1
        secondTransition.setDefaultValues()
        secondTransition.addAnimationTo([layer, bigLayer, thirdLayer, zerolayer])
    }
    
    func rotateAnimation() {
        let rotateTransition = CABasicAnimation(keyPath: "transformRotationZ")
        rotateTransition.fromValue =   0
        rotateTransition.toValue =  CGFloat.pi * 12
        rotateTransition.beginTime = CACurrentMediaTime()
        rotateTransition.duration = 8
        rotateTransition.fillMode = .forwards
        rotateTransition.isRemovedOnCompletion = false
        
        zerolayer.add(rotateTransition, forKey: nil)
    }
}

extension CABasicAnimation {
    
    func setDefaultValues(duration: CFTimeInterval = 2, fillMode: CAMediaTimingFillMode = .forwards, removedOnCompletion: Bool = false, startTime: CFTimeInterval = CACurrentMediaTime()) {
        self.fillMode = fillMode
        self.duration = duration
        self.isRemovedOnCompletion = removedOnCompletion
        self.beginTime = startTime
    }
    
    func addAnimationTo(_ layers: [CALayer]) {
        for layer in layers {
            layer.add(self, forKey: nil)
        }
    }
}
