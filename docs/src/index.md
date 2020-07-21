# 科学计算中的程序设计概论

## 一、代码猴子

你是一位程序设计师，还是一个代码猴子？

「代码猴子」（Code Monkey）一词出自《代码整洁之道》一书，意指那些在程序设计时随心所欲、上蹿下跳的程序员，他们不经意间的、也许是善意的行动反而使得代码结构混乱，无法维护。程序设计师和代码猴子的区别就在于**程序设计范式**。在程序设计中，范式一词表示了程序设计背后的思想和程序通常遵循的结构风格。以下一段定义引自中文维基百科：

> 程序设计范式是一类典型的编程风格，是指从事软件工程的一类典型的风格（可以对照方法学）。如：函数式编程、过程式编程、面向对象编程、指令式编程等等为不同的编程范型。

显然，良好的程序设计范式使得程序易于维护、易于根据需求的不断变化而不断更新迭代，减少出错概率，增强团队协作的效率。

程序设计的典型应用场景是软件工程，其业内已经形成了一套稳定的编程范式，可以作为领域内学习者参照的范本。然而，作为另一个重要的应用场景——科学计算，则由于从业者基本不是计算机相关专业出身等原因，并没有形成稳定的编程范式；同时又由于其特点而不能直接应用软件工程中的编程范式（如面向对象等）。

科学计算是理论与计算化学研究的重要组成部分之一。在课题组参与研究的过程中，我发现组内的高年级本科生和研究生经常花很多时间调试程序，但仍然经常出错，这在一定程度上是程度设计范式的缺失和思维的混乱所导致的必然结果。因此，非常有必要对适合于科学计算的程序设计范式进行研究，总结出一套自己的方法论，服务于未来的需求。

## 二、关于函数式编程

谈到程序设计范式，我们首先需要对它进行细致的分类。在最高的层级上，程序设计范式可以分为两大类：指令式（imperative）编程和描述式（declarative）编程。抽象地看，对于同样的一段计算过程，指令式编程认为这一过程的本质是对一系列数据进行修改，而描述式编程则认为这一过程的本质是一系列的声明，每一步声明都包括了计算结果与各种数据的关系。为了使得这两种范式的本质区别得到更好的理解，我们假设我们现在要做一道菜「蛋炒饭」，则指令式程序可能看起来像是：

> 大火将油烧热，将鸡蛋搅匀后倒入锅中，炒至金黄后盛入碗中；向锅中加入葱花和剩米饭，炒散后加入炒好的鸡蛋，再加入胡萝卜丁和火腿丁翻炒几分钟即可。

而描述式程序可能看起来像是：

> 「炒好的鸡蛋」是蛋液在与油混合炒至金黄得到的产物；「炒好的米饭和葱花」是米饭和葱花混合炒散得到的产物；「蛋炒饭」是「炒好的鸡蛋」与「炒好的米饭和葱花」混合并加入胡萝卜丁和火腿丁翻炒几分钟得到的产物。

不得不承认，指令式程序更接近人的思维习惯和做事习惯，描述式程序则看起来罗嗦、怪怪的。历史上，从 C 和 Lisp 语言的时代开始，这两门语言分别代表了指令式和描述式编程，在二十余年的大战中以指令式编程全面胜出而告终。指令式编程内部又可以划分为面向过程编程（修改的主体是子程序）和面向对象编程（修改的主体是一个抽象实体），其中面向对象编程已经成为了软件开发领域的共识。

那么，本专栏为什么又要强调描述式编程呢？一个简单的回答是科学计算并不是软件开发，科学计算的目的决定了描述式编程更为适合。描述式编程内部又可以再分为函数式编程、逻辑式编程和优化式编程，我们这里只讨论函数式编程。函数式编程，顾名思义，是将程序计算的结果描述为一系列函数（映射）的结果。例如输入数据是 $x$，则一个函数式程序可能是（`x, y, z, w` 可以是任意数据）：

```julia
input x
y = f(x)
z = g(x,y)
w = h(y,z)
output w
```

这里「函数」倾向于是数学意义上的函数，即给定一组参数，能够唯一确定地返回一个结果，不存在内部的状态，也不修改参数本身。这样的话，在实际操作中，函数式编程有以下几个优点：

1. 由于不存在内部的状态也不修改参数，函数没有任何的副作用，在任何情况下行为都是一样的，有利于调试；
2. 函数和函数之间只需要通过数据进行交互，不需要考虑环境的影响；
3. 在并行计算中，多个处理器上的并行可以理解为多个处理器对不同的数据执行同一函数，减少了并行程序的编写难度。

此外，从人的认知层面讲，在学习科学理论时物理量和物理量之间的关系一般都是用数学意义上的函数来表达的，函数式编程有利于将程序和科学认识进行对接，从而减轻认知负担，使得我们可以更加专注于科学本身。函数式编程的更多内容将在下一篇文章中有所提及。

## 三、关于 Julia

Julia 是一门函数式的面向科学计算领域的语言，它的优点我就太长不讲了，有兴趣可以参考[这个知乎回答](https://www.zhihu.com/question/362999182/answer/953669501)。在这里我只记录一下学习和配置的方法。

### macOS

1. 从官网下载二进制文件；
2. 移动到 `/Applications/Julia.app`
3. 运行 Shell 命令 `ln -s /Applications/Julia.app/Contents/Resources/julia/bin/julia /usr/local/bin/julia`
4. 在 Visual Studio Code 中下载 Julia 插件并填写路径。

### Linux

1. 从官网下载二进制文件；
2. 解压到 `~/local/julia`
3. 类似地配置环境变量。

直接看官网提供的手册就可以学习。另外知乎罗秀哲的回答值得参考。

## 四、关于本专栏

本专栏分为两部分：第一部分是关于程序设计范式的整体介绍，第二部分是 Julia 语言的学习（没写完）。
