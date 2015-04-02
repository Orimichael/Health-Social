//
//  ThreadsViewController.swift
//  Health Social
//
//  Created by Ori's Air on 3/30/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//

import UIKit

var threads: [Thread] = []

class ThreadsViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet var threadTable: UITableView!
    
    @IBOutlet weak var newThreadField: UITextField!
    
    @IBOutlet weak var saveButtonLabel: UIBarButtonItem!
    
    @IBAction func addThread(sender: UIBarButtonItem) {
        newThreadField.hidden = false
        newThreadField.enabled = true
        saveButtonLabel.enabled = true
        
        
    }
    
    
    @IBAction func saveButton(sender: UIBarButtonItem) {
        var newThread = Thread()
        if !newThreadField.text.isEmpty {
            newThread.title = newThreadField.text
        } else {
            newThreadField.text = "Please enter a thread title"
            return
        }
        threads.append(newThread)
        
        newThreadField.text = ""
        newThreadField.hidden = true
        saveButtonLabel.enabled = false
        println(threads.count)
        println(threads.last!.title!)
        self.view.endEditing(true)
        threadTable.reloadData()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newThreadField.hidden = true
        newThreadField.enabled = false
        saveButtonLabel.enabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        
        return threads.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = threads[indexPath.row].title
        
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if var storedThreads: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("Threads"){
            
            threads = []
            for var i = 0; i < storedThreads.count; ++i {
                threads.append(storedThreads[i] as Thread)
            }
        }
        
        threadTable.reloadData()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        //Function to delete a Thread
        
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            threads.removeAtIndex(indexPath.row) //Remove from "mutable" threads array
            
     //       let fixedThreads = threads
     //       NSUserDefaults.standardUserDefaults().setObject(fixedThreads, forKey: "threads")
     //       NSUserDefaults.standardUserDefaults().synchronize() //Remove from "immutable" fixedToDoItems array
            
            threadTable.reloadData() //updates page
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        let cell = tableView.cellForRowAtIndexPath(indexPath)

        //Perform segue to Posts when a cell is selected
        performSegueWithIdentifier("goToPosts", sender: cell)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Load posts view controller for corresponding thread
        
        if segue.identifier == "goToPosts" {
            let cell = sender as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let selectedThread = threads[indexPath!.row]
            let postsViewController = segue.destinationViewController as PostsViewController
            postsViewController.thread = selectedThread
            
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
