//
//  FoodButtonComponent.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 19/5/23.
//

import UIKit


class FoodButtonComponent: UIButton {
    
    private var isActive = false
    private var pet: Pet!
    
    let icon: UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFit
        i.clipsToBounds = true
        return i
    }()

    let label: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 12, weight: .medium)
        l.textColor = UIColor(named: "black")
        return l
    }()
    
    func setup(with newPet: Pet){
        pet = newPet
        label.text = newPet.name
        icon.image = UIImage(named: "food-empty")
        label.sizeToFit()
        addTarget(self, action: #selector(touchDownButton), for: .touchDown)
    }
    
    func getButtonState() -> Bool {
        return isActive
    }
    
    func getPet() -> Pet {
        return pet
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "green-light")
        layer.cornerRadius = 10
        addSubview(icon)
        addSubview(label)
    }
    
    func toggleSelection(){
        isActive = !isActive
        
        if(isActive){
            UIView.animate(withDuration: 0.2) {
                self.backgroundColor = UIColor(named: "green-dark")
                self.icon.image = UIImage(named: "food-full")
                self.label.textColor = .white
                self.addShadow()
            }
        }else{
            UIView.animate(withDuration: 0.2) {
                self.backgroundColor = UIColor(named: "green-light")
                self.icon.image = UIImage(named: "food-empty")
                self.label.textColor = UIColor(named: "black")
                self.removeShadow()
            }
        }
    }
    
    func addShadow(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: -1, height: 3)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 4
    }
    
    func removeShadow(){
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0
        layer.shadowRadius = 0
    }
    
    @objc func touchDownButton(sender: UIButton){
        toggleSelection()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        let iconSize: CGFloat = 65
        
        icon.frame = CGRect(x: (frame.size.width - iconSize - 5) / 2, y: (frame.size.height - iconSize - 20) / 2, width: iconSize, height: iconSize)
        
        label.frame = CGRect(x: (frame.size.width - label.frame.size.width - 5) / 2, y: (frame.size.height + iconSize - 30 )/2, width: label.frame.size.width, height: label.frame.size.height)
    }
}
