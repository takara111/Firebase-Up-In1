//
//  SignInMainView.swift
//  Test-10-1-15
//
//  Created by 杉浦多可楽 on 2020/01/13.
//  Copyright © 2020 多可楽. All rights reserved.
//

import UIKit
import PGFramework

protocol SignInMainViewDelegate: NSObjectProtocol{
    func signInButton(email: String,pass: String)
}

extension SignInMainViewDelegate {
    
}
// MARK: - Property
class SignInMainView: BaseView {
    weak var delegate: SignInMainViewDelegate? = nil
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    @IBAction func signInButton(_ sender: UIButton) {
        delegate?.signInButton(email: emailTextField.text ?? "", pass: passTextField.text ?? "")
    }
}

// MARK: - Life cycle
extension SignInMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Protocol
extension SignInMainView {
    
}

// MARK: - method
extension SignInMainView {
    
}

