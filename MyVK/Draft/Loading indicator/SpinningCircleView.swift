//
//  CustomIndicatorLoading.swift
//  9l_ArturDokhno
//
//  Created by Артур Дохно on 19.09.2021.
//

import UIKit

class SpinningCircleView: UIView {
    
    let spinningCircle = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        let rect = self.bounds
        let circularPath = UIBezierPath(ovalIn: rect)
        
        spinningCircle.path = circularPath.cgPath
        spinningCircle.fillColor = UIColor.clear.cgColor
        spinningCircle.strokeColor = UIColor.systemRed.cgColor
        spinningCircle.lineWidth = 10
        spinningCircle.strokeEnd = 0.25
        spinningCircle.lineCap = .round
        
        self.layer.addSublayer(spinningCircle)
    }
    
    func animate() {
        UIView.animate(
            withDuration: 1,
            delay: 0,
            options: .curveLinear,
            animations: {
                self.transform = CGAffineTransform(rotationAngle: .pi)
            }) { (completed) in
            
            UIView.animate(
                withDuration: 1,
                delay: 0,
                options: .curveLinear,
                animations: {
                    self.transform = CGAffineTransform(rotationAngle: 0)
                }) { (completed) in
                
                self.animate()
            }
            }
    }
}
