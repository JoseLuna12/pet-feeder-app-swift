//
//  PetInformation.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 28/5/23.
//

import UIKit

struct PetSettings {
    let petName: String
    let information: [PetInformationSettings]
}

class PetInformation: UIView {
    
    let petTitle: UILabel = {
        let t = UILabel()
        t.textColor = .white
        t.font = .systemFont(ofSize: 30, weight: .semibold)
        return t
    }()
    
    let horizontalStack: UIStackView = {
        let h = UIStackView()
        h.axis = .horizontal
        h.alignment = .leading
        h.distribution = .fillProportionally
        return h
    }()
    
    func setup(with settings: PetSettings){
        petTitle.text = settings.petName
        
        settings.information.forEach { p in
            let component = createPetInfoDataComponent(with: p)
            horizontalStack.addArrangedSubview(component)
        }
        
        
        
    }
    
    func createPetInfoDataComponent(with data: PetInformationSettings) -> PetInformationData {
        let component = PetInformationData()
        component.setup(with: data)
        return component
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(petTitle)
        addSubview(horizontalStack)
        
        backgroundColor = UIColor(named: "green-dark")
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        let padding:CGFloat  = 30
        petTitle.sizeToFit()
        
        petTitle.frame = CGRect(x: frame.size.width - petTitle.frame.size.width - padding, y: 10, width: petTitle.frame.size.width, height: petTitle.frame.size.height)
        
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            horizontalStack.leftAnchor.constraint(equalTo: leftAnchor, constant: padding),
            horizontalStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding),
            horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            horizontalStack.topAnchor.constraint(equalTo: topAnchor, constant: (frame.size.height / 2) + 10),
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
