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
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeButton.setImage(UIImage(systemName: "eye"), for: .selected)
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        keyTextArea.rightView = eyeButton
        keyTextArea.rightViewMode = .always
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 30))
        eyeButton.frame = CGRect(x: -10, y: 0, width: 45, height: 30)
        containerView.addSubview(eyeButton)
        keyTextArea.rightView = containerView
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

