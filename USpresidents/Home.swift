//
//  Home.swift
//  USpresidents
//
//  Created by user166398 on 6/2/20.
//  Copyright © 2020 user166398. All rights reserved.
//

import UIKit

class ViewControllerHome: UIViewController {
    
    
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var moreIntro: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        button.layer.cornerRadius = 15
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize (width: 4, height: 4)
        
        introLabel.text = "Hi, this is a quiz app will let you discover many interesting facts about US presidents."
        
        moreIntro.text = "Additionally, with knowledge gained from this app, you can share them to your peers and they will be amazed by those interesting information."
    }
    
    
    @IBAction func quizButton(_ sender: Any) {
        let quiztab = storyboard?.instantiateViewController(identifier: "quiztab") as! ViewController
        
        present(quiztab, animated: true)
    }
    
}
