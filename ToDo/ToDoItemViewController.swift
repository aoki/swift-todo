import UIKit

class ToDoItemViewController: UIViewController {

  @IBOutlet weak var todoField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func cancel(sender: UIBarButtonItem) {
    navigationController!.popViewControllerAnimated(true)
  }

  @IBAction func save(sender: UIBarButtonItem) {
    let newTask: ToDo = ToDo.MR_createEntity() as! ToDo
    newTask.item = todoField.text
    newTask.managedObjectContext!.MR_saveToPersistentStoreAndWait()

    navigationController!.popViewControllerAnimated(true)
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
