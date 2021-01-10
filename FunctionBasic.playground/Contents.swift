import UIKit

//basic function
func printName(){
    print("My Name is Tom")
}

printName()

// param 1개
// 숫자를 받아서 10을 곱해서 출력

func printMultipleOfTen(value: Int) {
    print("\(value) * 10 = \(value*10)")
}
printMultipleOfTen(value: 9)

// param 2개
// 물건 값과 개수를 받아서 전체금액을 출력
func printTotalPrice(price:Int, count:Int){
    print("Total Price : \(price*count)")
}
printTotalPrice(price: 1500, count: 40)

// param name 없이
func printTotalPrice1(_ price:Int,_ count:Int){
    print("Total Price : \(price*count)")
}
printTotalPrice1(100, 40)

// param name 수정
func printTotalPrice2(가격 price:Int,개수 count:Int){
    print("Total Price : \(price*count)")
}
printTotalPrice2(가격: 200, 개수: 30)

//함수에 default설정하기
func printTotalPriceDefaultValue(price:Int = 1000,count:Int){
    print("Total Price : \(price*count)")
}
printTotalPriceDefaultValue(count: 2)
printTotalPriceDefaultValue(count: 50)
printTotalPriceDefaultValue(price: 1500, count: 30)

//함수에 default설정하기
func totalPrice(price:Int,count:Int) -> Int {
    let totalPrice = price * count
    return totalPrice
}
let calculatedPrice = totalPrice(price: 140, count: 10)
print(calculatedPrice)

// 1. 성, 이름을 받아서 fullName을 출력하는 함수 만들기
func printFullname1(lastname:String, firstname:String){
    print("fullName : \(lastname) \(firstname)")
}
printFullname1(lastname: "Lee", firstname: "Hana")
// 2. 1번에서 만든함수를 파라미터 이름을 제거하고 fullNamed을 출력하는 함수 만들기
func printFullname2(_ lastname:String, _ firstname:String){
    print("fullName : \(lastname) \(firstname)")
}
printFullname2("Lee", "Hana")
// 3. 성, 이름을 받아서 fullName을 return하는 함수 만들기
func printFullname3(lastname:String, firstname:String) -> String{
    let fullName = lastname + firstname
    return fullName
}
let fullname = printFullname3(lastname: "Lee", firstname: "Hana")
print(fullname)

// 함수 overload 같은 함수명에 다른 내용을 덮어 씌울 수있음
func printTotalPrice(price: Float, count: Int){
    print("total price : \(price * Float(count))")
}
printTotalPrice(price: 123.14, count: 9)

// In-out parameter
//func incrementAndPrint(_ value:Int) {
//    value += 1 (parameter로 들어오는 값은 const이가 때문에 변환이 불가능)
//    print(value)
//}
var val = 10
func incrementAndPrint(_ value: inout Int) { // inout을 활용하면 값을 활용할 수 있음
    value += 1
    print(value)
}
incrementAndPrint(&val)

// 함수를 parameter로 넘기기

func add(_ a:Int, _ b: Int) -> Int {
    return a+b
}

func subtract(_ a:Int, _ b: Int) -> Int {
    return a-b
}

var function = add
function(4,5)
function = subtract
function(5,4)

func printResult(_ function:(Int, Int) -> Int, _ a:Int, _ b:Int) {
    let result = function(a,b)
    print(result)
}
printResult(add, 11, 23)
printResult(subtract, 11, 23)
