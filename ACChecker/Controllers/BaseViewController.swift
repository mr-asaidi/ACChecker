//
//  BaseViewController.swift
//  ACChecker
//
//  Created by Abdelrahman Alsaidi on 11/10/2020.
//

import UIKit
import SwiftMessages
import CoreBluetooth

class BaseViewController: UIViewController {
    
    var myBTManager: CBCentralManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myBTManager = CBCentralManager()
        myBTManager.delegate = self
        
    }
    
}

extension BaseViewController: CBCentralManagerDelegate{
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
            case .poweredOn:
                break
            case .poweredOff:
                print("Bluetooth is Off.")
                self.showMessage(title: "Oops,", message: "Bluetooth is turned off!")
                break
            case .resetting:
                break
            case .unauthorized:
                break
            case .unsupported:
                break
            case .unknown:
                break
            default:
                break
            }
    }
    
    
}
