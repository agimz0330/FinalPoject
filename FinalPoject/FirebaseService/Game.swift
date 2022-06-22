//
//  Game.swift
//  FinalPoject
//
//  Created by User23 on 2022/6/21.
//

import Foundation
import SwiftUI
import FirebaseAuth

class Game: ObservableObject{
    @AppStorage("userMail") var userMail: Data?
    @AppStorage("userPassword") var userPassword: Data?
    
    @Published var isLogin: Bool = false
    @Published var showAlert: Bool = false
    @Published var alertTitle: String = ""
    
    func getLoginState(){
        // 從UserDefaults讀出
        if let userMail = userMail,
           let userPassword = userPassword{
            let decoder = JSONDecoder()
            if let decodeMail = try? decoder.decode(String.self, from: userMail),
               let decodePassWord = try? decoder.decode(String.self, from: userPassword){
                logIn(mail: decodeMail, password: decodePassWord)
            }
        }
    }
    
    func saveLoginState(mail: String, password: String){
        let encoder = JSONEncoder()
        if let encodeMail = try? encoder.encode(mail),
           let encodePassword = try? encoder.encode(password){
            userMail = encodeMail
            userPassword = encodePassword
        }
    }
    
    func signUp(name: String, mail: String, password: String){
        authCreateUser(mail: mail, password: password){ result in
            switch result{
            case .failure(let err):
                switch err.code{
                case AuthErrorCode.emailAlreadyInUse.rawValue:
                    self.alertTitle = "此信箱已經註冊過了"
                case AuthErrorCode.networkError.rawValue:
                    self.alertTitle = "網路連線錯誤"
                default:
                    self.alertTitle = "Unknown error: \(err.localizedDescription)"
                }
                self.showAlert = true
                return
                
            case .success(let id):
                print(id)
                
                // user. adduser(id, name, email, password)
                // user.listen to user data  change(id)
            }
        }
        
    }
    
    func logIn(mail: String, password: String){
        authLogIn(mail: mail, password: password){ result in
            switch result{
            case .failure(let err):
                switch err.code{
                case AuthErrorCode.wrongPassword.rawValue:
                    self.alertTitle = "密碼錯誤"
                case AuthErrorCode.invalidEmail.rawValue:
                    self.alertTitle = "無此信箱"
                case AuthErrorCode.networkError.rawValue:
                    self.alertTitle = "網路連線錯誤"
                default:
                    self.alertTitle = "Unknown error: \(err.localizedDescription)"
                }
                self.showAlert = true
                return
                
            case .success(let id):
                print(id)
                if authIsLogInFunc(){
                    self.isLogin = true
                }
                // user.listen to user data  change(id)
            }
            
        }
    }

}
