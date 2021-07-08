# Enumerations

枚举为一组相关的值定义了一个共同的类型，使你可以在你的代码中以类型安全的方式来使用这些值。

如果你熟悉 C 语言，你会知道在 C 语言中，枚举会为一组整型值分配相关联的名称。Swift 中的枚举更加灵活，不必给每一个枚举成员提供一个值。如果给枚举成员提供一个值（称为原始值），则该值的类型可以是字符串、字符，或是一个整型值或浮点数。

在 Swift 中，枚举类型是一等（first-class）类型。它们采用了很多在传统上只被类（class）所支持的特性，例如计算属性（computed properties），用于提供枚举值的附加信息，实例方法（instance methods），用于提供和枚举值相关联的功能。枚举也可以定义构造函数（initializers）来提供一个初始值；可以在原始实现的基础上扩展它们的功能；还可以遵循协议（protocols）来提供标准的功能。

## 枚举语法

```swift
enum SomeEnumeration {
    // 枚举定义放在这里
}
```

例如

```swift
enum CompassPoint {
    case north
    case south
    case east
    case west
}
// 多个成员值可以出现在同一行上，用逗号隔开：
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
```

注意

与 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的 `CompassPoint` 例子中，`north`，`south`，`east` 和 `west` 不会被隐式地赋值为 `0`，`1`，`2` 和 `3`。相反，这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的 `CompassPoint` 类型。

枚举的使用:

```swift
var directionToHead = CompassPoint.west
// CompassPoint 的某个值初始化时推断出来
directionToHead = .east
```

## 使用 Switch 语句匹配枚举值

```swift
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
// 打印“Watch out for penguins”
```

在判断一个枚举类型的值时，switch 语句必须穷举所有情况。如果忽略了 .west 这种情况，上面那段代码将无法通过编译，因为它没有考虑到 CompassPoint 的全部成员。强制穷举确保了枚举成员不会被意外遗漏。

当不需要匹配每个枚举成员的时候，你可以提供一个 default 分支来涵盖所有未明确处理的枚举成员：

```swift
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
// 打印“Mostly harmless”
```

## 枚举成员的遍历

在一些情况下，你会需要得到一个包含枚举所有成员的集合。

令枚举遵循 CaseIterable 协议。Swift 会生成一个 allCases 属性，用于表示一个包含枚举所有成员的集合。

```swift
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// 打印“3 beverages available”
```

在前面的例子中，通过 Beverage.allCases 可以访问到包含 Beverage 枚举所有成员的集合。

```swift
for beverage in Beverage.allCases {
    print(beverage)
}
// coffee
// tea
// juice
```

## 关联值

枚举语法那一小节的例子演示了如何定义和分类枚举的成员。你可以为 `Planet.earth` 设置一个常量或者变量，并在赋值之后查看这个值。然而，有时候把其他类型的值和成员值一起存储起来会很有用。这额外的信息称为*关联值*，并且你每次在代码中使用该枚举成员时，还可以修改这个关联值。

你可以定义 Swift 枚举来存储任意类型的关联值，如果需要的话，每个枚举成员的关联值类型可以各不相同。枚举的这种特性跟其他语言中的可识别联合（discriminated unions），标签联合（tagged unions），或者变体（variants）相似。

例如，假设一个库存跟踪系统需要利用两种不同类型的条形码来跟踪商品。有些商品上标有使用 0 到 9 的数字的 UPC 格式的一维条形码。每一个条形码都有一个代表数字系统的数字，该数字后接五位代表厂商代码的数字，接下来是五位代表“产品代码”的数字。最后一个数字是检查位，用来验证代码是否被正确扫描：

![https://tva1.sinaimg.cn/large/008i3skNgy1gs9y29tx4fj30e006oq3f.jpg](https://tva1.sinaimg.cn/large/008i3skNgy1gs9y29tx4fj30e006oq3f.jpg)

其他商品上标有 QR 码格式的二维码，它可以使用任何 ISO 8859-1 字符，并且可以编码一个最多拥有 2,953 个字符的字符串：

![https://tva1.sinaimg.cn/large/008i3skNgy1gs9y2morhuj309f09fgly.jpg](https://tva1.sinaimg.cn/large/008i3skNgy1gs9y2morhuj309f09fgly.jpg)

这便于库存跟踪系统用包含四个整型值的元组存储 UPC 码，以及用任意长度的字符串储存 QR 码。

在 Swift 中，使用如下方式定义表示两种商品条形码的枚举：

```swift
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
```

以上代码可以这么理解：

“定义一个名为 `Barcode` 的枚举类型，它的一个成员值是具有 `(Int，Int，Int，Int)` 类型关联值的 `upc`，另一个成员值是具有 `String` 类型关联值的 `qrCode`。”

这个定义不提供任何 `Int` 或 `String` 类型的关联值，它只是定义了，当 `Barcode` 常量和变量等于 `Barcode.upc` 或 `Barcode.qrCode` 时，可以存储的关联值的类型。

然后你可以使用任意一种条形码类型创建新的条形码，例如：

```swift
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP") // 替换
```

Barcode 类型的常量和变量可以存储一个 .upc 或者一个 .qrCode（连同它们的关联值），但是在同一时间只能存储这两个值中的一个。

你可以使用一个 switch 语句来检查不同的条形码类型，和之前使用 Switch 语句来匹配枚举值的例子一样。然而，这一次，关联值可以被提取出来作为 switch 语句的一部分。你可以在 switch 的 case 分支代码中提取每个关联值作为一个常量（用 let 前缀）或者作为一个变量（用 var 前缀）来使用：

```swift
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// 打印“QR code: ABCDEFGHIJKLMNOP.”
```

如果一个枚举成员的所有关联值都被提取为常量，或者都被提取为变量，为了简洁，你可以只在成员名称前标注一个 let 或者 var：

```swift
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
// 打印“QR code: ABCDEFGHIJKLMNOP.”
```

## 原始值

在 [关联值](notion://www.notion.so/swift/swift-jiao-cheng/08_enumerations#associated-values) 小节的条形码例子中，演示了如何声明存储不同类型关联值的枚举成员。作为关联值的替代选择，枚举成员可以被默认值（称为*原始值*）预填充，这些原始值的类型必须相同。

这是一个使用 ASCII 码作为原始值的枚举：

```swift
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
```


