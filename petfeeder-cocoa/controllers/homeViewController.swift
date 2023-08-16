//
//  homeViewController.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 17/5/23.
//

import UIKit

class homeViewController: UIViewController {
    
    var bigInfoSquare: bigInfoIndicator!
    var titlePage: TitleWithSubtitle!
    var hStackView: UIStackView!
    var subtitleSection: SubtitleComponent!
    var contentView: UIView!
    var scrollView: UIScrollView!
    var petButtons: [FoodButtonComponent] = []
    
    let pets = MockData.getPets()
    
    var petsToFeed: [Pet] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupScrollView()
        setupBigInfoSquare(y: 100)
        setupHomeTitle()
        setupSmallInfoSection()
        setupSubtitlePetSection()
        setupFeedButtons(withMany: pets)
        setupNavBar()
                
    }
    
    func setupNavBar() {
        let bottomNavBar = BottomNavbar()
        bottomNavBar.setup(with: BottomNavbarSettings(parentView: view, currentViewName: .home, iconSize: 30, actionButtonText: "Feed", navigationController: navigationController!))
        
        bottomNavBar.actionButton.addTarget(self, action: #selector(feedPets), for: .touchDown)
//        bottomNavBar.buttonPets.addTarget(self, action: #selector(navigateToPetScreen), for: .touchUpInside)
        view.addSubview(bottomNavBar)
    }
    
//    @objc func navigateToPetScreen(){
//        let destination = PetsViewController()
//        self.navigationController?.pushViewController(destination, animated: true)
//    }
    
    @objc func feedPets(){
        petButtons.forEach { button in
            if(button.getButtonState()){
                button.toggleSelection()
            }
        }
        petsToFeed = []
    }
    
    func setupScrollView(){
        
        let bottomPadding = view.frame.height * KMessureConstants.bottomPaddingPersentage
        contentView = UIView()
        contentView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        contentView.backgroundColor = .white
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.backgroundColor = .white

        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomPadding).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -bottomPadding).isActive = true
    }
    
    func setupFeedButtons(withMany buttons: [Pet]){
        let feedButtonColumns: Int = 3
        
        let stackview = UIStackView()
                stackview.axis = .vertical
                // this will keep the 1- & 2-button rows left-aligned
                stackview.alignment = .leading
                stackview.distribution = .fill
                stackview.spacing = 10
                
                var i: Int = 0
                
        while i < buttons.count {
                    let hstack = UIStackView()
                    hstack.axis = .horizontal
                    hstack.spacing = 16
                    for _ in 0..<feedButtonColumns {
                        if i < buttons.count {
                            let button = FoodButtonComponent()
                            button.setup(with: buttons[i])
                            button.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
                            button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
                            
                            button.addTarget(self, action: #selector(petButton), for: .touchDown)
                            petButtons.append(button)
                            hstack.addArrangedSubview(button)
                        }
                        i += 1
                    }
                    stackview.addArrangedSubview(hstack)
                }
                
                stackview.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(stackview)
                
                let g = view.safeAreaLayoutGuide
                NSLayoutConstraint.activate([
                    stackview.topAnchor.constraint(equalTo: subtitleSection.bottomAnchor, constant: 10),
                    stackview.centerXAnchor.constraint(equalTo: g.centerXAnchor),
                    // set stackview width to (3 x 100) + (2 x 16)
                    //  so if we have only 1 or 2 buttons, they will be "left-aligned"
                    stackview.widthAnchor.constraint(equalToConstant: 332.0),
                ])
        
    }
    
    @objc func petButton(sender: FoodButtonComponent){
        if(sender.getButtonState()){
            addPet(add: sender.getPet())
        }else {
            removePet(remove: sender.getPet())
        }
    }
    
    
    func addPet(add pet: Pet){
        petsToFeed.append(pet)
    }
    
    func removePet(remove pet: Pet){
        let petIndex = petsToFeed.firstIndex { p in
            return p.name == pet.name
        }
        
        if let index = petIndex {
            petsToFeed.remove(at: index)
        }
        
    }
    
    func setupSmallInfoSection(){
        let rightSmallInfo = generateSmallInfoBlock(title: "Restantes", info: "35", sufix: "Porciones")
        let leftSmallInfo = generateSmallInfoBlock(title: "Comida hasta", info: "12", sufix: "octubre")
        
        setupHStackView(y: 15, children: [rightSmallInfo, leftSmallInfo])
    }
    
    func setupSubtitlePetSection(){
        subtitleSection = SubtitleComponent()
        contentView.addSubview(subtitleSection)
        subtitleSection.setup(with: "Mascotas")
        subtitleSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        subtitleSection.topAnchor.constraint(equalTo: hStackView.bottomAnchor, constant: 25).isActive = true
        subtitleSection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        subtitleSection.widthAnchor.constraint(equalToConstant: view.frame.size.width - 40).isActive = true
//        subtitleSection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        subtitleSection.heightAnchor.constraint(equalToConstant: subtitleSection.frame.size.height).isActive = true
    }
    
    func generateSmallInfoBlock(title: String, info: String, sufix: String) -> SmallInfoIndicator{
        let small = SmallInfoIndicator(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        small.setup(with: SmallInfoSettings(title: title, info: info, sufix: sufix))
        return small
    }
    
    func setupHStackView(y offset: CGFloat, children views: [UIView]){
        hStackView = UIStackView()
        contentView.addSubview(hStackView)
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 10
        
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        hStackView.topAnchor.constraint(equalTo: bigInfoSquare.bottomAnchor, constant: offset).isActive = true
        hStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        hStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        hStackView.heightAnchor.constraint(equalToConstant: (view.frame.size.height - (view.frame.size.height / 4) ) / 5).isActive = true
        
        views.forEach { child in
            hStackView.addArrangedSubview(child)
        }
    }
    
    func setupBigInfoSquare(y offsetY: CGFloat){
        bigInfoSquare = bigInfoIndicator(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        contentView.addSubview(bigInfoSquare)
        
        bigInfoSquare.setup(from: InformationIndicatorSettings(title: "Comida Restante", info: "32", prefix: "/100kg", progress: 0.4))
        
        let offsetBottom = -view.frame.size.height + (view.frame.size.height / 5) + offsetY
        
        bigInfoSquare.anchor(top: contentView.topAnchor, right: contentView.rightAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, offsetTop: offsetY, offsetRight: -16, offsetLeft: 16, offsetBot: offsetBottom)
    }
    
    func setupHomeTitle(){
        titlePage = TitleWithSubtitle(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        contentView.addSubview(titlePage)
        titlePage.setup(with: TitlePageSettings(title: "Jose", subtitle: "Welcome"))
        titlePage.anchor(top: contentView.topAnchor, right: contentView.rightAnchor, left: contentView.leftAnchor, bottom: bigInfoSquare.topAnchor)
    }
    

}
