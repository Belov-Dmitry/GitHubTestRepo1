//
//  ViewController.swift
//  VKClient
//
//  Created by Dmitry Belov on 28.10.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBAction func loginButtonPressed(_ sender: Any) { } //добавили связь с кнопкой. переход дальше задан на storyboard

//теперь проверяем логин и пароль
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            // Проверяем данные
            let checkResult = checkUserData()
            // Если данные не верны, покажем ошибку
            if !checkResult {
                showLoginError()
            }
            // Вернем результат
            return checkResult
        }
        
        func checkUserData() -> Bool {
            guard let login = loginInput.text,
                let password = passwordInput.text else { return false }
        
            if login == "1" && password == "1" {
                print("успешная авторизация")
                return true
            } else {
                print("неуспешная авторизация")
                return false
            }
        }
//создаём окошко с ошибкой
        func showLoginError() {
            // Создаем контроллер
            let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
            // Создаем кнопку для UIAlertController
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            // Добавляем кнопку на UIAlertController
            alter.addAction(action)
            // Показываем UIAlertController
            present(alter, animated: true, completion: nil)
        }
//закончили проверять логин и пароль
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
}

