import UIKit

var str = "Hello, playground"

var text: String


text = "aaaaa"

print(text)

let text1: String


text1 = "Aaa"

func aa() { 
    print(s)
}


var s = "test"



aa()


text = "k111"
var test = Array(text)
print(test[0], test[1..<test.count])
var resultFirst = ""
var result = ""
for (i,v) in test.enumerated() {
    print(i, v)
    if i == 0 {
        print(v)
        resultFirst = String(v)
    } else {
        result += String(v)
        print(Int(result))
    }
}
var resultInt = Int(result)! + 1
print(resultFirst + String(resultInt))

resultInt = Int(result)! - 1
print(resultFirst + String(resultInt))

