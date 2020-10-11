//
//  HomeViewController.swift
//  ACChecker
//
//  Created by Abdelrahman Alsaidi on 11/10/2020.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "A/C Checker"
    }
    
    
    @IBAction func startBtnTapped(_ sender: Any) {
        
        
        let inputFormVC = InputFormVC()
        navigationController?.pushViewController(inputFormVC, animated: true)
        
    }
    
}
