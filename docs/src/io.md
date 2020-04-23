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