import UIKit

var count: Int = 5

func increment() -> Int {
  print("Step 1")
  defer {
    count += 1
    print("Step 2")
    print("Count is: \(count) At Step 2")

  }
  print("Step 3")
  return count
}

count = increment()
