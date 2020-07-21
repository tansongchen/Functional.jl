# 函数与方法

## 函数声明

```julia
function f(x, y)
end
```

也可以用赋值式声明：`f(x, y) = x + y`。

函数的返回值可以显式声明，也可以用 `return` 声明。可以使用 `return nothing`。

## 匿名函数

函数是一等公民，所以可以用如下的方法赋值：

```julia
x -> x^2 + 2x - 1
```

这些函数通常传给泛函。

## 元组与多返回值函数

元组是多个对象的序列，不可变；可以创建元组。函数返回多值时，是作为元组返回，同时可以进行解构赋值。

## 阵列字面值

我们可以通过中括号来创建阵列字面值：`[A, B, C, ...]`，其中元素类型由它们自动决定：

- 如果元素都属于同一类型，就是这个类型；
- 如果元素有共同的提升类型，则为提升类型；
- 类型为 `Any`。

## 阵列字面值的纵向连接

如果方括号内的元素由分号或者新行连接，那么它们会被认为是元素的集合，而非自身；如果由制表符或空格连接，则会被认为是创建了新的列。实例：

```julia
[1:2; 4:5] # 4 × 1
[1:2 4:5] # 2 × 2
[1 2 3] # 1 × 3
[1 2; 3 4] # 2 × 2
```

这些只不过是一个函数的别名：

- `cat`：在任意维度上组合；
- `vcat`：在一维上组合；
- `hcat`：在二维上组合；

## 阵列推导

通用的语法：

```julia
A = [ F(x, y, ...) for x = rx, y = ry, ...]
```

这里 `rx, ry` 都是可迭代对象。

## 生成器

若列表不包含括号，则视为一个生成器，通过迭代来得到值，而不需要任何阵列。

## 指标

函数形式：`getindex(A, ...)`

### 标量指标

如果所有的指标都是标量，那么结果是一个元素；

### 向量指标

如果所有的指标都是向量，那么结果是一个 N 维阵列，阵列的大小是 `length(I_1), ...., length(I_n)`。

### 二维阵列指标

结果是一个 N+1 维阵列，大小是 `size(I_1, 1), size(I_1, 2), ...`

## 指标赋值

函数形式：`setindex!(A, X, ...)`

## 子阵列

子阵列与母阵列共享同样的内存，可以通过 `view` 创建，它的参数与 `getindex()` 相同。

## 广播

当我们需要在不同大小的阵列间进行二元运算时，我们可以用广播函数将大小为一的维度扩增然后进行运算：

```julia
a = rand(2, 1);
A = rand(2, 3);
broadcast(+, a, A);
```
