//
//  Constant.swift
//  TechAssessment
//
//  Created by Darshana  on 26/04/24.
//

import Foundation
import UIKit

let apiURL = "https://jsonplaceholder.typicode.com/posts?userId="


extension String {
    
    func setString(key: String) -> NSAttributedString {
        let attribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
        let keyString = NSMutableAttributedString(string: key, attributes: attribute)
        
        let valueAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        let value = NSMutableAttributedString(string: self, attributes: valueAttribute)
        
        let mainString = NSMutableAttributedString(attributedString: keyString)
        
        mainString.append(value)
        
        return mainString
        
    }
    
}

extension UIViewController {
    func activityIndicator(effectView: UIVisualEffectView) {
        
        var activityIndicator = UIActivityIndicatorView()
        
        activityIndicator.removeFromSuperview()
        effectView.removeFromSuperview()
        effectView.frame = CGRect(x: view.frame.midX - 50, y: view.frame.midY - 50, width: 50, height: 50)
        effectView.layer.cornerRadius = 15
        effectView.layer.masksToBounds = true
        activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.startAnimating()
        effectView.contentView.addSubview(activityIndicator)
        view.addSubview(effectView)
    }
}
