# 内置类型

## 变量命名要求与规范

- 以字母、下划线、Unicode 字符开始；
- 后续可以包括数字等；
- 以中缀操作符开头的变量名会被当作中缀操作符。

但是，我们应该注意这些规范：

- 变量为小写；
- 词间可以用下划线分开；
- 类和模块用大写；
- 函数和宏小写；
- 副作用函数以 `!` 结尾。

# 整数与浮点数

## 整数与浮点数的类型

- 整数类型：有符号和无符号的 8、16、32、64、128 位整数，以及布尔值；别名 `Int, UInt` 指向的是系统的位数；
- 浮点数类型：16、32、64 位。

## 整数字面值类型

- 有符号整数字面值：32 或 64 位系统，但是大整数只能是 64 位的；
- 无符号整数字面值：需要通过 16、8 或 2 进制指定，分别为 `0x, 0b, 0o`；如果首位为 0，则按位数指定大小，否则按实际大小指定大小。

## 整数溢出与除法的解决

当数据向上溢出时，通常将转化为最小值。

当除以 0 或最小值除以 -1 时，会报错。

## 浮点数字面值类型

- 双精度数：可以用浮点数或科学计数法；
- 单精度数：可以用 `f` 代替 `e`

浮点数之间可以用 `Float32()` 转换。

## 浮点数相关规范

- 存在两个零，它们相等但有不同的 `bitstring()` 函数
- 正负无穷和非数都有三个实现：
  - `Inf16, Inf32, Inf`：大于所有的有限浮点数；
  - `-Inf16, -Inf32, -Inf`：小于所有的有限浮点数；
  - `NaN16, NaN32, NaN`：不等于所有浮点数
- 正负无穷同时还是 `typemin(), typemax()` 的结果

## 数值字面值系数

字面值在变量前时，可以省略乘号。这种「隐式乘」运算的优先级要低于一元算符，高于二元算符，但与指数结合时则类似于一个一元算符。

数值字面值在括号前，也可以省略系数；括号内的表达式也可以看成是一个系数。

## 字面值零和一

`zero()` 和 `one()` 返回对应类型的零和一。

# 数学运算与初等函数

## 算术运算与位运算

特别的几个：

- $\div$ 表示整数除法；
- $\backslash$ 表示反除法；
- 异或；

所有算术运算与位运算都有对应的更新算符，但更新算符可能会改变变量类型。

## 向量化算符

对每个一元和二元算符，在前面加上点就得到了对数组的向量化算符。

```julia
[1,2,3] .^ 3
```

这种运算也可以用宏实现：`@.`。

点运算也可以用于自定义的算符。

## 数值比较

- 正零不大于负零；
- 正负无穷与自身相等；
- 非数不与任何数相等、小于或大于
- 额外的函数：
  - `isequal(x, y)`
  - `isfinite(x)`
  - `isinf(x)`
  - `isnan(x)`

这里 `isequal()` 使得非数也彼此相等。

## 数值转换

- `T(x)` 转换，如果无法用整数表示则产生错误；
- `x % T` 返回模 $2^n$ 同余的数；
- `round(Int, x)` 返回先取整再转换的值。

# 复数与浮点数

## 复数

复数可以用 `1 + 2im` 的形式指定，也可以用 `complex(a, b)` 的形式创建。

## 有理数

有理数用 `2//3` 的形式创建，并且可以转换为浮点数：

```julia
isequal(float(a//b), a/b)
```

# 字符与字符串

## 字符

`Char` 类型是一个 32 位的原生类型，可以通过编码值或者换为数字。

可以通过 `\u` 字符串来展示任何字符。

## 字符串

字符串的下标语法：`str[begin]`，`str[1]`。注意 `begin` 和 `end` 也可以当作数来运算。并不是每一个下标都合法，但我们可以通过迭代器来操作。字符串的常见运算：

- 连接：`string(a, b, ...)`
- 乘法：`a * b * c * ...`
- 传值：`$a`、`$(1+2)`
