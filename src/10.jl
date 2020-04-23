include("src/io.jl")

data = YAML.load(open("src/test.yaml"))
YAML.write_file("src/test-output.yaml", data)
println(data)