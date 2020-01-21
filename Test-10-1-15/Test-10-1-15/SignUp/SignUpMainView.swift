//
//  SignUpMainView.swift
//  Test-10-1-15
//
//  Created by 杉浦多可楽 on 2020/01/13.
//  Copyright © 2020 多可楽. All rights reserved.
//

import UIKit
import PGFramework

protocol SignUpMainViewDelegate: NSObjectProtocol{
    func signUpButton(name: String,email: String,pass: String)
}

extension SignUpMainViewDelegate {
    
}
// MARK: - Property
class SignUpMainView: BaseView {
    weak var delegate: SignUpMainViewDelegate? = nil
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    @IBAction func signUpButton(_ sender: UIButton) {
        delegate?.signUpButton(name: nameTextField.text ?? "", email: emailTextField.text ?? "", pass: passTextField.text ?? "")
    }
    
}

// MARK: - Life cycle
extension SignUpMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Protocol
extension SignUpMainView {
    
}

// MARK: - method
extension SignUpMainView {
    
}

