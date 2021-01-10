//
//  ViewController.swift
//  OnboardingFlow
//
//  Created by waheedCodes on 10/01/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if Core.shared.isNewUser() {
            // Show onboarding screens
            let viewController = storyboard?.instantiateViewController(identifier: "welcome") as! WelcomeViewController
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true, completion: nil)
        }
    }

}

class Core {
    static let shared = Core()
    
    /// Checks if user is a new user
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    /// Called after the welcome screen has been seen by a new user
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
