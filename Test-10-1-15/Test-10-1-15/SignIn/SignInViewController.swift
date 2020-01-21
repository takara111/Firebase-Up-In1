//
//  SignInViewController.swift
//  Test-10-1-15
//
//  Created by 杉浦多可楽 on 2020/01/13.
//  Copyright © 2020 多可楽. All rights reserved.
//

import UIKit
import PGFramework


// MARK: - Property
class SignInViewController: BaseViewController {
    @IBOutlet var mainView: SignInMainView!
    
}

// MARK: - Life cycle
extension SignInViewController {
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
extension SignInViewController: SignInMainViewDelegate{
    func signInButton(email: String, pass: String) {
        UserModel.signIn(email: email, pass: pass, failure: { (message) in
            print(message)
        }) {
            print("ログインに成功した!")
        }
    }
}

// MARK: - method
extension SignInViewController {
    
}
