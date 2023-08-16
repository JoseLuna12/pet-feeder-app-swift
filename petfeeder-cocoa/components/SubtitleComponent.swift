//
//  SubtitleComponent.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 19/5/23.
//

import UIKit

class SubtitleComponent: UILabel {
    
    func setup(with t: String){
        text = t
        sizeToFit()
        frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        font = .systemFont(ofSize: 19, weight: .medium)
        textColor = UIColor(named: "black")
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
