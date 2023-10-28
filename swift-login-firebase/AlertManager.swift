//
//  AlertManager.swift
//  swift-login-firebase
//
//  Created by Dwiki Dwiki on 26/10/23.
//

import UIKit

class AlertManager {
    private static func showBasicAlert(on vc: UIViewController,  title: String,  message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            vc.present(alert, animated: true)
        }
    }
}

// MARK: - Show validation alerts
extension AlertManager {
    public static func showInvalidEmailAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid email", message: "Please enter valid email")
    }
    
    public static func showInvalidPassword(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid password", message: "Please enter valid password")
    }
    
    public static func showInvalidUsername(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid username", message: "Please enter valid username")
    }
}

//MARK: - Registration error
extension AlertManager {
    public static func showRegistrationAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknow registration error", message: nil)
    }
    
    public static func showRegistrationAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Unknow registration error", message: "\(error.localizedDescription)")
    }
}


//MARK: - Log In error
extension AlertManager {
    public static func showSignInAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknow Sign in error", message: nil)
    }
    
    public static func showSignInAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Unknow Sign in error", message: "\(error.localizedDescription)")
    }
}


//MARK: - Log Out error
extension AlertManager {
    
    public static func showLogoutError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Unknow Sign out error", message: "\(error.localizedDescription)")
    }
}

//MARK: - Forgot Password error
extension AlertManager {
    public static func showPasswordResetSent(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Password reset sent", message: nil)
    }
    
    public static func showErrorSendingPasswordReset(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Unknown Sign out error", message: "\(error.localizedDescription)")
    }
}

//MARK: - Fetching user error

extension AlertManager {
    
    public static func showUnknownFetchingUserError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Fetching user error", message: nil)
    }
    
    public static func showFetchingUserError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error fetching user", message: "\(error.localizedDescription)")
    }
}
