//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


func tempMethod(){
    let tem = 23
    
    guard tem > 10 else{
        print(tem)
        return
    }

}


class TempClass{
    var tempInt = 12
    
    init(temp:Int){
        tempInt = temp
    }
}

var tempT : TempClass = TempClass(temp: 23)

tempT.tempInt