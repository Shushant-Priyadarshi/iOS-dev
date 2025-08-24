//
//  ViewController.swift
//  UIKit_Learning
//
//  Created by Shushant  on 24/08/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingText: UILabel!
    
    @IBOutlet weak var greetBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func greet(_ name:String){
        greetingText.text = "Hello \(name)"
        greetingText.textColor = .white
    }
    
    @IBAction func greetBtnTapped(_ sender: Any) {
        view.backgroundColor = .systemPurple
        greet("Shushant")
    }
    

}

