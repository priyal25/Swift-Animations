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
        
        zerolayer.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 0.8).cgColor
        zerolayer.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
//        layer.cornerRadius = 100
        
        layer.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.9).cgColor
        layer.frame = CGRect(x: 100, y: 150, width: 200, height: 200)
        layer.cornerRadius = 100

        bigLayer.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor
        bigLayer.frame =  CGRect(x: 50, y: 100, width: 300, height: 300)
        bigLayer.cornerRadius = 150

        thirdLayer.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.3).cgColor
        thirdLayer.frame =  CGRect(x: 25, y: 75, width: 350, height: 350)
        thirdLayer.cornerRadius = 175
        
        view.layer.addSublayer(layer)
        view.layer.addSublayer(bigLayer)
        view.layer.addSublayer(thirdLayer)
//        view.layer.addSublayer(zerolayer)
        
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
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        
        layer.add(animation, forKey: nil)
        bigLayer.add(animation, forKey: nil)
        thirdLayer.add(animation, forKey: nil)
        zerolayer.add(animation, forKey: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            self.secondMoveTransition()
            self.secondOpacity()
        })
    }

    
    func firstMoveTransition() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: layer.frame.origin.x + layer.frame.width/2 , y: layer.frame.origin.y)
        animation.toValue = CGPoint(x: view.frame.width, y: view.frame.height * 0.5)
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        
        layer.add(animation, forKey: nil)
        bigLayer.add(animation, forKey: nil)
        thirdLayer.add(animation, forKey: nil)
        zerolayer.add(animation, forKey: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            self.secondMoveTransition()
            self.secondOpacity()
        })
    }
    
    func firstOpacityAnimation() {
        let secondTransition = CABasicAnimation(keyPath: "opacity")
        secondTransition.fromValue = 1
        secondTransition.toValue = 0.1
        secondTransition.beginTime = CACurrentMediaTime()
        secondTransition.duration = 2
        secondTransition.fillMode = .forwards
        secondTransition.isRemovedOnCompletion = false
        layer.add(secondTransition, forKey: nil)
        bigLayer.add(secondTransition, forKey: nil)
        thirdLayer.add(secondTransition, forKey: nil)
        zerolayer.add(secondTransition, forKey: nil)

    }
    
    func secondMoveTransition() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: view.frame.width, y: view.frame.height * 0.5)
        animation.toValue = CGPoint(x: view.frame.width/2, y: view.frame.height)
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        
        layer.add(animation, forKey: nil)
        bigLayer.add(animation, forKey: nil)
        thirdLayer.add(animation, forKey: nil)
        zerolayer.add(animation, forKey: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            self.thirdMoveTransition()
            self.thirdOpacity()
        })
    }
    
    func secondOpacity() {
        let secondTransition = CABasicAnimation(keyPath: "opacity")
        secondTransition.fromValue =  0.1
        secondTransition.toValue = 1
        secondTransition.beginTime = CACurrentMediaTime()
        secondTransition.duration = 2
        secondTransition.fillMode = .forwards
        secondTransition.isRemovedOnCompletion = false
        layer.add(secondTransition, forKey: nil)
        bigLayer.add(secondTransition, forKey: nil)
        thirdLayer.add(secondTransition, forKey: nil)
        zerolayer.add(secondTransition, forKey: nil)

    }
    
    func thirdMoveTransition() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: view.frame.width/2, y: view.frame.height)
        animation.toValue = CGPoint(x: view.frame.origin.x, y: view.frame.height/2)
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        layer.add(animation, forKey: nil)
        bigLayer.add(animation, forKey: nil)
        thirdLayer.add(animation, forKey: nil)
        zerolayer.add(animation, forKey: nil)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            self.fourthOpacity()
            self.fourthMoveTransition()
        })
    }
    
    func thirdOpacity() {
        let secondTransition = CABasicAnimation(keyPath: "opacity")
        secondTransition.fromValue =  1
        secondTransition.toValue = 0.1
        secondTransition.beginTime = CACurrentMediaTime()
        secondTransition.duration = 2
        secondTransition.fillMode = .forwards
        secondTransition.isRemovedOnCompletion = false
        layer.add(secondTransition, forKey: nil)
        bigLayer.add(secondTransition, forKey: nil)
        thirdLayer.add(secondTransition, forKey: nil)
        zerolayer.add(secondTransition, forKey: nil)
    }
    
    func fourthMoveTransition()  {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: view.frame.origin.x, y: view.frame.height/2)
        animation.toValue =  CGPoint(x: layer.frame.origin.x + layer.frame.width/2 , y: layer.frame.origin.y)
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        layer.add(animation, forKey: nil)
        bigLayer.add(animation, forKey: nil)
        thirdLayer.add(animation, forKey: nil)
        zerolayer.add(animation, forKey: nil)

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
        secondTransition.beginTime = CACurrentMediaTime()
        secondTransition.duration = 2
        secondTransition.fillMode = .forwards
        secondTransition.isRemovedOnCompletion = false
        layer.add(secondTransition, forKey: nil)
        bigLayer.add(secondTransition, forKey: nil)
        thirdLayer.add(secondTransition, forKey: nil)
        zerolayer.add(secondTransition, forKey: nil)
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

