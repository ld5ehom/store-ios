//
//  SplashViewController.swift
//  Store-ios
//
//  Created by TaeWook Park on 8/25/24.
//

//import Lottie
import UIKit

class SplashViewController: UIViewController {

    // App X Constraint
    @IBOutlet weak var appIconCenterXConstraint: NSLayoutConstraint!
    
    // App Y Constraint
    @IBOutlet weak var appIconCenterYConstraint: NSLayoutConstraint!
    
    // App Icon UI View
    @IBOutlet weak var appIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // After Load
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // X locate
//        appIconCenterXConstraint.constant = -(view.frame.width / 2) - (appIcon.frame.width / 2)
        
        // Y locate
//        appIconCenterYConstraint.constant = -(view.frame.height / 2) - (appIcon.frame.height / 2)
        
        // UI Animation move
//        UIView.animate(withDuration: 1) { [weak self] in
//            self?.view.layoutIfNeeded()
//        }
        
        // rotate
//        UIView.animate(withDuration: 1, animations: { [weak self] in
//            let rotationAngle: CGFloat = CGFloat.pi
//            self?.appIcon.transform = CGAffineTransform(rotationAngle: rotationAngle)
//        })
        
        // Zoom in animation
        UIView.animate(withDuration: 1.5, animations: { [weak self] in
            // Scale transformation (increase the size)
            self?.appIcon.transform = CGAffineTransform(scaleX: 10, y: 10)
            // Optional: Fade in effect
            self?.appIcon.alpha = 0.0
        }) // { _ in
//            // Optional: Reset after animation
//            UIView.animate(withDuration: 0.5) { [weak self] in
//                self?.appIcon.transform = CGAffineTransform.identity
//            }
//        }


    }
}
