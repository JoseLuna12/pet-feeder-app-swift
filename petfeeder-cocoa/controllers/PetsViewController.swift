//
//  PetsViewController.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 28/5/23.
//

import UIKit

class PetsViewController: UIViewController {
    
    var contentView: UIView!
    var scrollView: UIScrollView!
    var titlePage: TitleWithSubtitle!
    var stackUiViewNames: UIStackView!
    
    var petsData: [PetInfoModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        petsData = MockData.getPetsInfo()

        view.backgroundColor = .white
        setupScrollView()
        setupPetTitle()
        setupNavBar()
        
        let petInformation = setupPetInformation()
        setupPetStackView(with: petInformation)
        
        
        setupAnchors()
       
        
    }
    
    func setupPetStackView(with pets: [UIView]) {
        stackUiViewNames = UIStackView()
        stackUiViewNames.axis = .vertical
        stackUiViewNames.spacing = 15
        stackUiViewNames.translatesAutoresizingMaskIntoConstraints = false
        
        pets.forEach { p in
            stackUiViewNames.addArrangedSubview(p)
        }
       
        contentView.addSubview(stackUiViewNames)
    }
    
    func setupPetInformation() -> [UIView]{
        var petViews: [UIView] = []
        petsData.forEach { pet in
            let square = PetInformation(frame: CGRect(x: 10, y: 30, width: view.frame.size.width - 20, height: 150))
            square.setup(with: PetSettings(petName: pet.name, information: [
                PetInformationSettings(data: String(pet.dailyPortions), context: "porciones"),
                PetInformationSettings(data: parseWeightedPortion(portion: pet.weightPortions, weight: pet.weight), context: "porcion"),
            ]))
            square.heightAnchor.constraint(equalToConstant: 150).isActive = true
            petViews.append(square)
        }
        
        return petViews
    }
    
    func setupNavBar() {
        let bottomNavBar = BottomNavbar()
        bottomNavBar.setup(with: BottomNavbarSettings(parentView: view, currentViewName: .pet, iconSize: 30, actionButtonText: "New Pet", navigationController: navigationController!))
        
        bottomNavBar.actionButton.addTarget(self, action: #selector(createPet), for: .touchDown)
        view.addSubview(bottomNavBar)
    }
    
    func parseWeightedPortion(portion value: Double, weight w: Weights) -> String{
        
        let parsed = "\(String(value.formatted(FloatingPointFormatStyle()))) \(WeightValues.getAbrebiation(from: w))"
        return parsed
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
    
    func setupPetTitle(){
        titlePage = TitleWithSubtitle()
        contentView.addSubview(titlePage)
        titlePage.setup(with: TitlePageSettings(title: "Pets", subtitle: nil))
        
    }
    
    @objc func createPet(){
        return
    }
    
    func setupAnchors(){
        titlePage.anchor(top: contentView.topAnchor, right: contentView.rightAnchor, left: contentView.leftAnchor, bottom: stackUiViewNames.topAnchor)
        
        NSLayoutConstraint.activate([
            stackUiViewNames.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 80),
            stackUiViewNames.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 15),
            stackUiViewNames.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -15),
        ])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
