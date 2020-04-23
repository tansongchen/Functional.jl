# 类型系统

Julia 中的类型分为抽象类型和具象类型，其中抽象类型是不可实例化的，而具象类型是可以实例化。类型之间构成了类型树，所有的具象类型都是树的叶节点，而所有的抽象类型都是树的非叶节点。

类型的类型是 `DataType`。

类型树：

- `Any`
  - `Number`
    - `Real`
      - `Integer`
        - `Signed`
        - `Unsigned`
      - `AbstractFloat`
  - `AbstractString`

抽象类型的声明：

```julia
abstract type $typeName end
abstract type $typeName <: $supertypeName end
```

# 具象类型

## 原始类型

**原始类型**：数据只包含特定数量的比特。

```julia
primitive type $typeName $typeBits end
primitive type $typeName <: $supertypeName $typeBits end
```

实例：
- `AbstractFloat` 抽象类型衍生了 `Float16, Float32, Float64`
- `Integer` 抽象类型衍生了 `Bool`
- `Signed` 抽象类型衍生了 `Int8 ~ Int128`
- `Unsigned` 抽象类型衍生了 `UInt8 ~ UInt128`
- `AbstractChar` 抽象类型衍生了 `Char`

## 复合类型

复合类型包含了一系列命名的域，每个域都是一个原始类型或复合类型。

声明方式：

```julia
struct Foo
    bar
    baz::Int
    qux::Float64
end
```

查看域：`fieldnames(Foo)`

访问域：`foo.bar`

复合类型是不可变的；如果可变，则要声明为 `mutable struct`。

不可变的、不含任何域的复合类型是单例类型。

### 构造函数

自带两个构造函数：

- 接受任何参数，并转换为类型
- 只接受对应的参数

## 类型并集

类型并集是一个抽象类型，它包括了所有的成员所能包括的对象。

# 参数化类型

## 以类型为参数的复合类型

```julia
struct Point{T}
    x::T
    y::T
end
```

这定义了无穷多可能的类型，例如 `Point{Float64}` 是一个具象类型。

参数复合类型本身也是一个类型，并且是所有参数化后的类型的基类：

```julia
Point{Float64} <: Point
```

函数定义

```julia
function norm(p::Point{<:Real})
    sqrt(p.x^2 + p.y^2)
end
```

## 参数类型的构造函数

1. 类型参数显明的给出
2. 通过参数动态确定

例如，

```julia
Point{Float64}(1.0, 2.0)
```

也可以用未参数化的形式

```julia
Point(1.0, 2.0)
```

## 参数抽象类型

```julia
abstract type Pointy{T} end
```

给定任意 T 的值，都会生成一个类型。同时它们也满足

```julia
Pointy{Float64} <: Pointy{<:Real}
```

我们可以定义一个参数复合类型作为它的具象化类型，也是子类型。

```julia
abstract type Pointy{T<:Real} end
```

例如，

```julia
struct Rational{T<:Integer} <: Real ... end
```

### 元组类型

元组类型实际上是一个元组的类型，它对应着一个任意多参数的参数复合类型。与其他不同的是，元组类型的参数是协变的，也即

```julia
Tuple{Int,AbstractString} <: Tuple{Real,Any}
```

元组类型的最后一个参数可以是 `Vararg` 类型，这表明元组的最后可以包含任何种类的数据。另外 `NTuple{N,T}` 是 `Tuple{Vararg{T,N}}` 的别名。

### 命名元组类型

命名元组有两个参数：第一个参数是符号元组，第二个参数是元组类型。

命名元组可以作为一个构造函数，构造时可以包括两个参数，也可以只包括符号元组的参数。

### 单实例类型

对于所有类型来说，`Type{T}` 是一个抽象类型，它唯一的实例是该类型。另外 `Type` 本身也是一个基类。

## 参数原始类型

原始类型也可以参数声明，例如指针依赖于类型：

```julia
primitive type Ptr{T} 64 end
```

在这里，类型参数只是一个标签，而不参与自身的定义。

## `UnionAll` 类型

参数类型的类型实际上是 `UnionAll`。所有的类型应用 `A{B,C}` 都要求 `A` 的类型是 `UnionAll`，并且我们可以部分地实例化它。

类型变量可以通过子类关系来限制。

## 类型操作

由于类型本身是对象，可以用操作来处理它们。

```julia
isa(1, Int)
typeof(Rational)
supertype(Number)
```

所有的类型的类型都是 `DataType`，它是自身的类型。

所有的类型的基类都是 `Any`。

## 值类

我们不能根据对象是什么来派发，但我们可以将纯比特数据（通过参数）封装成一个类型，因而使用。例如，我们定义两个函数：

```julia
firstlast(::Val{true}) = "First"
firstlast(::Val{false}) = "Last
```

