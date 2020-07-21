using Documenter

makedocs(
    sitename="半个程序员的自我修养",
    pages=[
        "科学计算中的程序设计概论" => "index.md",
        "程序设计范式" => [
            # "functional_programming.md",
            "paradigm_nomenclature.md",
            "paradigm_types_and_functions.md",
            "paradigm_tests.md",
            "paradigm_documentation.md"
        ],
        "Julia 基础" => [
            "types.md",
            "intrinsic_types.md",
            "functions_and_methods.md",
            "metaprogramming.md",
            "misc.md"
        ],
        "Julia 专题" => "topics.md"
    ]
)

# deploydocs(
#     repo = "github.com/tansongchen/julia.git",
# )
