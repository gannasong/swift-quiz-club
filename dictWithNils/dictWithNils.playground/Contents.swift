import UIKit

/*
 Solution: 1

 Setting a dictionary value to nil through the subscript always removes the value from the dictionary.

 If we want to have a nil value in a dictionary with optional values, we have to use .some(nil).
 */

var dictWithNils: [String: Int?] = [
  "one": 1,
  "two": 2,
  "none": nil
]

dictWithNils.count

dictWithNils["two"] = nil
dictWithNils["none"] = nil

dictWithNils.count

// What's the result?
// 1
// 3
// Compiler Error

