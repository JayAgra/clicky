//
//  ViewController.swift
//  beartracks
//
//  Created by Jayen Agrawal on 12/12/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var smallclicky: UIButton!
    @IBOutlet var medClicky: UIButton!
    @IBOutlet var bigclicky: UIButton!
    @IBOutlet var notifError: UIButton!
    @IBOutlet var notifWarning: UIButton!
    @IBOutlet var notifSuccess: UIButton!
    @IBOutlet var boomButton: UIButton!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

