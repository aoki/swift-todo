import UIKit
import CoreData

class ToDoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!

  var todoEntities: [ToDo]!

  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todoEntities.count
  }

  func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ToDoListItem") as! UITableViewCell
    cell.textLabel!.text = todoEntities[indexPath.row].item
    return cell
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

