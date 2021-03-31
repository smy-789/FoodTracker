//
//  Meal.swift
//  FoodTracker
//
//  Created by 盛明钰 on 2021/3/31.
//

/*当Xcode创建新的Swift文件时，默认情况下它会导入Foundation框架，允许您在代码中处理Foundation数据结构。您还将使用UIKit框架中的类，因此您需要导入UIKit。然而，导入UIKit还允许您访问Foundation，因此您可以删除Foundation的冗余导入。*/


import UIKit

class Meal {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    
    //MARK: Initialization

    init?(name: String, photo: UIImage?, rating: Int) {
        
        // Initialization should fail if there is no name or if the rating is negative.  如果没有初始值或额定值为负，则初始化失败
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
         
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties. 初始化存储属性
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
}


