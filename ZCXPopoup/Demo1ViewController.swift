//
//  Demo1ViewController.swift
//  ZCXPopoup
//
//  Created by J&Z on 2023/3/1.
//

import UIKit

class Demo1ViewController: UIViewController {

    @IBOutlet weak var contentView: UIView! {
        didSet { contentView.layer.cornerRadius = 12 }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true)
    }
}
