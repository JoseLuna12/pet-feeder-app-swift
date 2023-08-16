//
//  roundedButton.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 17/5/23.
//

import UIKit

struct ButtonSettings {
    let text: String
    let textSize: CGFloat
    let color: UIColor?
    let textColor: UIColor?
    let rounded: Bool = true
}

class roundedButton: UIButton, AnchorPositions{
    
    let label: UILabel = {
       let l = UILabel()
        l.text = "button"
        l.textAlignment = .center
        l.textColor = .black
        l.font = .systemFont(ofSize: 12, weight: .medium)
        return l
    }()
    
    func setup(with settings: ButtonSettings){
        layer.cornerRadius = settings.rounded ? 10 : 0
        isUserInteractionEnabled = true
        
        backgroundColor = settings.color ?? UIColor.red
        
        label.text = settings.text
        label.textColor = settings.textColor
        label.font = .systemFont(ofSize: settings.textSize, weight: .medium)
        
        addTarget(self, action: #selector(touchDownButton), for: .touchDown)
        addTarget(self, action: #selector(touchUpdButton), for: .touchUpInside)
    }
    
    @objc func touchDownButton(sender: UIButton){
        alpha = 0.8
    }
    @objc func touchUpdButton(sender: UIButton){
        alpha = 1
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        
        let labelX = (frame.size.width - label.frame.width) / 2
        let labelY = (frame.size.height - label.frame.height) / 2
        
        
        label.frame = CGRect(x: labelX, y: labelY, width: label.frame.size.width, height: label.frame.size.height)
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
