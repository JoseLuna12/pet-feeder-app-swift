//
//  BigActionButton.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 23/5/23.
//

import UIKit

struct BigActionButtonSettings {
    let label: String
    let icon: String
}

class BigActionButton: UIButton {
    
    let icon: UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFit
        i.clipsToBounds = true
        return i
    }()
    
    let label: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 14, weight: .semibold)
        l.textColor = UIColor(named: "black")
        return l
    }()
    
    func setup(with settings: BigActionButtonSettings){
        icon.image = UIImage(named: settings.icon)
        label.text = settings.label
        
        label.sizeToFit()
        icon.sizeToFit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(icon)
        addSubview(label)
        layer.cornerRadius = 20
        backgroundColor = UIColor(named: "green-normal")
        addTarget(self, action: #selector(touchDownButton), for: .touchDown)
        addTarget(self, action: #selector(touchUpdButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func touchDownButton(sender: UIButton){
        UIView.animate(withDuration: 0.2) {
            self.alpha = 0.8
        }
    }
    @objc func touchUpdButton(sender: UIButton){
        UIView.animate(withDuration: 0.2) {
            self.alpha = 1
        }
    }
    
    override func layoutSubviews() {
        icon.sizeToFit()
        label.sizeToFit()
        let centerX = (frame.size.width - icon.frame.size.width - label.frame.size.width + 5)/2
        
        icon.frame = CGRect(x: centerX, y: (frame.size.height - icon.frame.size.height) / 2, width: icon.frame.size.width, height: icon.frame.size.height)
        
        label.frame = CGRect(x: centerX + icon.frame.size.width + 5, y: (frame.size.height - label.frame.size.height) / 2, width: label.frame.size.width, height: label.frame.size.height)
    }

}
