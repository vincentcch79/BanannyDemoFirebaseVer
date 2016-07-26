//
//  SearchResultClass.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/14.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import Foundation


class searchResult {
    

    
    var nameResult = ""
    var imageResult = ""
    var starResult = 0.0
    var numResult = ""
    var hourRseult = ""
    var finishResult = ""
    var startDay = ""
    var nannyId = ""
    var vacationRate = ""
    var specialRate = ""
    var specialText = ""
    var minimalHour = ""
    var specialExp = ""
    var nannyIntro = ""
    var startYear = ""
//    var introClasses:[introClass] = []

    
    
    init(nameResult:String, imageResult:String, starResult: Double, numResult: String, hourResult: String, finishResult: String, startDay: String, nannyId: String, vacationRate: String, specialRate: String, specialText: String, minimalHour: String, specialExp: String, nannyIntro: String, startYear: String){
        self.nameResult = nameResult
        self.imageResult = imageResult
        self.starResult = starResult
        self.numResult = numResult
        self.hourRseult = hourResult
        self.finishResult = finishResult
        self.startDay = startDay
        self.nannyId = nannyId
        self.vacationRate = vacationRate
        self.specialRate = specialRate
        self.specialText = specialText
        self.minimalHour = minimalHour
        self.specialExp = specialExp
        self.nannyIntro = nannyIntro
        self.startYear = startYear
        
    }
    
    
}

//struct introClass {
//    
//    var introClassTitle = ""
//    var introClassContent = ""
//    
//}
