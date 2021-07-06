# Closures

闭包是自包含的函数代码块，可以在代码中被传递和使用。Swift 中的闭包与 C 和 Objective-C 中的代码块（blocks）以及其他一些编程语言中的匿名函数（Lambdas）比较相似

闭包可以捕获和存储其所在上下文中任意常量和变量的引用。被称为包裹常量和变量。 Swift 会为你管理在捕获过程中涉及到的所有内存操作。

在 [函数](notion://www.notion.so/swift/swift-jiao-cheng/06_functions) 章节中介绍的全局和嵌套函数实际上也是特殊的闭包，闭包采用如下三种形式之一：

- 全局函数是一个有名字但不会捕获任何值的闭包
- 嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
- 闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包

## 闭包表达式

闭包表达式是一种构建内联闭包的方式，它的语法简洁。在保证不丢失它语法清晰明了的同时，闭包表达式提供了几种优化的语法简写形式。下面通过对 sorted(by:) 这一个案例的多次迭代改进来展示这个过程，每次迭代都使用了更加简明的方式描述了相同功能。

### 排序方法

Swift 标准库提供了名为 sorted(by:) 的方法,会基于你提供的排序闭包表达式的判断结果对数组中的值（类型确定）进行排序,方法会返回一个与旧数组类型大小相同类型的新数组，该数组的元素有着正确的排序顺序，且原数组不会被 sorted(by:) 方法修改。

```swift
sort(by areInIncreasingOrder: (Self.Element, Self.Element) throws -> Bool)
```

sorted(by:) 方法接受一个闭包，该闭包函数需要传入与数组元素类型相同的两个值，并返回一个布尔类型值来表明当排序结束后传入的第一个参数排在第二个参数前面还是后面

```swift
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames 为 ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
```

然而，以这种方式来编写一个实际上很简单的表达式（a > b)，确实太过繁琐了。对于这个例子来说，利用闭包表达式语法可以更好地构造一个内联排序闭包.

### 闭包表达式语法

```swift
{ (parameters) -> return type in
    statements
}
```

闭包表达式参数 可以是 in-out 参数，但不能设定默认值。如果你命名了可变参数，也可以使用此可变参数。元组也可以作为参数和返回值。

```swift
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
```

*in:表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始。*

### 根据上下文推断类型

因为排序闭包函数是作为 sorted(by:) 方法的参数传入的，Swift 可以推断其参数和返回值的类型。sorted(by:) 方法被一个字符串数组调用，因此其参数必须是 (String, String) -> Bool 类型的函数。这意味着 (String, String) 和 Bool 类型并不需要作为闭包表达式定义的一部分。因为所有的类型都可以被正确推断，返回箭头（->）和围绕在参数周围的括号也可以被省略：

```swift
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
```

### 单表达式闭包的隐式返回

单行表达式闭包可以通过省略 return 关键字来隐式返回单行表达式的结果，如上版本的例子可以改写为：

```swift
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
```

### 参数名称缩写

Swift 自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推。in 关键字也同样可以被省略，因为此时闭包表达式完全由闭包函数体构成：

```swift
reversedNames = names.sorted(by: { $0 > $1 } )
```

### 运算符方法

Swift 的 String 类型定义了关于大于号（>）的字符串实现，其作为一个函数接受两个 String 类型的参数并返回 Bool 类型的值。而这正好与 sorted(by:) 方法的参数需要的函数类型相符合。因此，你可以简单地传递一个大于号，Swift 可以自动推断找到系统自带的那个字符串函数的实现：

```swift
/// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func > (lhs: String, rhs: String) -> Bool
```

```swift
reversedNames = names.sorted(by: >)
```

## 尾随闭包



