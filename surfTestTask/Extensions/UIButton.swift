//
//  UIButton.swift
//  surfTestTask
//
//  Created by Ivan Savkov on 9.02.23.
//

import UIKit

final class InteractiveButton: UIButton {
    
    convenience init(radius: CGFloat, backgroundColor: UIColor, textColor: UIColor) {
        self.init()
        layer.cornerRadius = radius
        clipsToBounds = true
        self.setBackgroundImage(UIImage(color: backgroundColor), for: .normal)
        self.setBackgroundImage(UIImage(color: Colors.highlighted), for: .highlighted)
        setTitleColor(textColor, for: .normal)
    }
}


struct Colors {
    static let highlighted = UIColor.systemGray2
}

extension UIImage {
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
