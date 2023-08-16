//
//  ViewController.swift
//  petfeeder-cocoa
//
//  Created by Jose Luna on 17/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    var usernameInput: customTextField!
    var userPassword: customTextField!
    var loginButton: roundedButton!
    var loadingViewController: loadingView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let middle = (view.frame.height - (view.frame.height * 0.6)) / 2
        view.backgroundColor = .white
        setupInputUi(offsetY: middle)
        setupLoginButton(offsetY: middle)
        setupLoadingView()
        
    }
    
    func setupLoadingView() {
        loadingViewController = loadingView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        loadingViewController.setup(with: LoadingViewSettings(width: 40, height: 40, message: "Loading user..."))
    }
    
    func loadAnimation(){
        view.addSubview(loadingViewController)
        loadingViewController.startSpin()
    }
    
    func stopLoadAnimation(){
        loadingViewController.stopSpin()
    }
    
    func setupLoginButton(offsetY y: CGFloat){
        let buttonSettings = ButtonSettings(text: "Login", textSize: 18, color: UIColor(named: "green-dark"), textColor: .white)
        
        let button_width: CGFloat = 300
        loginButton = roundedButton(frame: CGRect(x: (view.frame.size.width - 300) / 2, y: y + 220, width: button_width, height:  50))
        
        loginButton.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
        
        view.addSubview(loginButton)
        loginButton.setup(with: buttonSettings)
        
        loginButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, left: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor)
        loginButton.centerAnchorX(to: view.centerXAnchor, offset: 0)
    }
    
    @objc func touchButton(sender: UIButton){
        loadAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            let destination = homeViewController()
            self.navigationController?.pushViewController(destination, animated: true)
        }
    }
    
    func setupInputUi(offsetY y: CGFloat){
        let input_paddingx: CGFloat = 50
        let input_width: CGFloat = view.frame.size.width - (input_paddingx * 2)
        let input_height: CGFloat = 40
        
        usernameInput = customTextField(frame: CGRect(x: input_paddingx, y: 100 + y, width: input_width, height: input_height))
    
        view.addSubview(usernameInput)
        usernameInput.setup(with: CustomInput(placeholder: "User", keyboard: .emailAddress, contentType: .username))
        
        usernameInput.centerAnchorX(to: view.centerXAnchor, offset: 10)
        usernameInput.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, offsetTop: 45 + y, offsetRight: -32, offsetLeft: 32)
        
        
            
        userPassword = customTextField(frame: CGRect(x: input_paddingx, y: 150 + y, width: input_width, height: input_height))
        
        view.addSubview(userPassword)
        userPassword.setup(with: CustomInput(placeholder: "Password", keyboard: .default, contentType: .password))
        
        
        userPassword.centerAnchorX(to: view.centerXAnchor, offset: 10)
        userPassword.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, offsetTop: 90 + y, offsetRight: -32, offsetLeft: 32)
    }


}

