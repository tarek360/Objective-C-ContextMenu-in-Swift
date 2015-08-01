//
//  ViewController.swift
//  SwiftContextMenu
//
//  Created by tarek on 8/1/15.
//  Copyright (c) 2015 tarek. All rights reserved.
//

import UIKit

let menuCellIdentifier = "rotationCell"


class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, YALContextMenuTableViewDelegate {

    
    var menuTitles : [String?] = []
    var menuIcons : [UIImage?] = []
    var contextMenuTableView: YALContextMenuTableView?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initiateMenuOptions()
        //self.navigationController?.setValue(YALNavigationBar(), forKeyPath: "navigationBar")
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        self.contextMenuTableView!.reloadData()
    }
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        super.willRotateToInterfaceOrientation(toInterfaceOrientation, duration:duration)
        
        self.contextMenuTableView!.updateAlongsideRotation()
    }
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)

        coordinator.animateAlongsideTransition(nil, completion: {(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
            self.contextMenuTableView!.reloadData()
        })

        self.contextMenuTableView!.updateAlongsideRotation()
    }
    
    @IBAction func presentMenuButtonTapped(sender: UIBarButtonItem) {
        
        // init YALContextMenuTableView tableView
        self.contextMenuTableView = YALContextMenuTableView(tableViewDelegateDataSource: self)
        self.contextMenuTableView!.animationDuration = 0.11;
        //optional - implement custom YALContextMenuTableView custom protocol
        self.contextMenuTableView!.yalDelegate = self
        var cellNib = UINib(nibName: "ContextMenuCell", bundle: nil)
        self.contextMenuTableView?.registerNib(cellNib, forCellReuseIdentifier: menuCellIdentifier)
        
        // it is better to use this method only for proper animation
        self.contextMenuTableView?.showInView(self.navigationController!.view, withEdgeInsets: UIEdgeInsetsZero, animated: true)
    }
    
    func contextMenuTableView(contextMenuTableView: YALContextMenuTableView!, didDismissWithIndexPath indexPath: NSIndexPath!) {
        println("Menu dismissed with indexpath = \(indexPath)")

    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var t = tableView as! YALContextMenuTableView
        t.dismisWithIndexPath(indexPath)

    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuTitles.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var t = tableView as! YALContextMenuTableView
        var cell = t.dequeueReusableCellWithIdentifier(menuCellIdentifier, forIndexPath:indexPath) as! ContextMenuCell
        
            cell.backgroundColor = UIColor.clearColor()
            cell.menuTitleLabel.text = self.menuTitles[indexPath.row]
            cell.menuImageView.image = self.menuIcons[indexPath.row]
        
        
        return cell;
    
    }
    
    func initiateMenuOptions() {
        self.menuTitles = ["",
            "Send message",
            "Like profile",
            "Add to friends",
            "Add to favourites",
            "Block user"]
    
        self.menuIcons = [UIImage(named: "Icnclose"), UIImage(named: "SendMessageIcn"), UIImage(named: "LikeIcn"), UIImage(named: "AddToFriendsIcn"), UIImage(named: "AddToFavouritesIcn"), UIImage(named: "BlockUserIcn")]
        
    }
}

