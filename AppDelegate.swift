//
//  AppDelegate.swift
//  Agent Based App with Storyboards
//
//  Created by Gary Adashek on 12/30/17.
//  Copyright © 2017 Gary M. Adashek. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var statusMenu: NSMenu!
    
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
    
   
    
    @IBOutlet weak var outlineView: NSOutlineView!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
//        statusItem.title = "sc00ter"
        statusItem.menu = statusMenu
//        item.image = NSImage(named: "scooter32")
        let icon = NSImage(named: NSImage.Name(rawValue: "scooter32"))
        icon?.isTemplate = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
        
        
    }
    
    
    @IBAction func gotoGoogle(_ sender: NSMenuItem) {
        // This code works to open the default browser and launch URL "string"
        
        let urlString = NSURL(string: "https:/google.com/")
        NSWorkspace.shared.open(urlString! as URL)
    }
    
    @IBAction func gotoGoogleNews(_ sender: NSMenuItem) {
        // This code works to open the default browser and launch URL "string"
        
        let urlString = NSURL(string: "https:/news.google.com/")
        NSWorkspace.shared.open(urlString! as URL)
    }
    
    @IBAction func gotoGoogleMaps(_ sender: NSMenuItem) {
        // This code works to open the default browser and launch URL "string"
        
        let urlString = NSURL(string: "https:/maps.google.com/")
        NSWorkspace.shared.open(urlString! as URL)
    }
    
    @IBAction func gotoGoogleFinance(_ sender: NSMenuItem) {
        // This code works to open the default browser and launch URL "string"
        
        let urlString = NSURL(string: "https://www.google.com/finance")
        NSWorkspace.shared.open(urlString! as URL)
    }
    
    @IBAction func clickF5(_ sender: NSMenuItem) {
        // This code works to open a specific application
        
        let App = NSString(string: "BIG-IP Edge Client")
        
        NSWorkspace.shared.launchApplication(App as String)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
}


