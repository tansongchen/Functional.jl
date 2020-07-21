# 其他

---

# 流输入输出

所有的流都具备读写方法，例如：

```julia
write(stdout, "Hello world");
read(stdin, Char)
```

我们可以通过 `readline()` 函数一次读取整行；

# 文件输入输出

可以通过 `open` 函数创建一个流，进行读写：

```julia
f = open("hello.txt")
readlines(f)
f = open("hello.txt", "w")
write(f, "hello again.")
```

为了避免使用太多的 close 函数，我们可以简单地使用 do 语法：

```julia
open("hello.txt") do f
    uppercase(read(f, String))
end
```

# 模块

模块的本质是一个全局作用域，可以创建全局变量。

## `using` 语句

`using` 语句意味着该模块的作用域会用于解析当前变量，也即导入它所有导出的变量。

- `using MyModule`：导入所有的导出变量，以 `MyModule.` 为前缀导入所有的变量，并使所有函数以 `MyModule.` 为前缀可扩展；
- `using MyModule: x, p`：导入给定的变量；

## `import` 语句

- `import MyModule`：以 `MyModule.` 为前缀导入所有的变量，以 `MyModule.` 为前缀使所有函数可扩展；
- `import MyModule: x, p`：导入给定的变量，并使给定变量可扩展。

## 模块与文件的关系

模块与文件解耦，可以在任何模块中导入任何文件。

## 相对路径导入

例如，在模块中引用子模块时，需要使用：

```julia
module Parent
using .Utils
end
```

## 文件包含

文件包含的本质是将给定的源代码文件放到当前作用域上求值。

