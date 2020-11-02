//
//  BaseViewController.swift
//  SwfitTest
//
//  Created by whs on 2020/11/1.
//  Copyright © 2020 whs. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var titleStr:String?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white;
        self.title = titleStr;
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
