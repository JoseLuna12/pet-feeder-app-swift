//
//  bigInfoIndicator.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 18/5/23.
//

import UIKit

struct InformationIndicatorSettings {
    let title: String
    let info: String
    let prefix: String
    let progress: Float?
}

class bigInfoIndicator: UIView, AnchorPositions {

    let titleLabel: UILabel = {
        let t = UILabel()
        t.text = "title"
        t.textColor = .white
        t.font = .systemFont(ofSize: 17, weight: .regular)
        return t
    }()
    
    let infoLabel: UILabel = {
        let i = UILabel()
        i.text = "12"
        i.textColor = .white
        i.font = .systemFont(ofSize: 45, weight: .bold)
        return i
    }()
    
    let prefixLabel: UILabel = {
        let l = UILabel()
        l.text = "/120kg"
        l.textColor = .white
        l.font = .systemFont(ofSize: 17, weight: .regular)
        return l
    }()
    
    let progressBar: UIProgressView = {
        let p = UIProgressView()
        p.progressTintColor = UIColor(named: "yellow")
        p.trackTintColor = .white
        return p
    }()
    
    func setup(from settings: InformationIndicatorSettings){
        titleLabel.text = settings.title
        infoLabel.text = settings.info
        prefixLabel.text = settings.prefix
        if let progress = settings.progress {
            progressBar.progress = progress
        }
        layer.cornerRadius = 10
        backgroundColor = UIColor(named: "green-dark")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(infoLabel)
        addSubview(prefixLabel)
        addSubview(progressBar)
        clipsToBounds = true
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        titleLabel.sizeToFit()
        infoLabel.sizeToFit()
        prefixLabel.sizeToFit()
        progressBar.sizeToFit()
        
        let paddingx:CGFloat = 16
        let spaceBetween: CGFloat = 25
        
        
        titleLabel.frame = CGRect(x: paddingx, y: spaceBetween, width: titleLabel.frame.size.width, height: titleLabel.frame.size.height)
        
        infoLabel.frame = CGRect(x: paddingx, y: titleLabel.frame.height + spaceBetween, width: infoLabel.frame.size.width, height: infoLabel.frame.size.height)
        
        let yPrefixLabelPos = titleLabel.frame.size.height + infoLabel.frame.size.height - prefixLabel.frame.size.height - 10
        
        prefixLabel.frame = CGRect(x: paddingx + infoLabel.frame.size.width + 10, y: spaceBetween + yPrefixLabelPos, width: prefixLabel.frame.size.width, height: prefixLabel.frame.size.height)
        
        let yProgressBarPos = frame.size.height - spaceBetween - progressBar.frame.size.height + 10
        progressBar.frame = CGRect(
            x: 16,
            y: yProgressBarPos,
            width: frame.size.width - (paddingx*2),
            height: progressBar.frame.size.height
        )
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
