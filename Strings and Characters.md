# Strings and Characters

Swift中的字符(Character)和字符串(String)，并没有像OC中有可变和不可变的区分，只是要看你将字符串或者字符定义为变量还是常量。

## 字符串字面量

字符串就是使用双引号包裹的具有固定顺序的字符集，可以为常量或者变量提供初始值。

```swift
let someString = "Some string literal value"
```

### 多行字符串字面量

一对三个双引号包裹着的具有固定顺序的文本字符集

```swift
let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
```

在多行字符串中，如果使用了换行，那么打印出的实际的字符串中也是包含换行符的，那么如果你想在多行换行符中换行但是却不希望输出时也换行，则可以使用续行符(\)

```swift
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
```

对于多行字符串需要注意，在多行字符串中，关闭引号之前的空串是用来告诉Swift编译器，其他各行有多少空白字符串需要忽略。因此如果在某行的前面空白字符串超出了关闭引号之前的空白字符串，则超出部分将被包含在多行字符串字面量中。

```swift
let strWithConnection = """
    this line is begain
            this is the content
        this line is end
    """
    print(strWithConnection)

// 输出结果
this line is begain
        this is the content
    this line is end
```

通过验证我们发现实际打印结果与多行字符串输入样式相同，在文档中只是介绍到如果超出关闭引号之前的空白字符串，那么空白字符串将会被包含，那么如果少于关闭引号的空白字符串呢？这里经过验证我们发现实际上并没有任何影响。

### 字符串字面量的特殊字符

- 转义字符 `\0`(空字符)、`\\`(反斜线)、`\t`(水平制表符)、`\n`(换行符)、`\r`(回车符)、`\"`(双引号)、`\'`(单引号)。
- Unicode 标量，写成 `\u{n}`(u 为小写)，其中 `n` 为任意一到八位十六进制数且可用的 Unicode 位码。

```swift
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imageination is more important than knowledge" - Enistein
let dollarSign = "\u{24}"             // $，Unicode 标量 U+0024
let blackHeart = "\u{2665}"           // ♥，Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"      // 💖，Unicode 标量 U+1F496
```

### 扩展字符串分隔符

可以通过使用扩展字符串分隔符将字符串包起来，这样字符串中的特殊字符将会直接被包含而非转以后的效果。

```swift
let normalString = "Line 1\nLine 2"
let extendString = #"Line 1\nLine 2"#

print(normalString, extendString)
// 输出结果
Line 1
Line 2
Line 1\nLine 2
```

 同样对于多行字符串扩展字符串分隔符同样适用。

## 初始化空字符串

```swift
var emptyString = ""               // 空字符串字面量
var anotherEmptyString = String()  // 初始化方法
// 两个字符串均为空并等价。
```

### 判断字符串是否为空

```swift
if emptyString.isEmpty {
    print("Nothing to see here")
}
// 打印输出：“Nothing to see here”
```

## 可变字符串

在Swift中，我们通过将字符串赋值给一个变量或者常量来区分字符串是否可变，而非像OC一样选择不同类型的对象来区分

```swift
var variableString = "Horse"
variableString += " and carriage"
// variableString 现在为 "Horse and carriage"

let constantString = "Highlander"
constantString += " and another Highlander"
// 这会报告一个编译错误（compile-time error） - 常量字符串不可以被修改。
```

## 字符串是值类型

在 Swift 中 `String` 类型是*值类型*。如果你创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时，会进行值拷贝。在前述任一情况下，都会对已有字符串值创建新副本，并对该新副本而非原始字符串进行传递或赋值操作。

Swift 默认拷贝字符串的行为保证了在函数/方法向你传递的字符串所属权属于你，无论该值来自于哪里。你可以确信传递的字符串不会被修改，除非你自己去修改它。

在实际编译时，Swift 编译器会优化字符串的使用，使实际的复制只发生在绝对必要的情况下，这意味着你将字符串作为值类型的同时可以获得极高的性能。

## 使用字符

### 获取字符串中的字符

我们可以通过遍历字符串的方式来获取字符串中的所有字符

```swift
for character in "Dog!🐶" {
    print(character)
}
// D
// o
// g
// !
// 🐶
```

### 将字符数组转换为字符串

我们可以通过直接强转的方式将字符数组转换为字符串

```swift
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// 打印输出：“Cat!🐱”
```

## 字符串和字符的连接

之前介绍基本运算符+的时候我们提到：直接使用+号运算符就可以将两个字符串进行连接

```swift
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome 现在等于 "hello there"

var instruction = "look over"
instruction += string2
// instruction 现在等于 "look over there"
```

同时我们也可以通过字符串的方法进行append方法进行连接

```swift
let exclamationMark: Character = "!"
welcome.append(exclamationMark)
// welcome 现在等于 "hello there!"
```

但是我们不能将一个字符串或者字符添加到一个字符变量上，因为字符变量只可以包含一个字符

