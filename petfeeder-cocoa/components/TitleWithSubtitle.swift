//
//  TitleWithSubtitle.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 18/5/23.
//

import UIKit

struct TitlePageSettings {
    let title: String
    let subtitle: String?
}

class TitleWithSubtitle: UIView, AnchorPositions {

    private var hasSubtitle = true
    
    let title: UILabel = {
        let t = UILabel()
        t.font = .systemFont(ofSize: 35, weight: .bold)
        t.textColor = UIColor(named: "black")
        t.text = "Home"
        return t
    }()
    
    let subtitle: UILabel = {
        let s = UILabel()
        s.font = .systemFont(ofSize: 12, weight: .light)
        s.textColor = UIColor(named: "yellow")
        return s
    }()
    
    func setup(with settings: TitlePageSettings){
        title.text = settings.title
        
        if let settingsSubtitle = settings.subtitle {
            subtitle.text = settingsSubtitle
        }else{
            hasSubtitle = false
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
        if (hasSubtitle){
            addSubview(subtitle)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        title.sizeToFit()
        subtitle.sizeToFit()
        
        subtitle.frame = CGRect(x: 16, y: 16, width: subtitle.frame.size.width, height: subtitle.frame.size.height)
        title.frame = CGRect(x: 16, y: subtitle.frame.size.height + 16, width: title.frame.size.width, height: title.frame.size.height)
    }
    
    func centerAnchorX(to center: NSLayoutXAxisAnchor, offset topOffset: CGFloat){
        centerXAnchor.constraint(equalTo: center, constant: topOffset).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, offsetTop: CGFloat = 0, offsetRight: CGFloat = 0, offsetLeft: CGFloat = 0, offsetBot: CGFloat = 0){
        
        translatesAutoresizingMaskIntoConstraints = false
        
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
