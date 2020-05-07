function symbolicDerivative(expr::Expr)
    if expr.args[1] == :+
        monomials = map(symbolicDerivative, expr.args[2:end])
        return Expr(:call, :+, monomials...)
    else # monomial
        if isa(expr.args[2], Number)
            return Expr(:call, :*, expr.args[2] * expr.args[3].args[3], 
                Expr(:call, :^, expr.args[3].args[2], expr.args[3].args[3] - 1)
            )
        else
            return Expr(:call, :^, expr.args[3].args[2], expr.args[3].args[3] - 1)
        end
    end
end

# potential = :(.25x^4)
potential = :(.5x^2 + .1x^3 + .01x^4)
println(symbolicDerivative(potential))