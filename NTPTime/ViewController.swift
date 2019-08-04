//
//  ViewController.swift
//  NTPTime
//
//  Created by Wilfred Furthado M on 28/02/19.
//  Copyright © 2019 Pervacio. All rights reserved.
//

import UIKit
import NHNetworkTime
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NHNetworkClock.shared().synchronize()
        NotificationCenter.default.addObserver(self, selector: #selector(syncCompleteNotification), name: NSNotification.Name(rawValue: kNHNetworkTimeSyncCompleteNotification), object: nil)
        
    }


    @objc func syncCompleteNotification() {
        let dateee = Date()
        let timesta = dateee.timeIntervalSince1970
        print("NORMAL TIME: \(dateee) , \(timesta)")

        let date: Date = NSDate.network()
        let timestaaa = date.timeIntervalSince1970

        print("NTP TIME: \(date) , \(timestaaa)")

    }
}

