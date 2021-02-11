//
//  ViewController.swift
//  9.Ders
//
//  Created by selin eylül bilen on 1/21/21.
//

import UIKit

class ViewController: UIViewController {

    let db = DB()
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMail: UITextField!

    @IBAction func btnAdd(_ sender: UIButton) {
        let name = txtName.text!
        let email = txtMail.text!
        let row = db.userInsert(name: name, email: email)
        print(row)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db.fncConnection()
    }

}

