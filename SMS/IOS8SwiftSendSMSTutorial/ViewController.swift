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
    let messageVC = MFMessageComposeViewController()
    
    messageVC.body = "Enter a message";
    messageVC.recipients = ["Enter tel-nr"]
    messageVC.messageComposeDelegate = self;
    
    self.present(messageVC, animated: false, completion: nil)
  }
  
  func messageComposeViewController(_ controller: MFMessageComposeViewController!, didFinishWith result: MessageComposeResult) {
    
    /*
     
     
    switch (result) {
    case MessageComposeResult.cancelled.value:
      print("Message was cancelled")
      self.dismiss(animated: true, completion: nil)
    case MessageComposeResult.failed.value:
      print("Message failed")
      self.dismiss(animated: true, completion: nil)
    case MessageComposeResult.sent.value:
      print("Message was sent")
     self.dismiss(animated: true, completion: nil)
    default:
      break;
    }*/
    
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

