import Foundation
import CoreData

@objc(ToDo)
class ToDo: NSManagedObject {

    @NSManaged var item: String

}
