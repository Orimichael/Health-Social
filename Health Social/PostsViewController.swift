//
//  PostsViewController.swift
//  Health Social
//
//  Created by Ori's Air on 3/30/15.
//  Copyright (c) 2015 OriGen Health. All rights reserved.
//

import UIKit

class PostsViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var user = Person.currentUser()
    
    var thread: Thread? = nil
    
    var posts: [Post] = []
    
    @IBOutlet var postTable: UITableView!
    
    @IBOutlet weak var newPostField: UITextField!
    
    @IBOutlet weak var saveButtonLabel: UIBarButtonItem!
    
    @IBAction func addPost(sender: UIBarButtonItem) {
        newPostField.hidden = false
        newPostField.enabled = true
        saveButtonLabel.enabled = true
        
    }
    
    
    @IBAction func saveButton(sender: UIBarButtonItem) {
        var newPost = Post()
        var newPost1 = PFObject(className: "Post")
        
        if !newPostField.text.isEmpty {
            newPost.message = newPostField.text
        } else {
            newPostField.text = "Please enter your post"
            return
        }
        
        newPost1["content"] = newPost.message
        newPost1["message"] = newPost.message
        newPost.parentThread = thread!
        newPost1["parent"] = thread!
        newPost.author = Person.currentUser()
        newPost1["user"] = Person.currentUser()
        posts.append(newPost)
        Person.currentUser().myPosts.append(newPost)

        
        
        self.thread!.posts.append(newPost)
        
        newPostField.text = ""
        newPostField.hidden = true
        saveButtonLabel.enabled = false
        println(posts.count)
        println(posts.last!.message!)
        
        
        
        self.view.endEditing(true)
        postTable.reloadData()
        
        newPost1.save()
        user.save()
        
        var relation = user.relationForKey("myPosts")
        relation.addObject(newPost1)
        user["myPosts"].addObject(posts)

        user.saveInBackgroundWithBlock { (Bool: Bool , error: NSError!) -> Void in
            println("error saving")
        }
        
//        dispatch_async(dispatch_get_main_queue(), {
//            newPost1.save()
//            self.user.save()
//            
//            var relation = self.user.relationForKey("myPosts")
//            relation.addObject(newPost1)
//            self.user["myPosts"].addObject(self.posts)
//            
//            self.user.saveInBackgroundWithBlock { (Bool: Bool , error: NSError!) -> Void in
//                println("error saving")
//            }
//
//        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPosts(thread!)
        
        newPostField.hidden = true
        newPostField.enabled = false
        saveButtonLabel.enabled = false
        // Do any additional setup after loading the view.
        
        println(user.myPosts.count)
        
    }
    
    func loadPosts(thread: Thread) {
        // Retrieve and load posts from the given thread
        println("\(thread.title!)")
        if !thread.posts.isEmpty {
            posts = thread.posts
            println(posts.count)
            println("Posts for given thread have been loaded")
        } else {
            println("No posts in this thread")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        
        return posts.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = posts[indexPath.row].message
        
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        
//        if var storedPosts: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("Posts"){
//            
//            posts = []
//            for var i = 0; i < storedPosts.count; ++i {
//                posts.append(storedPosts[i] as Post)
//            }
//        }
        
        postTable.reloadData()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        //Function to delete a Post
        
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            posts.removeAtIndex(indexPath.row) //Remove from "mutable" posts array
            
            //       let fixedPosts = posts
            //       NSUserDefaults.standardUserDefaults().setObject(fixedPosts, forKey: "posts")
            //       NSUserDefaults.standardUserDefaults().synchronize() //Remove from "immutable" fixedToDoItems array
            
            postTable.reloadData() //updates page
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
