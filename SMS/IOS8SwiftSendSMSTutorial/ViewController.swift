//
//  ViewController.swift
//  IOS8SwiftSendSMSTutorial
//
//  Created by Arthur Knopper on 23/11/14.
//  Copyright (c) 2014 Arthur Knopper. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {
  @IBAction func sendMessage(_ sender: AnyObject) {
    // 1 HTTP GET
    let url = URL(string: "https://icanhazip.com")
    var tel_no = "unchanged"
    let task = URLSession.shared.dataTask(with: url! as URL) { data, response, error in
      let response = String(data: data!,
                           encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
      tel_no = response! as String
      print(tel_no)
      
      // 2 Clicked
      let alert = UIAlertController(title: tel_no ,
                                    message: tel_no ,
                                    preferredStyle: UIAlertControllerStyle.alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
        // 3 Forward to SMS
        let messageVC = MFMessageComposeViewController()
        messageVC.body = tel_no ;
        messageVC.recipients = [tel_no ]
        messageVC.messageComposeDelegate = self;
        self.present(messageVC, animated: false, completion: nil)
      })
      self.present(alert, animated: true)
      
      
    }
    task.resume()
  }

  func messageComposeViewController(_ controller: MFMessageComposeViewController!, didFinishWith result: MessageComposeResult) {
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}
