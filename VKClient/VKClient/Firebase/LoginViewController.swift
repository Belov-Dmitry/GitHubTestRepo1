//
//  LoginViewController.swift
//  VKClient
//
//  Created by Dmitry Belov on 18.01.2022.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var token: AuthStateDidChangeListenerHandle! // следит за состоянием пользователя
    
    private let authService = Auth.auth() // сервис авторизации от Firebase
    
    override func viewDidLoad() {
        super.viewDidLoad()
        token = authService.addStateDidChangeListener({ auth, user in
            
            guard user != nil else { return }
            self.showHomeViewController()
        })
    }
    
// авторизация
    @IBAction func signInAction(_ sender: Any?) {
        guard let email = emailTextField.text, emailTextField.hasText,
              let password = passwordTextField.text, passwordTextField.hasText
        else {
            showAlert(title: "Ошибка на клиенте", text: "Не ввели логин или пароль")
            return
        }
        
        authService.signIn(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
            self.showAlert(title: "Ошибка на сервере", text: error.localizedDescription)
            return
        }
            self.showHomeViewController()
        }
    
    }
    
// регистрация
    @IBAction func signUpAction(_ sender: Any) {
        
        guard let email = emailTextField.text, emailTextField.hasText,
              let password = passwordTextField.text, passwordTextField.hasText
        else {
            showAlert(title: "Ошибка на клиенте", text: "Не ввели логин или пароль")
            return
    }
        
// создаем пользователя
        authService.createUser(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                self.showAlert(title: "Ошибка на сервере", text: error.localizedDescription)
                return
            }
            self.signInAction(nil)
        }
    }
    
//подтягиваем через storyboard HomeViewController
    private func showHomeViewController() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") else { return }
        guard let window = self.view.window else { return }
        window.rootViewController = vc //подменяем один контроллер на другой
    }
    
//отображает ошибки через alert
    private func showAlert(title: String?, text: String?) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
}
