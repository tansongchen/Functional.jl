# Julia 专题

## 并行计算

## 包管理

### 原理

安装一个包的过程：

1. 查询注册表；
2. 下载包的源代码；
3. 下载二进制依赖。

在默认情况下，使用[官方服务器](https://pkg.julialang.org)，会根据地域自动导流到下述的区域服务器上：

- 北京 https://cn-northeast.pkg.juliacn.com
- 上海 https://cn-east.pkg.juliacn.com
- 广州 https://cn-southeast.pkg.juliacn.com
- 韩国 https://kr.pkg.julialang.org
- 新加坡 https://sg.pkg.julialang.org
- 北美 https://us-east.pkg.julialang.org

然后上述三种内容都从官方服务器获取。

## 使用镜像

在集群上，由于未知原因无法使用华东服务器，所以转而使用[北京外国语大学镜像站](https://mirrors.bfsu.edu.cn/julia/static)，使用手册见[这里](https://mirrors.bfsu.edu.cn/help/julia/)。镜像站只包含注册表和 Julia 源码，不包含二进制依赖。

## 自动微分