![https://tva1.sinaimg.cn/large/008i3skNgy1gs3xsy3z9wj30js05vwf9.jpg](https://tva1.sinaimg.cn/large/008i3skNgy1gs3xsy3z9wj30js05vwf9.jpg)

## 字符串插值

我们在拼接字符串的时候，有时候希望将一些变量拼接到字符串中，例如

```swift
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message 是 "3 times 2.5 is 7.5"
```

同样对于扩展字符串分隔符#，字符串中插入的变量依然也是不生效的

```swift
print(#"Write an interpolated string in Swift using \(multiplier)."#)
// 打印 "Write an interpolated string in Swift using \(multiplier)."
```

假设我们希望使用扩展字符串分隔符的同时可以插入变量则我们需要加入转义字符

```swift
print(#"6 times 7 is \#(6 * 7)."#)
// 打印 "6 times 7 is 42."
```

## Unicode

Unicode是一个用于在不同书写系统中对文本进行编码、表示和处理的国际标准。它使你可以用标准格式表示来自任意语言几乎所有的字符，并能够对文本文件或网页这样的外部资源中的字符进行读写操作。Swift 的 String 和 Character 类型是完全兼容 Unicode 标准的。

```swift
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e 后面加上  ́
// eAcute 是 é, combinedEAcute 是 é

let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed 是 한, decomposed 是 한

let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute 是 é⃝
```

## 计算字符数量

获取一个字符串的长度可以使用count属性

```swift
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// 打印输出“unusualMenagerie has 40 characters”
```

*注意在 Swift 中，使用可拓展的字符群集作为 Character 值来连接或改变字符串时，并不一定会更改字符串的字符数量。*

```swift
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// 打印输出“the number of characters in cafe is 4”

word += "\u{301}"    // 拼接一个重音，U+0301

print("the number of characters in \(word) is \(word.count)")
// 打印输出“the number of characters in café is 4”
```

注意:

> 可扩展的字形群可以由多个 Unicode 标量组成。这意味着不同的字符以及相同字符的不同表示方式可能需要不同数量的内存空间来存储。所以 Swift 中的字符在一个字符串中并不一定占用相同的内存空间数量。因此在没有获取字符串的可扩展的字符群的范围时候，就不能计算出字符串的字符数量。如果你正在处理一个长字符串，需要注意 count 属性必须遍历全部的 Unicode 标量，来确定字符串的字符数量。另外需要注意的是通过 count 属性返回的字符数量并不总是与包含相同字符的 NSString 的 length 属性相同。NSString 的 length 属性是利用 UTF-16 表示的十六位代码单元数字，而不是 Unicode 可扩展的字符群集。

## 访问和修改字符串

### 字符串索引

每一个 String 值都有一个关联的索引（index）类型，String.Index，它对应着字符串中的每一个 Character 的位置。

下面介绍几种通过索引访问字符串的方法

**index(before:)** 获取指定index前面的字符

**index(after:)** 获取指定index后面的字符

**index(_:offsetBy:)** 获取对应偏移量的索引对应的字符

```swift
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a
```

在使用下标获取字符串指定index字符时如果出现了越界的问题，则会有一个运行时错误

![https://tva1.sinaimg.cn/large/008i3skNgy1gs3ym745b7j30qu04e753.jpg](https://tva1.sinaimg.cn/large/008i3skNgy1gs3ym745b7j30qu04e753.jpg)

另外字符串还提供了一个方法indices，包含全部索引的范围（Range），用来在一个字符串中访问单个字符。

```swift
for index in greeting.indices {
   print("\(greeting[index]) ", terminator: "")
}
// 打印输出“G u t e n   T a g ! ”
```

## 拆入和删除

insert(_:at:) 在一个字符串的指定索引插入一个字符

insert(contentsOf:at:)在一个字符串的指定索引插入一个段字符串 

```swift
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome 变量现在等于 "hello!"

welcome.insert(contentsOf:" there", at: welcome.index(before: welcome.endIndex))
// welcome 变量现在等于 "hello there!"
```

remove(at:)在一个字符串的指定索引删除一个字符

removeSubrange(_:)在一个字符串的指定索引删除一个子字符串

```swift
welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome 现在等于 "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome 现在等于 "hello"
```

## 子字符串

当你从字符串中获取一个子字符串 —— 例如，使用下标或者 prefix(_:) 之类的方法 —— 就可以得到一个 Substring 的实例，而非另外一个 String。

然而，跟 String 不同的是，你只有在短时间内需要操作字符串时，才会使用 Substring。当你需要长时间保存结果时，就把 Substring 转化为 String 的实例：

```swift
let greeting = "Hello, world!"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]
// beginning 的值为 "Hello"

// 把结果转化为 String 以便长期存储。
let newString = String(beginning)
```

String 和 Substring 的区别在于性能优化上，Substring 可以重用原 String 的内存空间，或者另一个 Substring 的内存空间（String 也有同样的优化，但如果两个 String 共享内存的话，它们就会相等）。这一优化意味着你在修改 String 和 Substring 之前都不需要消耗性能去复制内存。就像前面说的那样，Substring 不适合长期存储 —— 因为它重用了原 String 的内存空间，原 String 的内存空间必须保留直到它的 Substring 不再被使用为止。

## 比较字符串

Swift 提供了三种方式来比较文本值：**字符串字符相等、前缀相等和后缀相等。**

```swift
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}
// 打印输出“These two strings are considered equal”
```

字符串相等标准:

如果两个字符串（或者两个字符）的可扩展的字形群集是标准相等，那就认为它们是相等的。只要可扩展的字形群集有同样的语言意义和外观则认为它们标准相等，即使它们是由不同的 Unicode 标量构成。

```swift
// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// 打印输出“These two strings are considered equal”
```

相反，英语中的 LATIN CAPITAL LETTER A(U+0041，或者 A)不等于俄语中的 CYRILLIC CAPITAL LETTER A(U+0410，或者 A)。两个字符看着是一样的，但却有不同的语言意义：

```swift
let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}
// 打印“These two characters are not equivalent”
```

### 前缀/后缀相等

通过调用字符串的 hasPrefix(*:)/hasSuffix(*:) 方法来检查字符串是否拥有特定前缀/后缀，两个方法均接收一个 String 类型的参数，并返回一个布尔值。

```swift
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// 打印输出“There are 5 scenes in Act 1”

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// 打印输出“6 mansion scenes; 2 cell scenes”
```



