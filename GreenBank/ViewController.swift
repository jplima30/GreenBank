//
//  ViewController.swift
//  GreenBank
//
//  Created by jplima on 26/08/25.
//

import UIKit

class ViewController: UIViewController {
    
    var eyeButton:UIButton!
    
    @IBOutlet weak var loginTextArea: UITextField!
    @IBOutlet weak var keyTextArea: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextArea.layer.cornerRadius = 20
        loginTextArea.layer.masksToBounds = true
        loginTextArea.attributedPlaceholder = NSAttributedString(string: "E-mail",attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        keyTextArea.layer.cornerRadius = 20
        keyTextArea.layer.masksToBounds = true
        keyTextArea.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        eyeButton = UIButton(type: .custom)
        eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        eyeButton.setImage(UIImage(systemName: "eye.fill"), for: .selected)
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        keyTextArea.rightView = eyeButton
        keyTextArea.rightViewMode = .always
        
    
    }
    
    @objc func togglePasswordVisibility () {
        
        keyTextArea.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
        
    }

    @IBAction func registerButton(_ sender: UIButton) {
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
    }
    
}

