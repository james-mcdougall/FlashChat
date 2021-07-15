//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
	@IBOutlet weak var errorMessageLabel: UILabel!
	
	let registerToChat = "RegisterToChat"
	
	var errorMessageDisplayed = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		errorMessageLabel.isHidden = true
	}
    
    @IBAction func registerPressed(_ sender: UIButton) {
		
		
		
		guard let email = emailTextfield.text,
			  let password = passwordTextfield.text,
			  !email.isEmpty,
			  !password.isEmpty else { return }
		
		Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
			if let error = error {
				self.errorMessageDisplayed.toggle()
				if self.errorMessageDisplayed == true {
					self.errorMessageLabel.isHidden = false
					print(error.localizedDescription)
					self.errorMessageLabel.text = "\(error.localizedDescription)"
					self.passwordTextfield.text = ""
				}
				
			} else {
				self.errorMessageDisplayed.toggle()
				if self.errorMessageDisplayed == false {
					self.errorMessageLabel.isHidden = true
					self.performSegue(withIdentifier: self.registerToChat, sender: self)
				}
			}
		}
    }
    
}
