//
//  ViewController.swift
//  ObjectWithCode
//
//  Created by Berkay Çaylı on 18.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ekranın [superView] genişlik ve yükseklik değerlerine erişme
        let width = view.frame.width
        let height = view.frame.height
        
        let label = UILabel()
        label.text = "Hello Berkay!"
        label.textAlignment = .center
        label.frame = CGRect(x: 100, y: width * 0.5 - (label.frame.width * 0.5), width: 100, height: 100)
        
        view.addSubview(label)
        
        let myButton = UIButton()
        myButton.setTitle("Tap me", for: UIControl.State.normal)
        myButton.setTitleColor(.white, for: UIControl.State.normal)
        myButton.frame = CGRect(x: 40, y: 100, width: 100, height: 50)
        
        myButton.addTarget(self, action: #selector(ViewController.myButtonTapped), for: UIControl.Event.touchUpInside)
        
        view.addSubview(myButton)
    }

    @objc func myButtonTapped() {
        print("button tapped")
    }

}

