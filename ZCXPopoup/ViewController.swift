//
//  ViewController.swift
//  ZCXPopoup
//
//  Created by J&Z on 2023/3/1.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showPopoup(_ sender: Any) {
        let sb = UIStoryboard(name: "DemoViewController", bundle: nil)
        guard let controller = sb.instantiateInitialViewController() else { return }
        controller.transitioningType = .popup
        present(controller, animated: true)
    }

    @IBAction func showPopoupWithNavigation(_ sender: Any) {
        let sb = UIStoryboard(name: "DemoViewController", bundle: nil)
        guard let controller = sb.instantiateInitialViewController() else { return }
        let navController = UINavigationController(rootViewController: controller)
        navController.transitioningType = .popup
        present(navController, animated: true)
    }
}
