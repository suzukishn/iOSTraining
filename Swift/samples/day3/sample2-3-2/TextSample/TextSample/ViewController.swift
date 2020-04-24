//
//  ViewController.swift
//  TextSample
//
//  Created by 鈴木大貴 on 2016/10/29.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var textFieldCountLabel: UILabel!
    @IBOutlet weak var textViewCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textField.delegate = self
        textView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.didChangeTextFieldText(_:)), name: UITextField.textDidChangeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.didChangeTextViewText(_:)), name: UITextView.textDidChangeNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func didChangeTextFieldText(_ notification: Notification) {
        textFieldCountLabel.text = "\(textField.text?.count ?? 0)"
    }
    
    @objc func didChangeTextViewText(_ notification: Notification) {
        textFieldCountLabel.text = "\(textView.text?.count ?? 0)"
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textFieldCountLabel.text = "0"
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        return true
    }
}

extension ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print(text)
        return true
    }
}
