//
//  customTextField.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 17/5/23.
//

import UIKit

struct CustomInput {
    let placeholder: String
    let keyboard: UIKeyboardType?
    let contentType: UITextContentType?
}


class customTextField: UITextField, AnchorPositions {
    
    func setup(with settings: CustomInput){
        placeholder = settings.placeholder
        keyboardType = settings.keyboard ?? .default
        textContentType = settings.contentType ?? .username
        backgroundColor = UIColor.white
        borderStyle = .roundedRect
        
        autocapitalizationType = .none
        autocorrectionType = .no
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func centerAnchorX(to center: NSLayoutXAxisAnchor, offset topOffset: CGFloat){
        centerXAnchor.constraint(equalTo: center, constant: topOffset).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, offsetTop: CGFloat = 0, offsetRight: CGFloat = 0, offsetLeft: CGFloat = 0, offsetBot: CGFloat = 0){
        
        if let anchorTop = top {
            topAnchor.constraint(equalTo: anchorTop, constant: offsetTop).isActive = true
        }
        
        if let anchorRight = right {
            rightAnchor.constraint(equalTo: anchorRight, constant: offsetRight).isActive = true
        }
        
        if let anchorLeft = left {
            leftAnchor.constraint(equalTo: anchorLeft, constant: offsetLeft).isActive = true
        }
        
        if let anchorBot = bottom {
            bottomAnchor.constraint(equalTo: anchorBot, constant: offsetBot).isActive = true
        }
        
    }

}
