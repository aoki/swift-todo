import UIKit

class ToDoItemViewController: UIViewController {

  @IBOutlet weak var todoField: UITextField!

  var task: ToDo? = nil

  override func viewDidLoad() {
    super.viewDidLoad()
    if let taskTodo = task {
      todoField.text = taskTodo.item
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func cancel(_ sender: UIBarButtonItem) {
    navigationController!.popViewController(animated: true)
  }

  @IBAction func save(_ sender: UIBarButtonItem) {
    switch task {
      case .none: createTask()
      case .some(_): editTask()
    }
    navigationController!.popViewController(animated: true)
  }

  fileprivate func createTask() -> Void {
    print("CREATAE TASK")
    let newTask: ToDo = ToDo.mr_createEntity() as ToDo
    newTask.item = todoField.text!
    newTask.managedObjectContext!.mr_saveToPersistentStoreAndWait()
  }

  fileprivate func editTask() -> Void {
    print("EDIT TASK")
    task?.item = todoField.text!
    task?.managedObjectContext!.mr_saveToPersistentStoreAndWait()
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
