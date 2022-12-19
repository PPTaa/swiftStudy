var number = [1,5,3,6,7,9]
func order(s1: Int, s2: Int) -> Bool {
  if s1 > s2 {
    return true
  } else {
    return false
  }
}
number.sort(by:order) // [9,7,6,5,3,1]

var test = () -> Void

func callback(fn: @escaping () -> Void) {
    test = fn
    test
}

callback {
    print("ssssss")
}
