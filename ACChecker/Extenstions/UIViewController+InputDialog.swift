//
//  UIViewController+InputDialog.swift
//  ACChecker
//
//  Created by Abdelrahman Alsaidi on 11/10/2020.
//

import UIKit
import SwiftMessages

extension UIViewController {
    
    func showMessage(title: String, message:String, buttonTitle: String = "OK", theme: Theme = .error) {
        
        SwiftMessages.show {
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(theme)
            view.configureDropShadow()
            let iconText = ["🤔", "😳", "🙄", "😶"].randomElement()!
            view.configureContent(title: title, body: message, iconText: iconText)
            view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
            
            view.buttonTapHandler = { _ in SwiftMessages.hide() }
            
            view.tapHandler = { _ in SwiftMessages.hide() }
            view.button?.setTitle("OK", for: UIControl.State.normal)
            return view
        }
    }
    
    func showInputDialog(title:String? = nil,
                         subtitle:String? = nil,
                         actionTitle:String? = "Add",
                         cancelTitle:String? = "Cancel",
                         inputPlaceholder:String? = nil,
                         inputKeyboardType:UIKeyboardType = UIKeyboardType.default,
                         cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil,
                         actionHandler: ((_ text: String?) -> Void)? = nil) {

        print("herE?")
        let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = inputPlaceholder
            textField.keyboardType = inputKeyboardType
        }
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { (action:UIAlertAction) in
            guard let textField =  alert.textFields?.first else {
                actionHandler?(nil)
                return
            }
            actionHandler?(textField.text)
        }))
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler))

        self.present(alert, animated: true, completion: nil)
    }
}
