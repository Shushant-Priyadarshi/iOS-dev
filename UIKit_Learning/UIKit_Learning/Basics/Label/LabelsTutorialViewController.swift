//
//  LabelsTutorialViewController.swift
//  UIKit_Learning
//
//  Created by Shushant  on 24/08/25.
//

import UIKit

class LabelsTutorialViewController: UIViewController {
    
    private var textLabel = UILabel()
    
    private var subtitleLabel:UILabel = {
        let label = UILabel()
        label.text = "this is another text"
        label.textColor = .gray
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "Hello World!"
        textLabel.textColor = .black
        textLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.centerYAnchor.constraint(equalTo: textLabel.bottomAnchor,constant: 8).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}

#Preview{
    LabelsTutorialViewController()
}


