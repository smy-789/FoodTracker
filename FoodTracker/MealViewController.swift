//
//  MealViewController.swift
//  FoodTracker
//
//  Created by 盛明钰 on 2021/3/17.
//

// 用户界面的行为将在此类中定义

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties 标记：属性
    /* 以字符//MARK:开头的注释是一种特殊类型的注释，用于组织您的代码，并帮助您（以及任何阅读代码的人）浏览代码。你稍后会看到这个在起作用。具体而言，您添加的注释表明这是代码中列出属性的部分。
     */
    
    /*
        IBOutlet属性告诉Xcode您可以从Interface Builder连接到nameTextField属性（这就是为什么该属性具有IB前缀）。弱关键字（weak）表示引用不会阻止系统取消分配引用的对象。弱引用有助于防止引用循环；但是，要使对象保持活动状态并保留在内存中，您需要确保应用程序的其他部分对该对象具有强引用。在本例中，它是文本字段的超级视图。超视图维护对其所有子视图的强引用。只要超视图在内存中保持活动状态，所有子视图也保持活动状态。类似地，视图控制器对其内容视图有一个强引用，使整个视图层次结构保持活动并在内存中。*/
    @IBOutlet weak var nameTextField: UITextField!
        
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControl!
    /* 当视图控制器从故事板加载时，系统会实例化视图层次结构，并将适当的值分配给所有视图控制器的插座。当调用视图控制器的viewDidLoad()方法时，系统已为控制器的所有插座分配了有效值，您可以安全地访问其内容。*/
    override func viewDidLoad() {
        super.viewDidLoad()
        // 加载视图后，执行任何其他设置
        
        // 通过委托回调处理文本字段的用户输入
        nameTextField.delegate = self   // self 指的是ViewController类，因为它是在ViewController类范围内引用
        /* 这种应用程序设计风格，其中视图控制器（self）作为视图和数据模型之间的通信管道，称MVC（模型-视图控制器）。在这种模式下，模型跟踪应用程序的数据，视图显示您的用户界面并构成应用程序的内容，控制器管理您的视图。通过响应用户操作并用数据模型的内容填充视图，控制器充当模型和视图之间通信的网关。MVC是任何iOS应用程序良好设计的核心，到目前为止，FoodTracker应用程序是按照MVC原则构建的。
         
*/
    }

    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard 隐藏键盘
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

    }
    
    //MARK: UIImagePickerControllerDelegate
    //当用户点击图像选择器的“取消”按钮时，imagePickerControllerDidCancel(_:)会被调用
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 如果用户点击取消，关闭选择器
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //信息字典可以包含图像的多个表示。此处使用原始的
        /*“UIImagePickerControllerOriginalImage”已重命名为“UIImagePickerController.InfoKey.originalImage'*/
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as?
            UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        //Set photoImageView to display the selected image. 设置photoImageView以显示选定的图像。
        photoImageView.image = selectedImage
        
        //Dismiss the picker. 关闭选择器
        dismiss(animated: true, completion: nil)

    }
    
    /*MARK: Actions 操作（或操作方法），此注释表明这是代码中列出操作的部分 */
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the Keyboard.  此代码确保如果用户在键入文本字段时点击图像视图，键盘将正确关闭。
        nameTextField.resignFirstResponder()
        
        // 添加此代码可创建图像选择控制器
        //UIImagePickerController是一个视图控制器，允许用户从照片库中选择媒体。
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken. 只允许选取照片，不允许拍照
        // 这行代码设置图像选择器控制器的来源，或它获取图像的地方。.photoLibrary选项使用模拟器的相机胶卷。
        /* imagePickerController.sourceType的类型已知为UIImagePickerControllerSourceType，这是一个枚举。这意味着您可以将其值写为缩写形式.photoLibrary，而不是UIImagePickerControllerSourceType.photoLibrary。请记住，您可以在已知枚举值类型时使用缩写形式。*/
        imagePickerController.sourceType = .photoLibrary
        
        // 添加此代码将图像选择器控制器的委托设置为 ViewController
        // Make sure ViewController is notified when the user picks an image. 确保在用户选择图像时通知ViewController。
        imagePickerController.delegate = self
        
        /* present() 是正在ViewController上调用的方法。虽然它不是显式编写的，但是这个方法是在隐式self对象上执行的。该方法要求ViewController显示由imagePickerController定义的视图控制器。将true传递给动画参数会使图像选取器控制器的显示动画化。completion参数是指一个完成处理程序，一段在这个方法完成后执行的代码。因为您不需要执行任何其他操作，所以通过传入nil来指示您不需要执行完成处理程序。*/
        present(imagePickerController, animated: true, completion: nil)
    }
}
