using Documenter

makedocs(
    sitename="Julia 函数式编程",
    pages = [
        "index.md",
        "Julia 基础" => [
            "basics.md",
            "types.md",
            "functions_and_methods.md",
            "features.md",
            "arrays.md",
            "io.md"
        ],
        "元编程" => "metaprogramming.md",
        "函数式编程" => "functional_programming.md"
    ]
    )