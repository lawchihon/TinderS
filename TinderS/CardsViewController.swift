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
    let screenSize: CGRect = UIScreen.main.bounds

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
            if translation.x > 50 {
                UIView.animate(withDuration: 0.3, animations: {
                    self.cardImageView.transform = CGAffineTransform.identity
                    self.cardImageView.center = CGPoint(x: self.cardInitialCenter.x + self.screenSize.width, y: self.cardInitialCenter.y)
                })
            }
            else if translation.x < -50 {
                UIView.animate(withDuration: 0.3, animations: {
                    self.cardImageView.transform = CGAffineTransform.identity
                    self.cardImageView.center = CGPoint(x: -self.cardInitialCenter.x, y: self.cardInitialCenter.y)
                })
            }
            else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.cardImageView.transform = CGAffineTransform.identity
                    self.cardImageView.center = self.cardInitialCenter
                })
            }
        }

    }

    @IBAction func didTagCard(_ sender: Any) {
        self.performSegue(withIdentifier: "profileViewSegue", sender: "")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileViewSegue" {
            let destination = segue.destination as! ProfileViewController
            destination.cardImage = self.cardImageView.image
            //destination.cardImageView = UIImageView(image: self.cardImageView.image)
        }
    }
}
