//
//  SignUpViewController.swift
//  Test-10-1-15
//
//  Created by 杉浦多可楽 on 2020/01/13.
//  Copyright © 2020 多可楽. All rights reserved.
//

import UIKit
import PGFramework


// MARK: - Property
class SignUpViewController: BaseViewController {
    @IBOutlet var mainView: SignUpMainView!
    
}

// MARK: - Life cycle
extension SignUpViewController {
    override func loadView() {
        super.loadView()
        mainView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

// MARK: - Protocol
extension SignUpViewController: SignUpMainViewDelegate{
    func signUpButton(name: String, email: String, pass: String) {
        UserModel.signUp(email: email, pass: pass, failure: { (message) in
            print(message)
        }) {
            print("SignUpに成功しました！")
        }
    }
}

// MARK: - method
extension SignUpViewController {
    
}
