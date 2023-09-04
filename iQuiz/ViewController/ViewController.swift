//
//  ViewController.swift
//  iQuiz
//
//  Created by Bruna Santos on 03/09/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ButtonStartQuiz: UIButton!
    
    @IBAction func PressedButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    func setupLayout() {
        ButtonStartQuiz.layer.cornerRadius = 12.0
        navigationItem.hidesBackButton = true
    }
}

