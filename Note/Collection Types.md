# Collection Types

集合类型，在Swift中集合类型主要有：数组(Array)、集合(Set)、字典(Dictionary)三种基本的集合类型。

数组是有序的数据集，集合是无序的数据集、字典是无序的键值对集

![https://tva1.sinaimg.cn/large/008i3skNgy1gs4mdu2rj9j31180d7tb3.jpg](https://tva1.sinaimg.cn/large/008i3skNgy1gs4mdu2rj9j31180d7tb3.jpg)

在上述的集合类型都必须明确保存的键值类型，这样可以避免插入错误的类型，同时也可以保证从集合中取出的类型也是正确的。

Swift的数组、集合、字典类型被实现为泛型集合。关于泛型后续会介绍。

## 集合的可变性

不同于OC中通过区分可变类型和不可变类型，在Swift中如果我们将集合赋值给一个可变的变量那么这个集合就是可变的，如果将集合赋值给一个不可变类型，则集合是不可变的。

## 数组

数组使用有序列表存储同一类型的多个值，相同的值可以在一个数组中出现多次。

数组的定义和初始化有两种写法

```swift
var arr = Array<String>()
var arr2:[String] = []
```

### 创建一个空数组

```swift
var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")
// 打印“someInts is of type [Int] with 0 items.”
```

如果代码上下文中已经提供了类型的信息，就可以使用空数组语句创建一个空数组

```swift
someInts.append(3)
// someInts 现在包含一个 Int 值
someInts = []
// someInts 现在是空数组，但是仍然是 [Int] 类型的。
```

### 创建一个带有默认值的空数组

```swift
var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles 是一种 [Double] 数组，等价于 [0.0, 0.0, 0.0]
```

### 通过两个数组相加创建一个数组

在介绍字符串方法时，我们知道可以使用+来连接两个字符串，这种方式对于数组来说同样适用，但是务必保证数组中元素的类型相同

```swift
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles 被推断为 [Double]，等价于 [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles 被推断为 [Double]，等价于 [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
```

### 用数组字面量构造数组

```swift
var shoppingList: [String] = ["Eggs", "Milk"]
// shoppingList 已经被构造并且拥有两个初始项。
```

对于上面这种写法，我们在上面也介绍到，实际上可以简写

```swift
var shoppingList = ["Eggs", "Milk"]
```

### 访问和修改数组

- 获取数组元素个数

    ```swift
    print("The shopping list contains \(shoppingList.count) items.")
    // 输出“The shopping list contains 2 items.”（这个数组有2个项）
    ```

- 判断数组是否为空

    ```swift
    if shoppingList.isEmpty {
        print("The shopping list is empty.")
    } else {
        print("The shopping list is not empty.")
    }
    // 打印“The shopping list is not empty.”（shoppinglist 不是空的）
    ```

- 数组添加元素

    ```swift
    shoppingList.append("Flour")
    // shoppingList 现在有3个数据项，似乎有人在摊煎饼
    ```

    同样我们可以通过+或者+=来拼接数组

    ```swift
    shoppingList += ["Baking Powder"]
    // shoppingList 现在有四项了
    shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
    // shoppingList 现在有七项了
    ```

- 获取数组中的元素

    ```swift
    var firstItem = shoppingList[0]
    // 第一项是“Eggs”
    ```

- 修改数组中的元素

    ```swift
    shoppingList[0] = "Six eggs"
    // 其中的第一项现在是“Six eggs”而不是“Eggs”
    ```

    在通过下标来修改数组时，我们必须保证提供的下标是有效的。我们不仅可以利用下标改变数组中某一个元素的值，还可以改变一个范围内元素的值

    ```swift
    shoppingList[4...6] = ["Bananas", "Apples"]
    // shoppingList 现在有6项
    ```

    在修改某个范围内的值时，即使提供的范围与赋值的数组个数不一样也是没有问题的。

- 向数组中插入元素insert(_:at:)

    ```swift
    shoppingList.insert("Maple Syrup", at: 0)
    // shoppingList 现在有7项
    // 现在是这个列表中的第一项是“Maple Syrup”
    ```

- 删除数组中的元素 remove(at:)

    ```swift
    let mapleSyrup = shoppingList.remove(at: 0)
    // 索引值为0的数据项被移除
    // shoppingList 现在只有6项，而且不包括 Maple Syrup
    // mapleSyrup 常量的值等于被移除数据项“Maple Syrup”
    ```

    注意对于数组中所有通过下标操作的方法，都必须保证下标的合法，因此在使用索引前都必须校验其有效性，否则会引发运行时错误。

    如果我们只是想移除数组中的最后一项，我们可以使用removeLast()

    ```swift
    let apples = shoppingList.removeLast()
    // 数组的最后一项被移除了
    // shoppingList 现在只有5项，不包括 Apples
    // apples 常量的值现在等于字符串“Apples”
    ```

    ### 数组的变量

    我们可以直接通过for-in来遍历数组中的元素

    ```swift
    for item in shoppingList {
        print(item)
    }
    // Six eggs
    // Milk
    // Flour
    // Baking Powder
    // Bananas
    ```

    我们还可以他调用数组的enumerated()方法来遍历数组,这时我们可以同时获取到数组的每个数据项和索引值

    ```swift
    for (index, value) in shoppingList.enumerated() {
        print("Item \(String(index + 1)): \(value)")
    }
    // Item 1: Six eggs
    // Item 2: Milk
    // Item 3: Flour
    // Item 4: Baking Powder
    // Item 5: Bananas
    ```

    ## 集合

    集合用来存储相同类型并且没有确定顺序的值，当集合元素顺序不重要或者希望确保每个元素只出现一次时可以使用集合而不是数组。

    ### 集合类型的哈希值

    一个类型为了存储在集合中，该类型必须是可哈希化的——也就是说，该类型必须提供一个方法来计算它的哈希值。一个哈希值是 Int 类型的，相等的对象哈希值必须相同，比如 a == b,因此必须 a.hashValue == b.hashValue。

    你可以使用自定义的类型作为集合值的类型或者是字典键的类型，但需要使自定义类型遵循 Swift 标准库中的 `Hashable` 协议。遵循 `Hashable` 协议的类型需要提供一个类型为 `Int` 的可读属性 `hashValue`。由类型的 `hashValue` 属性返回的值不需要在同一程序的不同执行周期或者不同程序之间保持相同。

    因为 `Hashable` 协议遵循 `Equatable` 协议，所以遵循该协议的类型也必须提供一个“是否相等”运算符（`==`）的实现。这个 `Equatable` 协议要求任何遵循 `==` 实现的实例间都是一种相等的关系。也就是说，对于 `a,b,c` 三个值来说，`==` 的实现必须满足下面三种情况：

    - `a == a`(自反性)
    - `a == b` 意味着 `b == a`(对称性)
    - `a == b && b == c` 意味着 `a == c`(传递性)

    自反性、对称性、传递性 是等价关系的三个条件

    ### 集合的创建和初始化

    ```swift
    var letters = Set<Character>()
    print("letters is of type Set<Character> with \(letters.count) items.")
    // 打印“letters is of type Set<Character> with 0 items.”
    ```

    此外，如果上下文提供了类型信息，比如作为函数的参数或者已知类型的变量或者常量，可以通过一个空数组来创建一个空集合。

    ```swift
    letters.insert("a")
    // letters 现在含有1个 Character 类型的值
    letters = []
    // letters 现在是一个空的 Set，但是它依然是 Set<Character> 类型
    ```

    ### 用数组字面量来创建集合

    ```swift
    var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
    // favoriteGenres 被构造成含有三个初始值的集合
    ```

    一个集合类型不能从数组字面量中被直接推断出来，因此 Set 类型必须显式声明。然而，由于 Swift 的类型推断功能，如果你想使用一个数组字面量构造一个集合并且与该数组字面量中的所有元素类型相同，那么无须写出集合的具体类型。favoriteGenres 的构造形式可以采用简化的方式代替：

    ```swift
    var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
    ```

    ### 访问和修改一个集合

    - 获取集合中元素个数

        ```swift
        print("I have \(favoriteGenres.count) favorite music genres.")
        // 打印“I have 3 favorite music genres.”
        ```

    - 判断集合是否为空

        ```swift
        if favoriteGenres.isEmpty {
            print("As far as music goes, I'm not picky.")
        } else {
            print("I have particular music preferences.")
        }
        // 打印“I have particular music preferences.”
        ```

    - 集合中插入新元素

        ```swift
        favoriteGenres.insert("Jazz")
        // favoriteGenres 现在包含4个元素
        ```

    - 删除集合中一个元素

        ```swift
        if let removedGenre = favoriteGenres.remove("Rock") {
            print("\(removedGenre)? I'm over it.")
        } else {
            print("I never much cared for that.")
        }
        // 打印“Rock? I'm over it.”
        ```

    - 删除集合中所有元素

        ```swift
        favoriteGenres.removeAll()
        ```

    - 判断集合中是否包含某个元素

        ```swift
        if favoriteGenres.contains("Funk") {
            print("I get up on the good foot.")
        } else {
            print("It's too funky in here.")
        }
        // 打印“It's too funky in here.”
        ```

    ### 遍历一个集合

    我们可以使用for-in遍历一个集合

    ```swift
    for genre in favoriteGenres {
        print("\(genre)")
    }
    // Classical
    // Jazz
    // Hip hop
    ```

    由于集合是无序的，如果我们要按照某种顺序来遍历集合时我们可以用到sort()方法，他将返回一个有序数组

    ```swift
    for genre in favoriteGenres.sorted() {
        print("\(genre)")
    }
    // Classical
    // Hip hop
    // Jazz
    ```

    ### 集合操作

    集合操作有一下几种:

    - 使用 `intersection(_:)` 方法根据两个集合的交集创建一个新的集合。
    - 使用 `symmetricDifference(_:)` 方法根据两个集合不相交的值创建一个新的集合。
    - 使用 `union(_:)` 方法根据两个集合的所有值创建一个新的集合。
    - 使用 `subtracting(_:)` 方法根据不在另一个集合中的值创建一个新的集合。

    ![https://tva1.sinaimg.cn/large/008i3skNgy1gs4nwqjjzwj30v60nn40b.jpg](https://tva1.sinaimg.cn/large/008i3skNgy1gs4nwqjjzwj30v60nn40b.jpg)

    ```swift
    let oddDigits: Set = [1, 3, 5, 7, 9]
    let evenDigits: Set = [0, 2, 4, 6, 8]
    let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

    oddDigits.union(evenDigits).sorted()
    // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    oddDigits.intersection(evenDigits).sorted()
    // []
    oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
    // [1, 9]
    oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
    // [1, 2, 9]
    ```

    ### 集合成员关系和相等

    下面的插图描述了三个集合 a、b 和 c，以及通过重叠区域表述集合间共享的元素。集合 a 是集合 b 的父集合，因为 a 包含了 b 中所有的元素。相反的，集合 b 是集合 a 的子集合，因为属于 b 的元素也被 a 包含。集合 b 和集合 c 是不相交的，因为它们之间没有共同的元素。

    ![https://tva1.sinaimg.cn/large/008i3skNgy1gs4nz8z3buj30un0hzgmc.jpg](https://tva1.sinaimg.cn/large/008i3skNgy1gs4nz8z3buj30un0hzgmc.jpg)

    - 使用“是否相等”运算符（`==`）来判断两个集合包含的值是否全部相同。
    - 使用 `isSubset(of:)` 方法来判断一个集合中的所有值是否也被包含在另外一个集合中。
    - 使用 `isSuperset(of:)` 方法来判断一个集合是否包含另一个集合中所有的值。
    - 使用 `isStrictSubset(of:)` 或者 `isStrictSuperset(of:)` 方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
    - 使用 `isDisjoint(with:)` 方法来判断两个集合是否不含有相同的值（是否没有交集）。

    ```swift
    let houseAnimals: Set = ["🐶", "🐱"]
    let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
    let cityAnimals: Set = ["🐦", "🐭"]

    houseAnimals.isSubset(of: farmAnimals)
    // true
    farmAnimals.isSuperset(of: houseAnimals)
    // true
    farmAnimals.isDisjoint(with: cityAnimals)
    // true
    ```

    ## 字典

    字典是一种无序集合，它存储的是键值对之间的关系，其所有键值对之间的关系，其所有键的值需要是相同的类型，所有值的类型也需要相同。每个值(Value)都关联唯一的键(Key),键作为字典中这个值数据的标识符。

    ### 字典类型简化语法

    Swift的字典使用Dictionary<Key,Value>定义，其中Key是一种可以再字典中被用作键的类型，Value是字典中对应于这些键所存储值的数据类型。

    注意：一个字典的Key类型必须遵循Hashable协议，就像Set的值类型

    ### 创建一个空字典

    ```swift
    var namesOfIntegers: [Int: String] = [:]
    // namesOfIntegers 是一个空的 [Int: String] 字典
    ```

    如果上下文已经提供了信息，我们可以将上面的代码简写为:

    ```swift
    namesOfIntegers[16] = "sixteen"
    // namesOfIntegers 现在包含一个键值对
    namesOfIntegers = [:]
    // namesOfIntegers 又成为了一个 [Int: String] 类型的空字典
    ```

    ### 用字典字面量创建字典

    ```swift
    [key 1: value 1, key 2: value 2, key 3: value 3]
    var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    ```

    假如我们在构造字典时，如果他的键值都有各自一致的类型，那么就不必写出字典的类型

    ```swift
    var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    ```

    ### 修改和访问字典

    - 获取字典键值对个数

        ```swift
        print("The dictionary of airports contains \(airports.count) items.")
        // 打印“The dictionary of airports contains 2 items.”（这个字典有两个数据项）
        ```

    - 判断字典是否为空

        ```swift
        if airports.isEmpty {
            print("The airports dictionary is empty.")
        } else {
            print("The airports dictionary is not empty.")
        }
        // 打印“The airports dictionary is not empty.”
        ```

    - 添加或者修改字典中的键值对

        ```swift
        airports["LHR"] = "London"
        // airports 字典现在有三个数据项
        ```

    - 修改字典中的数据

        ```swift
        if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
            print("The old value for DUB was \(oldValue).")
        }
        // 输出“The old value for DUB was Dublin.”
        ```

        字典的 updateValue(*:forKey:) 方法可以设置或者更新特定键对应的值。就像上面所示的下标示例，updateValue(*:forKey:) 方法在这个键不存在对应值的时候会设置新值或者在存在时更新已存在的值。和下标的方式不同，updateValue(_:forKey:) 这个方法返回更新值之前的原值。这样使得你可以检查更新是否成功。

        updateValue(_:forKey:) 方法会返回对应值类型的可选类型

        同样根据下标语法通过键键获取字典中对应的值时返回的也是一个可选类型，如果键对应的值存在则返回对应的值，否则返回nil

        ```swift
        if let airportName = airports["DUB"] {
            print("The name of the airport is \(airportName).")
        } else {
            print("That airport is not in the airports dictionary.")
        }
        // 打印“The name of the airport is Dublin Airport.”
        ```

    - 移除字典中的某个键值对

        第一种方法我们可以通过下标的方法将某个键对应的值置为nil

        ```swift
        airports["APL"] = "Apple Internation"
        // “Apple Internation”不是真的 APL 机场，删除它
        airports["APL"] = nil
        // APL 现在被移除了
        ```

        另外一种方式是通过remove方法移除键值对

        ```swift
        if let removedValue = airports.removeValue(forKey: "DUB") {
            print("The removed airport's name is \(removedValue).")
        } else {
            print("The airports dictionary does not contain a value for DUB.")
        }
        // 打印“The removed airport's name is Dublin Airport.”
        ```

        remove方法的返回值，当键值对存在时返回要删除键值对的值，当键值对不存在时返回nil

        ### 字典的遍历

        同数组和集合一样，我们可以通过for-in的方式遍历字典

        ```swift
        for (airportCode, airportName) in airports {
            print("\(airportCode): \(airportName)")
        }
        // YYZ: Toronto Pearson
        // LHR: London Heathrow
        ```

        通过访问keys和values也可以遍历字典

        ```swift
        for airportCode in airports.keys {
            print("Airport code: \(airportCode)")
        }
        // Airport code: YYZ
        // Airport code: LHR

        for airportName in airports.values {
            print("Airport name: \(airportName)")
        }
        // Airport name: Toronto Pearson
        // Airport name: London Heathrow
        ```

        字典的键和值都可以看做一个数组

        ```swift
        let airportCodes = [String](airports.keys)
        // airportCodes 是 ["YYZ", "LHR"]

        let airportNames = [String](airports.values)
        // airportNames 是 ["Toronto Pearson", "London Heathrow"]
        ```

        字典是无序集合类型，为了以特定的顺序遍历字典的键或值，可以对字典的keys或values属性使用sorted()方法。



