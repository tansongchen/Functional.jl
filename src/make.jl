using Documenter

makedocs(
    source="../docs",
    build="/Users/tansongchen/Library/Blog/source/julia",
    sitename="半个程序员的自我修养",
    pages=[
        "科学计算中的程序设计概论" => "index.md",
        "函数式程序设计" => "functional_programming.md",
        # "程序设计范式" => [
        #     "paradigm_nomenclature.md",
        #     "paradigm_types.md",
        #     "paradigm_functions_and_methods.md",
        #     "paradigm_documentation.md"
        # ],
        "Julia 基础" => [
            "types.md",
            "intrinsic_types.md",
            "functions_and_methods.md",
            "metaprogramming.md",
            "misc.md"
        ],
        "Julia 专题" => [
            "parallel_computing.md",
            "automatic_differentiation.md"
        ]
    ]
)