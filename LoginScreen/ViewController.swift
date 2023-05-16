//
//  ViewController.swift
//  LoginScreen
//
//  Created by Дмитрий on 16.05.2023.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    let user = "User"
    let password = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? WelcomeViewController else { return }
        settingVC.destanationText = loginTF.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func usedLogInButton() {
        guard loginTF.text == user, passwordTF.text == password else {
            showAlert(addMessage: "Error")
            passwordTF.text = ""
            return
        }
        performSegue(withIdentifier: "welcome", sender: nil)
    }
    
    @IBAction func showUserName() {
        showAlert(addMessage: "Your User Name is 'User'")
    }
    
    @IBAction func showPassword() {
        showAlert(addMessage: "Your Password is '1234'")
    }

    
}
extension ViewController {
    private func showAlert(addMessage message: String) {
        let alert = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

