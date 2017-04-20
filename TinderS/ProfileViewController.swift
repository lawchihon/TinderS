//
//  ProfileViewController.swift
//  TinderS
//
//  Created by John Law on 20/4/2017.
//  Copyright © 2017 lawchihon. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    var cardImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //cardImageView = UIImageView(image: cardImage)
        cardImageView.image = cardImage
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

    @IBAction func didTapNavbar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
