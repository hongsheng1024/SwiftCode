//
//  ViewController.swift
//  SwfitTest
//
//  Created by whs on 2020/11/1.
//  Copyright © 2020 whs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var ctrlNames:[String]? = [String]();
    var tableView:UITableView?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ctrlNames?.append("基本数据类型-BasicDataTypeController");
        
        tableView = UITableView(frame: self.view.frame, style: .plain);
        tableView?.dataSource = self;
        tableView?.delegate = self;
        self.view.addSubview(tableView!);
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ctrlNames!.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier:String = "SwiftCell";
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier);
        if cell==nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier);
        }
        cell?.selectionStyle = .none;
        cell?.textLabel?.text = ctrlNames?[indexPath.row];
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nameStr = ctrlNames?[indexPath.row];
        let arr = (nameStr?.components(separatedBy: "-"))! as NSArray;
        let workName = Bundle.main.infoDictionary?["CFBundleExecutable"] as! String
        let className: String = arr.lastObject as! String;
        //Swift中直接使用NSClassFromString获取的Class是nil，需要在前拼接项目文件名
        let vcClass = NSClassFromString("\(workName).\(className)") as! BaseViewController.Type;
        let vc = vcClass.init();
        vc.titleStr = arr.firstObject as? String;
        self.navigationController?.pushViewController(vc, animated: true);
    }
    

}

