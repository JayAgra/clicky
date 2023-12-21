//
//  ViewController.swift
//  clicky
//
//  Created by Jayen Agrawal on 12/12/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var Switch1: UISwitch!
    @IBOutlet var Switch2: UISwitch!
    @IBOutlet var Switch3: UISwitch!
    @IBOutlet var Switch4: UISwitch!
    @IBOutlet var Switches: Array<UISwitch>?
    @IBOutlet var ProgressBar: UIProgressView!
    
    @IBAction func littleClickButtonPress(_button: UIButton) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred();
    }
    
    @IBAction func medClickButtonPress(_button: UIButton) {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred();
    }
    
    @IBAction func bigClickButtonPress(_button: UIButton) {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred();
    }
    
    @IBAction func notifError(_button: UIButton) {
        UINotificationFeedbackGenerator().notificationOccurred(.error);
    }
    
    @IBAction func notifWarning(_button: UIButton) {
        UINotificationFeedbackGenerator().notificationOccurred(.warning);
    }
    
    @IBAction func notifSuccess(_button: UIButton) {
        UINotificationFeedbackGenerator().notificationOccurred(.success);
    }
    
    @IBAction func boomButton(_button: UIButton) {
        UINotificationFeedbackGenerator().notificationOccurred(.error);
        UINotificationFeedbackGenerator().notificationOccurred(.warning);
        UINotificationFeedbackGenerator().notificationOccurred(.success);
    }
    
    @IBAction func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func switchAction() {
        let random: Int = Int.random(in: 1...5)
        for _ in 1...(random) {
            Switches?.randomElement()?.setOn(Bool.random(), animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
