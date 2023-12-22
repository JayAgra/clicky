//
//  ViewController.swift
//  clicky
//
//  Created by Jayen Agrawal on 12/12/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var Switches: Array<UISwitch>?
    @IBOutlet var Switches_Hard: Array<UISwitch>?
    
    @IBAction func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func switchAction() {
        let random: Int = Int.random(in: 1...5)
        for _ in 1...(random) {
            Switches?.randomElement()?.setOn(Bool.random(), animated: true)
        }
    }
    
    @IBAction func hardSwitchAction() {
        let random: Int = Int.random(in: 1...10)
        for _ in 1...(random) {
            Switches_Hard?.randomElement()?.setOn(Bool.random(), animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
