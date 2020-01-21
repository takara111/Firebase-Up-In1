//
//  UserModel.swift
//  Test-10-1-15
//
//  Created by 杉浦多可楽 on 2020/01/13.
//  Copyright © 2020 多可楽. All rights reserved.
//

import UIKit
import PGFramework
import FirebaseDatabase
import FirebaseAuth

class UserModel {
    var name: String?
    var email: String?
    var pass: String?
}

extension UserModel {
    static func setparamater(request: UserModel) -> [String:Any]{
        var param = [String:Any]()
        if let name = request.name{param["name"] = name}
        if let email = request.email{param["email"] = email}
        if let pass = request.pass{param["pass"] = pass}
        return param
    }
    
    static func create(request: UserModel, scuuess: @escaping() -> Void){
        guard let id = Auth.auth().currentUser?.uid else {return}
        let dbRef = Database.database().reference().child("users").child(id)
        let param = setparamater(request: request)
        dbRef.setValue(param)
    }
}

extension UserModel {
    static func signUp(email: String, pass: String, failure:@escaping (String) -> Void, success:@escaping () -> Void){
        Auth.auth().createUser(withEmail: email, password: pass) { user, error in
            if let error = error as NSError?, let code = AuthErrorCode(rawValue: error.code)  {
                var errorMessage = ""
                switch code {
                case .invalidEmail:
                    errorMessage = "有効でないメールアドレスです。"
                case .emailAlreadyInUse:
                    errorMessage = "すでに使用されているメールアドレスです。"
                case .operationNotAllowed:
                    errorMessage = "Operation not allowed"
                case .weakPassword:
                    errorMessage = "パスワードが簡単すぎます。"
                default:
                    errorMessage = ""
                }
                failure(errorMessage)
            }
            if let _ = user {
                success()
            }
        }
    }
    
    
    static func signIn(email: String, pass: String, failure:@escaping (String) -> Void, success:@escaping () -> Void){
        Auth.auth().signIn(withEmail: email, password: pass) { user, error in
            if let error = error as NSError?,
                let code = AuthErrorCode(rawValue: error.code) {
                var errorMessage = ""
                switch code {
                case .wrongPassword:
                    errorMessage = "パスワードが間違っています。"
                case .invalidEmail:
                    errorMessage = "有効でないメールアドレスです。"
                case .userNotFound:
                    errorMessage = "登録されていないメールアドレスです。"
                default:
                    errorMessage = ""
                }
                failure(errorMessage)
            }
            if let _ = user {
                success()
            }
        }
    }
    static func logOut(success: @escaping () -> Void) {
        do {
            try Auth.auth().signOut()
            success()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}
