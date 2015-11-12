Tutorial source: [Getting Started with Core Data Tutorial][1]

The key point of the tutorial:

1. The step to insert objects to CoreData
	* Get the managed object context (NSManagedObjectContext)
	* Create a new managed object and insert it into the context above
	* Set the attributes of the managed object
	* Save the object to the context  

	func saveName(name: String) {
		// 1. 
		let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
		let managedContext = appDelegate.managedObjectContext
	        
		// 2. 
		let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
		let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
	      
		// 3  
		person.setValue(name, forKey: "name")
	    
		// 4	
	    do {
	        try managedContext.save()  
	        people.append(person)
	    } catch let error as NSError {
	        print("Could not save \(error), \(error.userInfo)")
	    }
	}
	

2. The step to fetch result from CoreData

[1]:	http://www.raywenderlich.com/115695/getting-started-with-core-data-tutorial