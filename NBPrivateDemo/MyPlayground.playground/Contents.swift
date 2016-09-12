//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


func tempMethod(){
    let tem = 23
    
    guard tem > 300 else{
        print(tem)
        return
    }

}


class TempClass{
    var tempInt = 12
    
    init(temp:Int){
        tempInt = temp
    }
    
#if swift(>=3)
    func test1(){
    print("I don't know! ===> 1")
    }
#else
    func test1(){
        print("I don't know! ===> 2")
    }
#endif
}

var tempT : TempClass = TempClass(temp: 23)

tempT.tempInt
tempT.test1()

