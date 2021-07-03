## 常量和变量（Constants and Variables）

### 变量和常量的声明

```swift
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
```

分别使用let来声明一个常量，使用var来声明一个变量。如果某个值在后续不会被改变一般都声明为常量。

### 类型注解

```swift
var welcomeMessage: String
var red, green, blue: Double
```

在变量或者常量声明时就定义好这个变量或者常量的类型

注意：在实际的开发中一般我们很少需要写明具体类型，如果我们在变量或者常量声明的时候就提供了初始值，Swift可以隐式的设置变量或者常量的类型。

### 变量的命名

常量和变量的命名不能包含空格符、数学符号、箭头、保留的Unicode编码、连线、制表符。同时变量或者常量名不能以数字开头。

注意：如果你需要使用与 Swift 保留关键字相同的名称作为常量或者变量名，你可以使用反引号（`）将关键字包围的方式将其作为名字使用。无论如何，你应当避免使用关键字作为常量或变量名，除非你别无选择。

### 变量和常量的打印

```swift
print(friendlyWelcome)
print("The current value of friendlyWelcome is \(friendlyWelcome)")
// Prints "The current value of friendlyWelcome is Bonjour!
```

Swift 用字符串插值（string interpolation）的方式把常量名或者变量名当做占位符加入到长字符串中，Swift 会用当前常量或变量的值替换这些占位符。将常量或变量名放入圆括号中，并在开括号前使用反斜杠将其转义

### 注释

```swift
单行注释：
// This is a comment.  

多行注释：
/* This is also a comment
but is written over multiple lines. */

注释嵌套：
/* This is the start of the first multiline comment.
 /* This is the second, nested multiline comment. */
 This is the end of the first multiline comment. */
```

### 冒号

一般不需要在每行代码的末尾添加  “;”  除非你要在一行执行多句代码

```swift
let cat = "🐱"; print(cat)
```

一般不要再一行写多句代码

## 整数

Swift也提供了UInt8、Int32这些子类型，但是正常我们开发中一般使用的都是Int，对于无符号整数，Swift也提供了UInt类型，但是一般我们不适用，即使我明确知道声明的变量或者常量是非负数，统一使用Int可以提高复用性，避免不同类型的数字间的转换。

## 浮点数

Swift中提供了Double和Float两种类型来表示浮点数

Double:表示64位浮点数，用于存储精度很高的数据类型

Float:表示32位浮点数，用于存放对精度要求不高的数据类型

注意：Double 精确度很高，至少有 15 位小数，而 Float 只有 6 位小数。选择哪个类型取决于你的代码需要处理的值的范围，在两种类型都匹配的情况下，将优先选择 Double。在Swift的类型推断中也是优先选择Double。

## 类型安全和类型推断

Swift是一个类型安全的语言，因此在定义一个常量或者变量时务必要确定类型，我们一般可以通过在声明常量或者变量时提供初始值，或者显式的定义类型。

```swift
let key1: Int
let key2 = "aa"
```

如果我们定义了一个变量或者常量，系统无法确定他的类型，则会提示错误

![https://tva1.sinaimg.cn/large/008i3skNly1gs1hxyc4d6j32au03qwfd.jpg](https://tva1.sinaimg.cn/large/008i3skNly1gs1hxyc4d6j32au03qwfd.jpg)

## 数值型字面量

### 整数字面量

```swift
let decimalInteger = 17
let binaryInteger = 0b10001       // 二进制的17
let octalInteger = 0o21           // 八进制的17
let hexadecimalInteger = 0x11     // 十六进制的17
```

整数字面量可以被写作：

- 一个*十进制*数，没有前缀
- 一个*二进制*数，前缀是 `0b`
- 一个*八进制*数，前缀是 `0o`
- 一个*十六进制*数，前缀是 `0x`

### 浮点数字面量

浮点字面量可以是十进制（没有前缀）或者是十六进制（前缀是 0x ）。小数点两边必须有至少一个十进制数字（或者是十六进制的数字）。十进制浮点数也可以有一个可选的指数（exponent)，通过大写或者小写的 e 来指定；十六进制浮点数必须有一个指数，通过大写或者小写的 p 来指定

如果一个十进制数的指数为 `exp`，那这个数相当于基数和10^exp 的乘积：

- `1.25e2` 表示 1.25 × 10^2，等于 `125.0`。
- `1.25e-2` 表示 1.25 × 10^-2，等于 `0.0125`。

如果一个十六进制数的指数为 `exp`，那这个数相当于基数和2^exp 的乘积：

- `0xFp2` 表示 15 × 2^2，等于 `60.0`。
- `0xFp-2` 表示 15 × 2^-2，等于 `3.75`。

## 数值类型转换

不同类型的数字是无法直接进行数学运算的，因为不同类型的数字其表示的数据范围也是不一致的，因此很多时候我们在进行运算时要进行数字的类型转换。

### 整数类型转换

```swift
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
```

### 整数和浮点数转换

整数转换为浮点数

```swift
let integerPi = Int(pi)
// integerPi 等于 3，所以被推测为 Int 类型
```

浮点数转换为整数:

```swift
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
// pi 等于 3.14159，所以被推测为 Double 类型
```

## 类型别名

类型别名（type aliases）就是给现有类型定义另一个名字。你可以使用 typealias 关键字来定义类型别名。

```swift
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound 现在是 0
```

## 布尔值

Swift 有一个基本的布尔（Boolean）类型，叫做 Bool。布尔值指逻辑上的值，因为它们只能是真或者假。Swift 有两个布尔常量，true 和 false：

```swift
let orangesAreOrange = true
let turnipsAreDelicious = false
```

## 元组

元组（tuples）把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型。

```swift
// 创建一个元组
let http404Error = (404, "Not Found")
// http404Error 的类型是 (Int, String)，值是 (404, "Not Found")

