//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by 盛明钰 on 2021/3/17.
//


/* 代码在导入应用程序时使用@testable属性。这使您的测试可以访问应用程序代码的内部元素。请记住，Swift默认为代码中的所有类型、变量、属性、初始化程序和函数的内部访问控制。如果您尚未明确将项目标记为私有或私有文件，您可以从测试中访问它。*/


import XCTest
@testable import FoodTracker

/* XCTest框架是Xcode的测试框架。单元测试本身是在一个类FoodTrackerTests中定义的，这个类继承自XCTestCase。代码注释解释了setUp（）和tearDown（）方法，以及两个示例测试用例：testExample（）和testPerformanceExample（）。*/

class FoodTrackerTests: XCTestCase {
    
    //MARK: Meal Class Tests
    
    // Confirm that the Meal initializer returns a Meal object when passed valid parameters.  确认当传递有效参数时，Meal初始化器返回Meal对象。
    // 当单元测试运行时，系统会自动运行此测试用例。
    // 如果初始值设定项按预期工作，则对init（name:，photo:，rating:）的这些调用应该会成功。XCTAssertNotNil通过检查返回的餐对象是否为nil来验证这一点。
    func testMealInitializationSucceeds() {
        // Zero rating
        let zeroRatingMeal = Meal.init(name: "zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // High positive rating
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    // Confirm that the Meal initialier returns nil when passed a negative rating or an empty name. 确认当传递负面评价或空名称时，用餐初始值设定项返回nil。
    func testMealInitializationFails() {
        // Negative rating  负值
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
         
        // Rating exceeds maximum
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
        
        // Empty String
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
    }
    

}
