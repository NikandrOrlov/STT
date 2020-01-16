//
//  Command+UIKit.swift
//  STT
//
//  Created by Peter Standret on 9/21/19.
//  Copyright © 2019 standret. All rights reserved.
//

import Foundation
import UIKit

public extension CommandType {
    
    @discardableResult
    func useIndicator(
        button: UIButton,
        style: UIActivityIndicatorView.Style = .gray,
        color: UIColor = .gray
        ) -> EventDisposable {
        
        let indicator = button.setIndicator()
        indicator.style = style
        indicator.color = color
        indicator.setNeedsDisplay()
        
        let title = button.titleLabel?.text
        let image = button.image(for: .normal)

        return self.observe(start: {
            button.setImage(nil, for: .disabled)
            button.setTitle("", for: .disabled)
            button.setNeedsDisplay()
            button.isEnabled = false
            indicator.startAnimating()
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }) {
            button.setImage(image, for: .disabled)
            button.setTitle(title, for: .disabled)
            button.setNeedsDisplay()
            button.isEnabled = true
            indicator.stopAnimating()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
    @discardableResult
    func useIndicator(
        view: UIView,
        style: UIActivityIndicatorView.Style = .gray,
        color: UIColor = .gray
        ) -> EventDisposable {
        
        let indicator = view.setIndicator()
        indicator.style = style
        indicator.color = color
        indicator.setNeedsDisplay()
        
        return self.observe(start: {
            indicator.startAnimating()
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }) {
            indicator.stopAnimating()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
    @discardableResult
    func useRefresh(
        scrollView: UIScrollView,
        parameter: Any? = nil
        )
        -> (disposable: EventDisposable, refreshControl: UIRefreshControl) {
            
        let refreshControl = SttRefreshControl()
        scrollView.refreshControl = refreshControl
        return (disposable: refreshControl.useCommand(self, parameter: parameter), refreshControl: refreshControl)
    }
}
