//
//  ViewController.swift
//  NutritionQuiz
//
//  Created by 墨田萌 on 2023/08/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = UIColor.white.cgColor
    }


}

