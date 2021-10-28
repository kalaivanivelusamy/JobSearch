//
//  CardView.swift
//  JobSearch
//
//  Created by V, Kalaivani V. (623-Extern) on 28/10/21.
//

import Foundation
import UIKit

class CardView: UITableViewCell {
    
    
}


class BrezerPath: UIView{
    
    override func draw(_ rect: CGRect) {
        let bezierPath = UIBezierPath()
        
        
        
        bezierPath.move(to: CGPoint(x: rect.maxX+5, y: rect.minY))//a
        
        bezierPath.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))//b
        bezierPath.addLine(to: CGPoint(x: rect.maxX-10, y: 10))//c
        bezierPath.addLine(to: CGPoint(x: rect.maxX-10, y: rect.maxY-5))//d
        bezierPath.addQuadCurve(to: CGPoint(x: rect.maxX-15, y: rect.maxY), controlPoint: CGPoint(x: rect.maxX-10, y: rect.maxY))
        bezierPath.addLine(to: CGPoint(x: rect.maxX-15, y: rect.maxY))//e
        bezierPath.addLine(to: CGPoint(x:rect.minX+5, y:rect.maxY))//f
        bezierPath.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY-5), controlPoint: CGPoint(x: rect.minX, y: rect.maxY))
        bezierPath.addLine(to: CGPoint(x: rect.minX, y: rect.maxY-5))//g
        bezierPath.addLine(to: CGPoint(x: rect.minX, y: rect.minY+5))//h
        bezierPath.addQuadCurve(to: CGPoint(x: rect.minX+5, y: rect.minY), controlPoint: CGPoint(x: rect.minX, y: rect.minY))
        bezierPath.addLine(to: CGPoint(x: rect.minX+5, y: rect.minY))//i
        
        UIColor.blue.setFill()
        
        bezierPath.fill()
        bezierPath.close()
        
        
    }
    
}
