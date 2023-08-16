//
//  BottomNavbar.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 23/5/23.
//

import UIKit

struct BottomNavbarSettings {
    let parentView: UIView
    let currentViewName: pageNames
    let iconSize: Int?
    let actionButtonText: String
    let navigationController: UINavigationController
}

enum pageNames {
    case home
    case food
    case pet
}

class BottomNavbar: UIView {
    
    var iconSize = 35
    let bottomPaddingPersentage = 0.1
    var navigationController: UINavigationController!

    let parentStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 16
        return stack
    }()
    
    let childStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalCentering
        return stack
    }()
    
    let buttonHome: NavBarButton = {
        let button = NavBarButton()
        button.setup(with: "ico-home-inactive")
        return button
    }()
    
    let buttonFood: NavBarButton = {
        let button = NavBarButton()
        button.setup(with: "ico-food-inactive")
        return button
    }()
    
    let buttonPets: NavBarButton = {
        let button = NavBarButton()
        button.setup(with: "ico-pet-inactive")
        return button
    }()
    
    let actionButton: BigActionButton = {
        let button = BigActionButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.setup(with: BigActionButtonSettings(label: "Feed", icon: "paw"))
        return button
    }()
    
    func setup(with settings: BottomNavbarSettings){
        navigationController = settings.navigationController
        let bottomPadding = settings.parentView.frame.size.height * bottomPaddingPersentage
        frame = CGRect(x: 0, y: settings.parentView.frame.size.height - bottomPadding, width: settings.parentView.frame.size.width, height: bottomPadding)
        backgroundColor = .white
        
        actionButton.label.text = settings.actionButtonText
        setupNavBarItemColor(name: settings.currentViewName)

        childStack.addArrangedSubview(buttonHome)
        childStack.addArrangedSubview(buttonPets)
        childStack.addArrangedSubview(buttonFood)
        parentStack.addArrangedSubview(childStack)
        parentStack.addArrangedSubview(actionButton)

        setupConstrainsForButtons()

        NSLayoutConstraint.activate([
            actionButton.widthAnchor.constraint(equalToConstant: (frame.size.width / 2)  - 10),
            actionButton.heightAnchor.constraint(equalToConstant: CGFloat(iconSize + 10)),
        ])

        addSubview(parentStack)

        NSLayoutConstraint.activate([
            parentStack.topAnchor.constraint(equalTo: topAnchor),
            parentStack.widthAnchor.constraint(equalToConstant: frame.size.width - 64),
            parentStack.heightAnchor.constraint(equalToConstant: bottomPadding / 2),
            parentStack.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            parentStack.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
        
        buttonHome.addTarget(self, action: #selector(navigateToHome), for: .touchUpInside)
        buttonPets.addTarget(self, action: #selector(navigateToPet), for: .touchUpInside)
    }
    
    func setupNavBarItemColor(name page: pageNames){
        switch page {
        case pageNames.home:
            buttonHome.icon.image = UIImage(named: "ico-home-active")
        case pageNames.food:
            buttonFood.icon.image = UIImage(named: "ico-food-active")
        case pageNames.pet:
            buttonPets.icon.image = UIImage(named: "ico-pet-active")
        }
    }
    
    func setupConstrainsForButtons(){
        NSLayoutConstraint.activate([
            buttonHome.widthAnchor.constraint(equalToConstant: CGFloat(iconSize)),
            buttonHome.heightAnchor.constraint(equalToConstant: CGFloat(iconSize)),
            buttonFood.widthAnchor.constraint(equalToConstant: CGFloat(iconSize)),
            buttonFood.heightAnchor.constraint(equalToConstant: CGFloat(iconSize)),
            buttonPets.widthAnchor.constraint(equalToConstant: CGFloat(iconSize)),
            buttonPets.heightAnchor.constraint(equalToConstant: CGFloat(iconSize)),
            actionButton.heightAnchor.constraint(equalToConstant: CGFloat(iconSize + 10)),
        ])
    }
    
    @objc func navigateToHome(){
        let d = homeViewController()
//        navigationController.present(d, animated: true)// is presented as card
        navigationController.pushViewController(d, animated: false)
    }
    
    @objc func navigateToPet(){
        let d = PetsViewController()
        navigationController.pushViewController(d, animated: false)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
