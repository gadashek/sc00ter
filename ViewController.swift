//
//  ViewController.swift
//  Agent Based App with Storyboards
//
//  Created by Gary Adashek on 12/30/17.
//  Copyright © 2017 Gary M. Adashek. All rights reserved.
//

import Cocoa



class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    
    @IBOutlet weak var sayThisTextField: NSTextField!
    @IBOutlet weak var sayProgress: NSProgressIndicator!
    @IBOutlet weak var voicePopup: NSPopUpButton!
    

    
    @IBAction func talk(sender: NSButton) {
        let path = "/usr/bin/say"
        let textToSay = sayThisTextField.stringValue
        
        var arguments = [textToSay]
        
        if let voice = voicePopup.titleOfSelectedItem {
            arguments += ["-v", voice]
        }
        
        sender.isEnabled = false
        sayProgress.startAnimation(self)
        
        let task = Process.launchedProcess(launchPath: path, arguments: arguments)
        task.waitUntilExit()
        
        sender.isEnabled = true
        sayProgress.stopAnimation(self)
    }
    
    
    @IBAction func alert(sender: NSAlert) {
        let alert = NSAlert()
        alert.messageText = "Alert message text.."
        alert.informativeText = "Detailed description of alert message text"
        alert.addButton(withTitle: "Default")
        alert.addButton(withTitle: "Alternative")
        alert.addButton(withTitle: "Other")
        _ = alert.runModal()
    }
    
}
    


