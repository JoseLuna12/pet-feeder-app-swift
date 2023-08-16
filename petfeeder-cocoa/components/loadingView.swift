//
//  loadingView.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 17/5/23.
//

import UIKit

struct LoadingViewSettings {
    let width: CGFloat
    let height: CGFloat
    let message: String
}

class loadingView: UIView {
    
    let label: UILabel = {
        let l = UILabel()
        l.text = "message"
        l.numberOfLines = 1
        l.textAlignment = .center
        return l
    }()
    
    let loaderView: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .large)
        loader.translatesAutoresizingMaskIntoConstraints = false
        
        return loader
    }()
    
    func setup(with settings: LoadingViewSettings){
        label.text = settings.message
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = UIColor(named: "green-dark")
        backgroundColor = .white
    }
    
    func startSpin(){
        loaderView.startAnimating()
    }
    
    func stopSpin(){
        removeFromSuperview()
        loaderView.stopAnimating()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(loaderView)
        addSubview(label)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let loaderSize: CGFloat = 50
        let xPosition: CGFloat = (frame.size.width - 50) / 2
        let yPosition: CGFloat = (frame.size.height - 50) / 2
        
        loaderView.frame = CGRect(x: xPosition, y: yPosition, width: loaderSize, height: loaderSize)
        label.frame = CGRect(x: 0, y: yPosition + 50, width: frame.size.width, height: 60)
    }

}
