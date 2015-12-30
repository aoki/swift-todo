import UIKit
import CoreData

class ToDoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!

  var todoEntities: [ToDo]!

  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todoEntities.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ToDoListItem") as! UITableViewCell
    cell.textLabel!.text = todoEntities[indexPath.row].item
    return cell
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
        todoEntities.removeAtIndex(indexPath.row).MR_deleteEntity()
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
        tableView.reloadData()
    }
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // TODO: 文字列比較以外の方法は？
    if segue.identifier == "edit" {
      let todoController = segue.destinationViewController as! ToDoItemViewController
      let task = todoEntities[tableView.indexPathForSelectedRow()!.row]
      todoController.task = task
    }
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    todoEntities = ToDo.MR_findAll() as? [ToDo]
    tableView.reloadData()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    todoEntities = ToDo.MR_findAll() as? [ToDo]
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

