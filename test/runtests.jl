# auto-generated tests from julia-repl docstrings
using Test, GenLinearAlgebra
function mytest(file::String,cmd::String,man::String)
  println(file," ",cmd)
  exec=repr(MIME("text/plain"),eval(Meta.parse(cmd)),context=:limit=>true)
  if endswith(cmd,";") exec="nothing" 
  else exec=replace(exec,r"\s*$"m=>"")
       exec=replace(exec,r"\s*$"s=>"")
       exec=replace(exec,r"^\s*"=>"")
  end
  if exec==man return true end
  i=1
  while i<=lastindex(exec) && i<=lastindex(man) && exec[i]==man[i]
    i=nextind(exec,i)
  end
  print("exec=$(repr(exec[i:end]))\nmanl=$(repr(man[i:end]))\n")
  return false
end
@testset "GenLinearAlgebra.jl" begin
@test mytest("GenLinearAlgebra.jl","m=[0 0 0 1; 1 1 0 1; 0 1 0 1; 1 0 0 0]//1","4×4 Matrix{Rational{Int64}}:\n 0  0  0  1\n 1  1  0  1\n 0  1  0  1\n 1  0  0  0")
@test mytest("GenLinearAlgebra.jl","echelon!(m)","(Rational{Int64}[1 0 0 0; 0 1 0 0; 0 0 0 1; 0 0 0 0], [2, 3, 1])")
@test mytest("GenLinearAlgebra.jl","m=[1 2;2 4;5 6]","3×2 Matrix{Int64}:\n 1  2\n 2  4\n 5  6")
@test mytest("GenLinearAlgebra.jl","rowspace(m)","2×2 view(::Matrix{Rational{Int64}}, 1:2, :) with eltype Rational{Int64}:\n 1  0\n 0  1")
@test mytest("GenLinearAlgebra.jl","m=[1 2;2 4;5 6]","3×2 Matrix{Int64}:\n 1  2\n 2  4\n 5  6")
@test mytest("GenLinearAlgebra.jl","independent_rows(m)","2-element view(::Vector{Int64}, 1:2) with eltype Int64:\n 1\n 3")
@test mytest("GenLinearAlgebra.jl","M=[1 2 3 4;2 3 4 1;3 4 1 2;4 1 2 3]","4×4 Matrix{Int64}:\n 1  2  3  4\n 2  3  4  1\n 3  4  1  2\n 4  1  2  3")
@test mytest("GenLinearAlgebra.jl","exterior_power(M,2)","6×6 Matrix{Int64}:\n  -1   -2   -7   -1  -10  -13\n  -2   -8  -10  -10  -12    2\n  -7  -10  -13    1    2    1\n  -1  -10    1  -13    2    7\n -10  -12    2    2    8   10\n -13    2    1    7   10   -1")
@test mytest("GenLinearAlgebra.jl","permanent([0 1 1 1;1 0 1 1;1 1 0 1;1 1 1 0])","9")
@test mytest("GenLinearAlgebra.jl","permanent([1 1 0 1 0 0 0; 0 1 1 0 1 0 0;0 0 1 1 0 1 0; 0 0 0 1 1 0 1;1 0 0 0 1 1 0;0 1 0 0 0 1 1;1 0 1 0 0 0 1])","24")
@test mytest("GenLinearAlgebra.jl","m=[1 2;3 4]","2×2 Matrix{Int64}:\n 1  2\n 3  4")
@test mytest("GenLinearAlgebra.jl","Int.(symmetric_power(m,2))","3×3 Matrix{Int64}:\n 1   2   4\n 6  10  16\n 9  12  16")
@test mytest("GenLinearAlgebra.jl","m=[2 -4 1;0 0 -4;1 -2 -1]","3×3 Matrix{Int64}:\n 2  -4   1\n 0   0  -4\n 1  -2  -1")
@test mytest("GenLinearAlgebra.jl","x=solutionmat(m,[10,-20, -10])","3-element Vector{Rational{Int64}}:\n   5\n 15//4\n   0")
@test mytest("GenLinearAlgebra.jl","m'*x","3-element Vector{Rational{Int64}}:\n  10\n -20\n -10")
@test mytest("GenLinearAlgebra.jl","solutionmat(m,[10, 20, -10])","nothing")
@test mytest("GenLinearAlgebra.jl","R=[[-1 -1 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1], [1 0 0 0; -1 -1 -1 0; 0 0 1 0; 0 0 0 1], [1 0 0 0; 0 1 0 0; 0 -2 -1 -1; 0 0 0 1], [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 -1 -1]];","nothing")
@test mytest("GenLinearAlgebra.jl","words=[[], [1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4], [2,3,2,3], [2,1], [1,2,3,4,2,3,2,3,4,3], [1,2,3,4,1,2,3,4,1,2,3,4], [4,3], [1,2,1,3,2,3,1,2,3,4], [1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4], [1,2,3,4,1,2,3,4], [1,2,3,4], [1], [2,3,2,3,4,3,2,3,4], [1,4,3], [4,3,2], [2,3,2,1,3], [3], [1,2,1,3,2,1,3,2,3], [2,1,4], [3,2,1], [2,4,3,2,3], [1,3], [3,2], [1,2,3,4,1,2,3,4,1,2,3,4,2,3], [1,2,3,4,2,3]];","nothing")
@test mytest("GenLinearAlgebra.jl","[traces_words_mats(R,words)]","1-element Vector{Vector{Int64}}:\n [4, 0, 0, 1, -1, 0, 1, -1, -2, 2  …  0, 2, -2, -1, 1, 0, 0, 2, -2, 0]")
@test mytest("GenLinearAlgebra.jl","all_ge_1([1 1 -1;1 -1 1;-1 1 1])","3-element Vector{Float64}:\n 1.0\n 1.0\n 1.0")
end
