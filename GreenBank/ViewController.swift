//
//  ViewController.swift
//  GreenBank
//
//  Created by jplima on 26/08/25.
//

import UIKit

class ViewController: UIViewController {
    
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
    }

    @IBAction func registerButton(_ sender: UIButton) {
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
    }
    
}

