//
//  NavBarButton.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 23/5/23.
//

import UIKit

class NavBarButton: UIButton {
    
    let icon: UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFit
        i.clipsToBounds = true
        return i
    }()
    
    func setup(with image: String){
        icon.image = UIImage(named: image)
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(icon)
        addTarget(self, action: #selector(touchDownButton), for: .touchDown)
        addTarget(self, action: #selector(touchUpdButton), for: .touchUpInside)
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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        icon.sizeToFit()
        icon.frame = CGRect(x: (frame.size.width - icon.frame.size.width) / 2, y: (frame.size.height - icon.frame.size.height) / 2, width: frame.size.width - frame.size.width * 0.05, height: frame.size.height - frame.size.height * 0.05)
    }


}
