using NMF
using Test
using Random
using LinearAlgebra

tests = ["utils",
         "initialization",
         "alspgrad",
         "coorddesc"]

println("Running tests:")
for t in tests
    tp = "$t.jl"
    println("* $tp ...")
    include(tp)
end
