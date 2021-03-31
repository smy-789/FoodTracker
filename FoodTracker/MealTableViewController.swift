//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by 盛明钰 on 2021/4/1.
//

/* 在这个自定义子类中，现在可以定义一个属性来存储用餐对象的列表。Swift标准库包含一个名为Array的结构，可以很好地跟踪项目列表。*/

import UIKit

class MealTableViewController: UITableViewController {
    
    //MARK: Properties
    /*此代码声明MealTableViewController上的属性，并使用默认值（用餐对象的空数组）对其进行初始化。通过使数组变为变量（var）而不是常量，可以使数组可变，这意味着您可以在初始化数组后向其添加项。*/
    var meals = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()

        /*此方法的模板实现包括Xcode创建MealTableViewController.swift时插入的注释。像这样的代码注释在源代码文件中提供了有用的提示和上下文信息，但该项目不需要这些。*/
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Load the sample data.
        loadSampleMeals()
    }

    // MARK: - Table view data source 数据源方法
    /* 一个功能正常的表视图需要三种表视图数据源方法。
     func numberOfSections(in tableView: UITableView) -> Int
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     第一个是numberOfSections（In:），它告诉表视图要显示多少节。节是表视图中单元格的可视分组，在包含大量数据的表视图中尤其有用。对于像FoodTracker应用程序中那样的简单表视图，您只需要表视图来显示单个节，因此numberOfSections（in:）数据源方法的实现非常简单。
     
     第二个数据源方法tableView(_:numberOfRowsInSection:)，告诉表视图在给定的节中要显示多少行。您的表视图只有一个部分，每个meal对象都应该有自己的行。这意味着行数应该是用餐数组中用餐对象的数量。
     
     最后一个数据源方法tableView(_:cellForRowAt:)配置并提供了一个单元格来显示给定行。表视图中的每行都有一个单元格，该单元格决定该行中显示的内容以及该内容的布局方式。
     对于具有少量行的表视图，所有行可能一次出现在屏幕上，因此会为表中的每一行调用此方法。但是具有大量行的表视图在给定时间只显示其总项的一小部分。对于表视图来说，只要求显示行的单元格是最有效的，这也是tableView(_:cellForRowAt:)允许表视图做的。
*/

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 需要返回meal数量。Array有一个名为count的属性，该属性返回数组中的项数，因此行数为meal.count
        
        return meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*dequeueReusableCell(withIdentifier:for:)方法从表视图请求单元格。当用户滚动时，表不会创建新单元格并删除旧单元格，而是尽可能地重用这些单元格。如果没有可用的单元格，则将dequeueReusableCell(withIdentifier:for:)实例化一个新的单元格；但是，当单元格滚动离开场景时，它们将被重用。标识符告诉ddequeueReusableCell(withIdentifier:for:)应该创建或重用哪种类型的单元格。*/
        
        // Table view cells are reused and should be dequeued using a cell identifier. 表视图单元格是重用的，应该使用单元格标识符将其取消排队。
        let cellIdentifier = "MealTableViewCell"
                
        // 因为创建了一个要使用的自定义单元格类，将单元格类型降到自定义单元格子类MealTableViewCell。
        /* as？ MealTableViewCell表达式尝试将返回的对象从UITableViewCell类向下转换为MealTableViewCell类。这将返回一个可选的。*/
        /* guard let表达式安全地打开可选的。*/
        /*如果Main.storyboard设置正确，并且cellIdentifier与故事板中的标识符匹配，那么永远不应该失败。如果降级失败，fatalError()函数会向控制台打印错误消息并终止应用程序。
*/
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell  else {
                fatalError("The dequeued cell is not an instance of MealTableViewCell.")
            }
        
        // Fetches the appropriate meal for the data source layout. 为数据源布局获取适当的数据。
        let meal = meals[indexPath.row]
        

        cell.nameLable.text = meal.name
        cell.photoImageView.image = meal.photo
    //    cell.ratingControl.rating = meal.rating
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: Private Methods
    // 这是一个将样本数据加载到应用程序中的辅助方法。
    private func loadSampleMeals() {
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
   
        /* 因为Meal Class`s init(name:, photo:, rating:)初始值设定项不可用，需要检查初始值设定项返回的结果。在这种情况下，您传递的是有效的参数，因此初始值设定项永远不会失败。如果初始化失败，那么代码中就有一个bug。为了帮助您识别和修复任何错误，如果初始值设定项失败，fatalError（）函数会将错误消息打印到控制台，应用程序将终止。*/
        guard let meal1 = Meal(name: "Caprese Salad", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate meal1")
        }
         
        guard let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate meal2")
        }
         
        guard let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate meal3")
        }
        
        // 创建meal对象后，使用以下代码将其添加到用餐数组：
        meals += [meal1, meal2, meal3]
    }
}
