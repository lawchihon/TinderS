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
            cardInitialCenter = sender.view?.center
        }
        // In the changed state
        else if sender.state == .changed {
            cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y + translation.y)

            cardImageView.transform = CGAffineTransform.identity

            cardImageView.transform = cardImageView.transform.rotated(by:translation.x / 100)
        }
        // In the end state
        else if sender.state == .ended {

        }

    }
}
