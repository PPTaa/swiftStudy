import UIKit

var str = "Hello, playground"

for _ in 1...5{
    for _ in 1...5{
        print("*",terminator: "")
    }
    print("")
}

print("========================")

for i in 1...5 {
    for _ in 1...i {
        print("*",terminator: "")
    }
    print("")
}

print("========================")

for i in (1...5).reversed() {
    for _ in 1...i {
        print("*",terminator: "")
    }
    print("")
}

print("========================")

for i in 1...5 {
    for j in 1...5 {
        if i > j {
            print(" ", terminator: "")
        } else {
            print("*",terminator: "")
        }
    }
    print("")
}

print("========================")

for i in (1...5).reversed() {
    for j in 1...5 {
        if i > j {
            print(" ", terminator: "")
        } else {
            print("*",terminator: "")
        }
    }
    print("")
}

print("========================")

for i in 1...5 {
    switch i {
    case 1,5:
        for _ in 1...5 {
            print("*" ,terminator:"")
        }
        print()
    default:
        for j in 1...5 {
            if j == 1 || j == 5{
                print("*",terminator:"")
            } else {
                print(" ",terminator:"")
            }
        }
        print()
    }
}
