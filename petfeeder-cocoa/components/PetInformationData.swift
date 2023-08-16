//
//  PetInformationData.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 28/5/23.
//

import UIKit

struct PetInformationSettings {
    let data: String
    let context: String
}

class PetInformationData: UIView {
    
    let data: UILabel = {
        let d = UILabel()
        d.font = .systemFont(ofSize: 40, weight: .semibold)
        d.textColor = .white
        return d
    }()
    
    let context: UILabel = {
        let c = UILabel()
        c.font = .systemFont(ofSize: 15, weight: .regular)
        c.textColor = .white
        return c
    }()
    
    func setup(with settings: PetInformationSettings){
        data.text = settings.data
        context.text = settings.context
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(data)
        addSubview(context)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        data.sizeToFit()
        context.sizeToFit()
        
//        frame = CGRect(x: 0, y: 0, width: context.frame.size.width, height: context.frame.size.height + data.frame.size.height)
        
        context.frame = CGRect(x: 0, y: ((context.frame.size.height + data.frame.size.height) / 2) - 10 , width: context.frame.size.width, height: context.frame.size.height)
        
        data.frame = CGRect(x: (context.frame.size.width - data.frame.size.width ) / 2 , y: (context.frame.size.height - data.frame.size.height - 5) / 2, width: data.frame.size.width, height: data.frame.size.height)
        //
        //CGRect(x: 0, y: 0, width: data.frame.size.width, height: data.frame.size.height)
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: context.frame.size.width),
            heightAnchor.constraint(equalToConstant: context.frame.size.height + data.frame.size.height)
        ])
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
