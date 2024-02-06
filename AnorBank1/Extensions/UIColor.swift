//
//  UIColor.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 21/01/24.
//

import UIKit

extension UIColor {
    static var appColor = AppColor()
    
    
    static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static func rgbAll(_ value: CGFloat) -> UIColor {
        UIColor(red: value/255, green: value/255, blue: value/255, alpha: 1)
    }
}
struct AppColor {
    let primary: UIColor = .rgb(120, 22, 53)
}
