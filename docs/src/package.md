# 创建包

首先在默认环境下（如 `@v1.5`）安装 PkgTemplates.jl。

然后，执行以下脚本：

```julia
using PkgTemplates
  
t = Template(
    user="tansongchen",
    authors="Songchen Tan",
    julia=v"1.5",
    plugins=[
        Codecov(),
        Documenter{GitHubActions}(),
        Git(name="tansongchen", email="tansongchen@pku.edu.cn", ssh=true),
        GitHubActions()
    ]
)

t("PACKAGE_NAME")
```

同时在 GitHub 上创建相应的仓库，但不需要马上导入。

# 修复

1. 删除 `DOCUMENTER_KEY`；
2. 修复 README.md 中的自定义域名；
3. 修复 make.jl 中的自定义域名；
4. 修复 remote origin

# 配置 Codecov

在 Codecov 网站上选择该仓库，复制 token；在仓库的 Secrets 中加入 `CODECOV_TOKEN`。

# 加入示例语句

在 `Package.jl` 中加入：

```julia
export double

const double = x -> 2x
```

在 `runtests` 中加入：

```julia
@test double(1) == 2
```

# 第一次推送至仓库

设置好 Page 的问题