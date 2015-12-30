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

  @IBAction func cancel(sender: UIBarButtonItem) {
    navigationController!.popViewControllerAnimated(true)
  }

  @IBAction func save(sender: UIBarButtonItem) {
    switch task {
      case .None: createTask()
      case .Some(_): editTask()
    }
    navigationController!.popViewControllerAnimated(true)
  }

  private func createTask() -> Void {
    print("CREATAE TASK")
    let newTask: ToDo = ToDo.MR_createEntity() as ToDo
    newTask.item = todoField.text!
    newTask.managedObjectContext!.MR_saveToPersistentStoreAndWait()
  }

  private func editTask() -> Void {
    print("EDIT TASK")
    task?.item = todoField.text!
    task?.managedObjectContext!.MR_saveToPersistentStoreAndWait()
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
