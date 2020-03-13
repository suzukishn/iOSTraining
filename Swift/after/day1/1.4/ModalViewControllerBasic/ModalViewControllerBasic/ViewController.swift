//
//  ViewController.swift
//  ModalViewControllerBasic
//
//  Created by 鈴木大貴 on 2016/10/16.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let sampleVC = SampleViewController(nibName: "SampleViewController", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(sampleVC.view)
        //参考実装
        /*
         * Auto Layoutで画面サイズごとに適切なViewのサイズにするためには
         * 以下のようにNSLayoutConstraintをViewに追加する必要がある。
         */
        sampleVC.view.translatesAutoresizingMaskIntoConstraints = false
        guard let sampleVcView = sampleVC.view else { return }
        let constraints: [NSLayoutConstraint] = [.top, .left, .right, .bottom].map {
            NSLayoutConstraint(item: sampleVcView, attribute: $0, relatedBy: .equal, toItem: view, attribute: $0, multiplier: 1, constant: 0)
        }
        view.addConstraints(constraints)
        addChild(sampleVC)
        sampleVC.didMove(toParent: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

