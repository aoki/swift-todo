import UIKit
import CoreData

class ToDoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!

  var todoEntities: [ToDo]!

  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todoEntities.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ToDoListItem")!
    cell.textLabel!.text = todoEntities[indexPath.row].item
    return cell
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        todoEntities.remove(at: indexPath.row).mr_deleteEntity()
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
        tableView.reloadData()
    }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // TODO: 文字列比較以外の方法は？
    // TODO: 少し改善したけど、まだString
    if segue.identifier == StoryboardSegue.Main.Edit.rawValue {
      let todoController = segue.destination as! ToDoItemViewController
      let task = todoEntities[tableView.indexPathForSelectedRow!.row]
      todoController.task = task
    }
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    todoEntities = ToDo.mr_findAll() as? [ToDo]
    tableView.reloadData()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    todoEntities = ToDo.mr_findAll() as? [ToDo]
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

