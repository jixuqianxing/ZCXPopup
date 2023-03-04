//
//  DemoViewController.swift
//  ZCXPopoup
//
//  Created by J&Z on 2023/3/1.
//

import UIKit

class DemoViewController: UIViewController {

    @IBOutlet weak var contentView: UIView! {
        didSet { contentView.layer.cornerRadius = 12 }
    }

    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        button.setTitle(navigationController == nil ? "Submit" : "Next", for: .normal)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true)
    }

    @IBAction func dismiss(_ sender: Any) {
        guard navigationController != nil else {
            dismiss(animated: true)
            return
        }

        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = sb.instantiateInitialViewController() else { return }
        navigationController?.pushViewController(controller, animated: true)
    }
}
