//
//  ViewController.swift
//  AR Sample
//
//  Created by Thiago Gouvea on 21/05/2020.
//  Copyright © 2020 ThiagoGouvea. All rights reserved.
//

import UIKit
import QuickLook
import ARKit

class ViewController: UIViewController, QLPreviewControllerDataSource  {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int { return 1 }

    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        guard let path = Bundle.main.path(forResource: "toy_robot_vintage", ofType: "usdz") else { fatalError("Couldn't find the supported input file.") }
        let url = URL(fileURLWithPath: path)
        return url as QLPreviewItem
    }

    //MARK: - CTAs
    
    @IBAction func pressedArQuickLook(_ sender: Any) {
        let previewController = QLPreviewController()
        previewController.dataSource = self
        present(previewController, animated: true, completion: nil)
    }
    
    @IBAction func pressedArKit(_ sender: Any) {
    }
}
