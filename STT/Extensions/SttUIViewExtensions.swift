//
//  SttUIViewExtensions.swift
//  STT
//
//  Created by Standret on 22.06.18.
//  Copyright © 2019 Peter Standret <pstandret@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
import UIKit
import TinyConstraints

public extension UIView {
    func createCircle(dominateWidth: Bool = false, clipToBounds: Bool = true) {
        if dominateWidth {
            layer.cornerRadius = bounds.width / 2
        }
        else {
            layer.cornerRadius = bounds.height / 2
        }
        self.clipsToBounds = clipToBounds
    }
    
    func setBorder(color: UIColor, size: Float = 1) {
        self.clipsToBounds = true
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = CGFloat(size)
    }
    
    func setBorder(named: String, size: Float = 1) {
        self.setBorder(color: UIColor(named: named)!, size: size)
    }
    
    func setShadow(color: UIColor, offset: CGSize = CGSize.zero, opacity: Float = 0.2, radius: Float = 1) {
        
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
        layer.shadowRadius = CGFloat(radius)
    }
    
    func setGradient(color1: UIColor, color2: UIColor) {
        
        let gradient = CAGradientLayer()
        
        gradient.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        
        self.layer.masksToBounds = true
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func setIndicator(style: UIActivityIndicatorView.Style = .gray, color: UIColor = UIColor.gray) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.style = style
        indicator.color = color
        
        self.addSubview(indicator)
        indicator.centerInSuperview()
        
        return indicator
    }
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.topAnchor
        }
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.leftAnchor
        }else {
            return self.leftAnchor
        }
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.rightAnchor
        }else {
            return self.rightAnchor
        }
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.bottomAnchor
        }
    }
}
