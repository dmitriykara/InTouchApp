//
//  ViewController.swift
//  InTouchApp
//
//  Created by Dmitriy Kara on 26.10.2020.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate {
    
    @IBAction func sendEmail(_ sender: AnyObject) {
        if MFMailComposeViewController.canSendMail() {
            let mailVC = MFMailComposeViewController()
            mailVC.setSubject("Message from InTouch App");
            mailVC.setToRecipients(["karadmitrii@gmail.com"])
            mailVC.setMessageBody("<p>Hello!</p>", isHTML: true)
            mailVC.mailComposeDelegate = self;
            self.present(mailVC, animated: true, completion: nil)
        } else {
            print("This device is currently unable to send email")
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            switch result {
                case MessageComposeResult.sent:
                    print("Result: Text Message Sent!")
                case MessageComposeResult.cancelled:
                    print("Result: Text Message Cancelled.")
                case MessageComposeResult.failed:
                    print("Result: Error, Unable to Send Text Message.")
            }
        self.dismiss(animated:true, completion: nil)
    }

    
    @IBAction func sendText(_ sender: AnyObject) {
        if MFMessageComposeViewController.canSendText() {
            let smsVC : MFMessageComposeViewController = MFMessageComposeViewController()
            smsVC.messageComposeDelegate = self
            smsVC.recipients = ["88005553535"]
            smsVC.body = "Please call me back."
            self.present(smsVC, animated: true, completion: nil)
        } else {
            print("This device is currently unable to send text messages")
        }
    }
    
    @IBAction func openWebsite(_ sender: AnyObject) {
        UIApplication.shared.open(URL(string: "http://hse.ru")!, options: [:], completionHandler: nil)
    }
    
    func mailComposeController(_ didFinishWithcontroller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
            case MFMailComposeResult.sent:
                print("Result: Email Sent!")
            case MFMailComposeResult.cancelled:
                print("Result: Email Cancelled.")
            case MFMailComposeResult.failed:
                    print("Result: Error, Unable to Send Email.")
            case MFMailComposeResult.saved:
                print("Result: Mail Saved as Draft.")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

