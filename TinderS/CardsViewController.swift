//
//  CardsViewController.swift
//  TinderS
//
//  Created by John Law on 19/4/2017.
//  Copyright © 2017 lawchihon. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    @IBOutlet weak var cardImageView: UIImageView!
    var cardInitialCenter: CGPoint!
    var rotation: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

    @IBAction func didPanCard(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        // In the began state
        if sender.state == .began {
            cardInitialCenter = cardImageView.center

            if sender.location(in: view).y > cardInitialCenter.y {
                rotation = -0.01
            }
            else {
                rotation = 0.01
            }
            
        }
        // In the changed state
        else if sender.state == .changed {

            cardImageView.transform = CGAffineTransform.identity

            cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)

            cardImageView.transform = cardImageView.transform.rotated(by: rotation * translation.x)
        }
        // In the end state
        else if sender.state == .ended {

        }

    }
}
