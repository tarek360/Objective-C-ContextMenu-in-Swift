# Objective-C-ContextMenu-in-Swift

In this hybrid (swift\Objective-C) project, i used [Context-Menu.iOS] (https://github.com/Yalantis/Context-Menu.iOS) which is written in Objective-C to implement it into swift code.

#### You can easily add awesome animated context menu to  your hybrid project.

![ContextMenu](https://d13yacurqjgara.cloudfront.net/users/125056/screenshots/1785274/99miles-profile-light_1-1-4.gif)

* Use the following code sample to start menu 
```swift
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
```