# defer
#### 參考資料

- [關於 Swift defer 的正確使用](https://onevcat.com/2018/11/defer/)
- [How “defer” operator in Swift actually works](https://medium.com/@sergeysmagleev/how-defer-operator-in-swift-actually-works-30dbacb3477b)

## TL;DR
`defer`的目的就是進行資源清理和避免重複`return`前需要的執行的事項，而不是用來取巧地實現某些功能

### Quiz
```
var count: Int = 5

func increment() -> Int {
  defer { count += 1 }
  return count
}

count = increment()

// What's the value of counter?
5
6
Completion Error

```
### Solution
```
Solution: 5

The defer statement gets executed after the return statement, but before the function actually returns. 

Therefore, the return value of 5 will be assigned to counter.

- defer 會在 return 之後執行，但在函數實際 return 之前執行。

```

#### Why?
In `How “defer” operator in Swift actually works` Said:

```
But more importantly, it’s simply technically impossible to perform any task after the function has returned.
See, any function in practically any programming language ultimately finishes with a return statement.
Once it hits return the execution leaves the current scope, disposes all the local resources, pops the function from the stack and jumps to where it left off one step up the call hierarchy.

```
圖1
<p align="center"> 
<img src="/images/defer01.png">
</p>

圖1
<p align="center"> 
<img src="/images/defer02.png">
</p>

可以對照`圖1`&`圖2`，有用顏色區分程式執行的時機點。可以看到`defer`是在`return`前被執行的。
所以就這題而言，其實`count`的確有被`+1`，但最後又賦值回去，所以還是`5`。

#### NOTE
- `defer`是在`當前 scope 退出的時候`調用
