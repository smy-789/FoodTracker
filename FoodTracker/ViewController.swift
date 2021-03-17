//
//  ViewController.swift
//  FoodTracker
//
//  Created by 盛明钰 on 2021/3/17.
//

// 用户界面的行为将在此类中定义

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties 标记：属性
    /* 以字符//MARK:开头的注释是一种特殊类型的注释，用于组织您的代码，并帮助您（以及任何阅读代码的人）浏览代码。你稍后会看到这个在起作用。具体而言，您添加的注释表明这是代码中列出属性的部分。
     */
    
    /*
        IBOutlet属性告诉Xcode您可以从Interface Builder连接到nameTextField属性（这就是为什么该属性具有IB前缀）。弱关键字（weak）表示引用不会阻止系统取消分配引用的对象。弱引用有助于防止引用循环；但是，要使对象保持活动状态并保留在内存中，您需要确保应用程序的其他部分对该对象具有强引用。在本例中，它是文本字段的超级视图。超视图维护对其所有子视图的强引用。只要超视图在内存中保持活动状态，所有子视图也保持活动状态。类似地，视图控制器对其内容视图有一个强引用，使整个视图层次结构保持活动并在内存中。*/
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    
    /* 当视图控制器从故事板加载时，系统会实例化视图层次结构，并将适当的值分配给所有视图控制器的插座。当调用视图控制器的viewDidLoad()方法时，系统已为控制器的所有插座分配了有效值，您可以安全地访问其内容。*/
    override func viewDidLoad() {
        super.viewDidLoad()
        // 加载视图后，执行任何其他设置
        
        // 通过委托回调处理文本字段的用户输入
        nameTextField.delegate = self   // self 指的是ViewController类，因为它是在ViewController类范围内引用
    }

    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard 隐藏键盘
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text;
    }
    
    /*MARK: Actions 操作（或操作方法），此注释表明这是代码中列出操作的部分 */
    /* Type字段的值默认为AnyObject。在Swift中，AnyObject是一种类型，用于描述可以属于任何类的对象。指定此操作方法的类型为UIButton意味着只有按钮对象可以连接到此操作。虽然这对你现在正在创建的行动来说意义不大，但以后记住这一点很重要。
     
        sender参数是指在本例中负责触发操作的对象，即按钮。IBAction属性表示该方法是一个可以从InterfaceBuilder中的情节提要连接到的操作。声明的其余部分声明了一个名为setDefaultLabelText（）的方法）。*/
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        //目标动作模式：当特定事件发生时，一个对象向另一个对象发送消息
        /*在这种情况下：
         
         事件是用户点击“设置默认文本”按钮。
         操作方法是setDefaultLabelText()。
         目标是ViewController（其中定义了操作方法）。
         发送方是“设置默认标签文本”按钮*/
        mealNameLabel.text = "Default Text"
    }
    
}