// 解一个元组
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// 输出“The status code is 404”
print("The status message is \(statusMessage)")
// 输出“The status message is Not Found”
```

解一个元祖的方式还有其他两种

- 只需要获取元组中的部分值

    ```swift
    let (justTheStatusCode, _) = http404Error
    print("The status code is \(justTheStatusCode)")
    // 输出“The status code is 404”
    ```

- 通过下表获取元组的值

    ```swift
    print("The status code is \(http404Error.0)")
    // 输出“The status code is 404”
    print("The status message is \(http404Error.1)")
    // 输出“The status message is Not Found”
    ```

- 如果创建元组的时候定义了属性名，则可以通过属性名来访问

    ```swift
    print("The status code is \(http200Status.statusCode)")
    // 输出“The status code is 200”
    print("The status message is \(http200Status.description)")
    // 输出“The status message is OK”
    ```

注意：元组只适合比较简单的数据类型的组合，对于较多较复杂的类型，我们通常还是要用结构体或者类来定义。

## 可选类型

使用可选类型（optionals）来处理值可能缺失的情况。可选类型表示两种可能： 或者有值， 你可以解析可选类型访问这个值， 或者根本没有值。

Optionals即可选类型与OC中对象值可能为nil表示的意思一致，但是在OC中只有对象才有可能为nil，对于一些基本数据类型只能通过某些特殊值来表示返回结果，例如NSNotFound，这就意味着你要了解返回值代表的意思，并在使用的位置使用和添加判断。

```swift
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"
```

## nil

Swift中的nil和OC中是不一样的，在OC中nil表示一个空指针，而在Swift中nil表示任意类型的缺省值，任何类型都可以设置为nil。

```swift
var serverResponseCode: Int? = 404
// serverResponseCode 包含一个可选的 Int 值 404
serverResponseCode = nil
// serverResponseCode 现在不包含值

