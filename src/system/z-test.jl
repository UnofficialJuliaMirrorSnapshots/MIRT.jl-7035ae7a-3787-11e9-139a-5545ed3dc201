# system/z-test.jl

using Test

@test block_lm(:test)
@test ir_lm_test_getindex_cumsum()
@test hcat_lm(:test)
