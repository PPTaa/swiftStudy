import UIKit


// ----- Closure : 함수처럼 기능을 수행하는 코드블럭의 특별한 타입
// 함수는 클로저의 한가지 타입
// 클로저의 타입 - Global 함수, Nested 함수, Closure Expression
// Closure Expression - 이름이 없고 주변의 값들을 가질수 있는 가변문법을 가진 클로저 타입
// 결국 함수처럼 기능을 수행하는 코드 블록
// 함수와 클로저의 차이점 -> 이름이 없다.
// 함수와 클로저의 공통점 -> 인자를 받을수 있음, 값을 리턴할 수 있음, 변수로 할당할 수 있음, First Class Type 이다
// First Class Type? : 변수에 할당받을수 있다, 인자로 받을 수 있다, 리턴할 수 있다.
// 자주쓰이는 형태 : Completion Block, High Order Functions
// Completion Block -> 작업의 수행이 끝났을 때 수행되는 블럭
// High Order Functions -> 인풋으로 함수를 받을 수 있는 것들

// ----- Closure Syntax
/* 클로저 기본 문법
{ (parameters) -> return type in
    statements
}
*/

// ex1 :simple Closure
let simpleClosure1 = {
    
}
simpleClosure1()

// ex2 :코드 블록을 구현한 Closure
let simpleClosure2 = {
    print("hello world closure")
}
simpleClosure2()

// ex3 :인풋 파라미터를 받는 Closure
let simpleClosure3: (String) -> Void = { name in
    print("hello world closure Name is \(name)")
}
simpleClosure3("Tom")

// ex4 :값을 리턴하는 Closure
let simpleClosure4: (String) -> String = { name in
    let message = "hello world return closure Name is \(name)"
    return message
}
let result = simpleClosure4("Kim")
print(result)

// ex5 :Closure를 파라미터로 받는 함수 구현
func simpleFunc(simpleClosure: ()->Void) {
    print("함수에서 호출이 되었다.1")
    simpleClosure()
}
simpleFunc(simpleClosure: {
    print("hello World")
})

// ex6 :Trailing Closure 클로저가 마지막 인자일때 생략가능
func simpleFunc2(message:String, simpleClosure: ()->Void) {
    print("함수에서 호출이 되었다.2 \(message)")
    simpleClosure()
}
simpleFunc2(message: "메시지입니다.") {
    print("hello World")
}
// Closure