var surveyAnswer: String?
// surveyAnswer 被自动设置为 nil
```

如果你声明一个可选常量或者变量但是没有赋值，它们会自动被设置为 nil

## If语句和强制解析

在上面我们介绍了可选类型之后，要判断一个变量或者常量是否有值，我们可以通过if条件语句的形式进行判断

```swift
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
// 输出“convertedNumber contains some integer value.”
```

当满足我们的非空判断后，我们可以在条件语句内部执行强制解析，具体方法为使用!

```swift
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
// 输出“convertedNumber has an integer value of 123.”
```

注意：在使用强制解析之前，一定要确定该变量或者常量不为空，因为如果对一个为空的常量或者变量进行强制解析会导致运行时错误。

## 可选绑定

使用可选绑定（optional binding）来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。可选绑定可以用在 if 和 while 语句中，这条语句不仅可以用来判断可选类型中是否有值，同时可以将可选类型中的值赋给一个常量或者变量。

if或者while循环条件可以绑定一个或者多个条件

- 单个条件

    ```swift
    if let actualNumber = Int(possibleNumber) {
        print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
    } else {
        print("\'\(possibleNumber)\' could not be converted to an integer")
    }
    // 输出“'123' has an integer value of 123”
    ```

- 多个条件

    ```swift
    if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
        print("\(firstNumber) < \(secondNumber) < 100")
    }
    // 输出“4 < 42 < 100”

    if let firstNumber = Int("4") {
        if let secondNumber = Int("42") {
            if firstNumber < secondNumber && secondNumber < 100 {
                print("\(firstNumber) < \(secondNumber) < 100")
            }
        }
    }
    // 输出“4 < 42 < 100”
    ```

## 隐式解析可选类型

如上所述，可选类型暗示了常量或者变量可以“没有值”。可选可以通过 `if` 语句来判断是否有值，如果有值的话可以通过可选绑定来解析值。

有时候在程序架构中，第一次被赋值之后，可以确定一个可选类型*总会*有值。在这种情况下，每次都要判断和解析可选值是非常低效的，因为可以确定它总会有值。

这种类型的可选状态被定义为隐式解析可选类型（implicitly unwrapped optionals）。把想要用作可选的类型的后面的问号（`String?`）改成感叹号（`String!`）来声明一个隐式解析可选类型。与其在使用时把感叹号放在可选类型的名称的后面，你可以在定义它时，直接把感叹号放在可选类型的后面。

其实我们可以将隐式解析可选类型理解为:一个声明时就确定有值的常量或者变量，在将该变量或者常量复制给其他常量或者变量时通常需要解析(if/while),这实际时非常复杂的。我们可以通过在声明时就使用!表明他是隐式解析可选类型

```swift
let assumedString: String! = "An implicitly unwrapped optional string."
```

这样定义的话，后面我们再将常量赋值给其他常量或者变量时就不需要强制解析了

```swift
let implicitString: String = assumedString  // 不需要感叹号
```

这里要注意，我们如果在定义变量或者常量时未明确指出是否未可选类型，则默认可选类型

```swift
let optionalString = assumedString
// optionalString 的类型是 "String?"，assumedString 也没有被强制解析。
```

注意:如果一个变量之后可能变成 nil 的话请不要使用隐式解析可选类型。如果你需要在变量的生命周期中判断是否是 nil 的话，请使用普通可选类型。

## 错误处理

如果一个函数在声明时添加了throws关键字，则表示这个函数可能会抛出错误

```swift
func canThrowAnError() throws {
    // 这个函数有可能抛出错误
}
```

对于可能会抛出错误的方法，我们在调用时需要添加try关键词。

同时为了能够处理抛出的错误，我们需要使用do-catch捕捉抛出的错误

```swift
do {
    try canThrowAnError()
    // 没有错误消息抛出
} catch {
    // 有一个错误消息抛出
}
```

如果想严格的区分异常的类型，可以添加多个catch语句，分别处理不同类型的异常

```swift
func makeASandwich() throws {
    // ...
}

do {
    try makeASandwich()
		// 如果没有抛出异常后续代码才会被执行
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}
```

## 断言和先决条件

断言和先决条件是在运行时所做的检查。你可以用他们来检查在执行后续代码之前是否一个必要的条件已经被满足了。如果断言或者先决条件中的布尔条件评估的结果为 true（真），则代码像往常一样继续执行。如果布尔条件评估结果为 false（假），程序的当前状态是无效的，则代码执行结束，应用程序中止。

你使用断言和先决条件来表达你所做的假设和你在编码时候的期望。你可以将这些包含在你的代码中。断言帮助你在开发阶段找到错误和不正确的假设，先决条件帮助你在生产环境中探测到存在的问题。

断言和先决条件的不同点是，他们什么时候进行状态检测：断言仅在调试环境运行，而先决条件则在调试环境和生产环境中运行。在生产环境中，断言的条件将不会进行评估。这个意味着你可以使用很多断言在你的开发阶段，但是这些断言在生产环境中不会产生任何影响。

### 断言

```swift
let age = -3
assert(age >= 0, "A person's age cannot be less than zero")
// 因为 age < 0，所以断言会触发
```

### 先决条件

当一个条件可能为假，但是继续执行代码要求条件必须为真的时候，需要使用先决条件。例如使用先决条件来检查是否下标越界，或者来检查是否将一个正确的参数传给函数。

```swift
// 在一个下标的实现里...
precondition(index > 0, "Index must be greater than zero.")
```


