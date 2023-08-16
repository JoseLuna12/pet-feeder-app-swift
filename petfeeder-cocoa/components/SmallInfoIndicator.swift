//
//  SmallInfoIndicator.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 19/5/23.
//

import UIKit

struct SmallInfoSettings {
    let title: String
    let info: String
    let sufix: String
}

class SmallInfoIndicator: UIView {
    
    let title: UILabel = {
        let t = UILabel()
        t.text = "title"
        t.font = .systemFont(ofSize: 13, weight: .regular)
        t.textColor = UIColor(named: "black")
        return t
    }()
    
    let sufix: UILabel = {
        let s = UILabel()
        s.text = "Sufix"
        s.font = .systemFont(ofSize: 13, weight: .thin)
        s.textColor = UIColor(named: "black")
        return s
    }()
    
    let info: UILabel = {
        let i = UILabel()
        i.text = "32"
        i.font = .systemFont(ofSize: 57, weight: .bold)
        i.textColor = UIColor(named: "black")
        return i
    }()
    
    
    func setup(with settings: SmallInfoSettings){
        backgroundColor = UIColor(named: "green-light")
        layer.cornerRadius = 10
        title.text = settings.title
        sufix.text = settings.sufix
        info.text = settings.info
    }
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
        addSubview(info)
        addSubview(sufix)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func layoutSubviews() {
        title.sizeToFit()
        sufix.sizeToFit()
        info.sizeToFit()
        
        let spaceY: CGFloat = 25
        
        let yPosition = (frame.size.height - title.frame.size.height - info.frame.size.height) / 2
        let xPosition = (frame.size.width - info.frame.size.width - sufix.frame.size.width - 10) / 2
        
        title.frame = CGRect(x: xPosition, y: yPosition, width: frame.size.width, height: title.frame.size.height)
        
        info.frame = CGRect(x: xPosition, y: yPosition + spaceY, width: info.frame.size.width, height: info.frame.size.height)
        
        sufix.frame = CGRect(x: xPosition + info.frame.size.width + 10, y: yPosition +  (title.frame.size.height + info.frame.size.height) - sufix.frame.size.height - 5, width: sufix.frame.size.width , height: sufix.frame.size.height)
    }

}
