
<a id='Linear-algebra-on-any-field/ring'></a>

<a id='Linear-algebra-on-any-field/ring-1'></a>

# Linear algebra on any field/ring

- [Linear algebra on any field/ring](index.md#Linear-algebra-on-any-field/ring)

<a id='GenLinearAlgebra' href='#GenLinearAlgebra'>#</a>
**`GenLinearAlgebra`** &mdash; *Module*.



GenLinearAlgebra: linear algebra over arbitrary fields and rings

The  linear  algebra  package  in  Julia  is  not  suitable  for  a general mathematics  package: it assumes  the field is  the Real or Complex numbers and  uses floating  point to  do approximate  computations. For example the invertible  rational matrix `[1//(n+m) for  n in 1:11, m  in 1:11]` has for `LinearAlgebra` a `rank` of 10 and a `Float64` nullspace of dimension 1.

Here we are interested in functions which work over any field (or sometimes any ring) and assume exact computations.

For more information, look at the helpstrings of `echelon!, rowspace, independent_rows, in_rowspace, intersect_rowspace,  lnullspace, GenLinearAlgebra.nullspace, GenLinearAlgebra.rank, solutionmat,   charpoly, comatrix, permanent, symmetric_power, exterior_power, ratio,   diagconj_elt, transporter, bigcell_decomposition, traces_words_mats, all_ge_1`.


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L1-L18' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.echelon!' href='#GenLinearAlgebra.echelon!'>#</a>
**`GenLinearAlgebra.echelon!`** &mdash; *Function*.



`echelon!(m::AbstractMatrix)`

puts  `m` in echelon  form in-place and  returns: 

(`m`, indices of linearly independent  rows of original `m`)

The  echelon form transforms the  rows of m into  a particular basis of the rowspace. The first non-zero element of each line is 1, and such an element is also the only non-zero in its column. This function works in any field.

```julia-repl
julia> m=[0 0 0 1; 1 1 0 1; 0 1 0 1; 1 0 0 0]//1
4×4 Matrix{Rational{Int64}}:
 0  0  0  1
 1  1  0  1
 0  1  0  1
 1  0  0  0

julia> echelon!(m)
(Rational{Int64}[1 0 0 0; 0 1 0 0; 0 0 0 1; 0 0 0 0], [2, 3, 1])
```


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L28-L49' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.rowspace' href='#GenLinearAlgebra.rowspace'>#</a>
**`GenLinearAlgebra.rowspace`** &mdash; *Function*.



`rowspace(m::AbstractMatrix)`

returns a canonical form of the rowspace of `m` (the vector space generated by  the rows of `m`),  the echelon form. This  is a particular basis of the rowspace  of `m`: the first non-zero element of each line is 1, and such an element  is also the only non-zero  element in its column. Integer matrices are converted to `Rational` before applying this function.

```julia-repl
julia> m=[1 2;2 4;5 6]
3×2 Matrix{Int64}:
 1  2
 2  4
 5  6

julia> rowspace(m)
2×2 view(::Matrix{Rational{Int64}}, 1:2, :) with eltype Rational{Int64}:
 1  0
 0  1
```


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L74-L95' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.rank' href='#GenLinearAlgebra.rank'>#</a>
**`GenLinearAlgebra.rank`** &mdash; *Function*.



`GenLinearAlgebra.rank(m::AbstractMatrix)`

computes  exactly  the  rank  of  `m`.  Not  exported  to not conflict with `LinearAlgebra`.

```julia-rep1
julia> hilbert(r)=[1//(n+m) for n in 1:r, m in 1:r];

julia> LinearAlgebra.rank(hilbert(11))
10

julia> GenLinearAlgebra.rank(hilbert(11)) # correct value
11
```


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L128-L143' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.independent_rows' href='#GenLinearAlgebra.independent_rows'>#</a>
**`GenLinearAlgebra.independent_rows`** &mdash; *Function*.



`independent_rows(m::AbstractMatrix)`

returns  a vector of the  indices of a set  of independent rows of `m` (the lexicographically first such set).

```julia-repl
julia> m=[1 2;2 4;5 6]
3×2 Matrix{Int64}:
 1  2
 2  4
 5  6

julia> independent_rows(m)
2-element Vector{Int64}:
 1
 3
```


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L103-L121' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.in_rowspace' href='#GenLinearAlgebra.in_rowspace'>#</a>
**`GenLinearAlgebra.in_rowspace`** &mdash; *Function*.



`in_rowspace(v::AbstractVector,m::AbstractMatrix)` 

whether `v` is in the rowspace `m`. The matrix `m` should be an echelonized matrix like what is returned by function `rowspace`.


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L198-L203' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.intersect_rowspace' href='#GenLinearAlgebra.intersect_rowspace'>#</a>
**`GenLinearAlgebra.intersect_rowspace`** &mdash; *Function*.



`intersect_rowspace(m::AbstractMatrix,n::AbstractMatrix)` 

The intersection of the rowspaces of `m` and `n`.


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L186-L190' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.lnullspace' href='#GenLinearAlgebra.lnullspace'>#</a>
**`GenLinearAlgebra.lnullspace`** &mdash; *Function*.



`lnullspace(m::AbstractMatrix)`

The left nullspace of `m`, that is the rowspace of the vectors `v` such that `iszero(permutedims(v)*m)`.


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L178-L183' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.nullspace' href='#GenLinearAlgebra.nullspace'>#</a>
**`GenLinearAlgebra.nullspace`** &mdash; *Function*.



`GenLinearAlgebra.nullspace(m::AbstractMatrix)`

computes  the right nullspace of `m` in a type-preserving way, that is that is the colspace of the vectors `v` such that `iszero(m*v)`. Not exported to avoid conflict with LinearAlgebra


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L146-L152' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.solutionmat' href='#GenLinearAlgebra.solutionmat'>#</a>
**`GenLinearAlgebra.solutionmat`** &mdash; *Function*.



`solutionmat(mat,v)`

returns  one solution  `x` of  the equation  `transpose(mat)*x=v` (that is, expresses  `v` as a linear combination of  the rows of `mat`), or `nothing` if  no such solution  exists. Similar to  `transpose(mat)\v` when `mat` is invertible.

```julia-repl
julia> m=[2 -4 1;0 0 -4;1 -2 -1]
3×3 Matrix{Int64}:
 2  -4   1
 0   0  -4
 1  -2  -1

julia> x=solutionmat(m,[10,-20, -10])
3-element Vector{Rational{Int64}}:
   5
 15//4
   0

julia> m'*x
3-element Vector{Rational{Int64}}:
  10
 -20
 -10

julia> solutionmat(m,[10, 20, -10])
```


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L468-L497' class='documenter-source'>source</a><br>


`solutionmat(m,n::AbstractMatrix)`

return a matrix `x` such that `x*m==n`. This is interesting when `m`  is not invertible.


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L547-L552' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.charpoly' href='#GenLinearAlgebra.charpoly'>#</a>
**`GenLinearAlgebra.charpoly`** &mdash; *Function*.



`charpoly(M::Matrix)` 

The characteristic polynomial of `M` (as a `Vector` of coefficients). This function works over any ring.


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L229-L234' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.comatrix' href='#GenLinearAlgebra.comatrix'>#</a>
**`GenLinearAlgebra.comatrix`** &mdash; *Function*.



`comatrix(M::Matrix)` 

is defined by `comatrix(M)*M=det(M)*one(M)`. This function works over any ring.


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L237-L242' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.permanent' href='#GenLinearAlgebra.permanent'>#</a>
**`GenLinearAlgebra.permanent`** &mdash; *Function*.



`permanent(m)`

returns the *permanent* of the square matrix `m`, which is defined by  $\sum_{p\in\frak S_n}\prod_{i=1}^n m[i,p(i)]$.

Note the similarity of the definition of  the permanent to the definition of the determinant.  In  fact the only  difference is the missing sign of the permutation.  However the  permanent is quite unlike the determinant, for example   it is  not  multilinear or  alternating.  It   has  however important combinatorical properties.

```julia-repl
julia> permanent([0 1 1 1;1 0 1 1;1 1 0 1;1 1 1 0]) # inefficient way to compute the number of derangements of 1:4
9

julia> permanent([1 1 0 1 0 0 0; 0 1 1 0 1 0 0;0 0 1 1 0 1 0; 0 0 0 1 1 0 1;1 0 0 0 1 1 0;0 1 0 0 0 1 1;1 0 1 0 0 0 1]) # 24 permutations fit the projective plane of order 2 
24 
```


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L374-L393' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.symmetric_power' href='#GenLinearAlgebra.symmetric_power'>#</a>
**`GenLinearAlgebra.symmetric_power`** &mdash; *Function*.



`symmetric_power(m,n)`

returns the `n`-th symmetric power of the square matrix `m`, in the basis  naturally indexed by the `multisets` of `1:n`, where `n=size(m,1)`.

```julia-repl
julia> m=[1 2;3 4]
2×2 Matrix{Int64}:
 1  2
 3  4

julia> Int.(symmetric_power(m,2))
3×3 Matrix{Int64}:
 1   2   4
 6  10  16
 9  12  16
```


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L404-L422' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.exterior_power' href='#GenLinearAlgebra.exterior_power'>#</a>
**`GenLinearAlgebra.exterior_power`** &mdash; *Function*.



`exterior_power(mat,n)`

`mat`  should be a square matrix.  The function returns the `n`-th exterior power  of  `mat`,  in  the  basis naturally indexed by`combinations(1:r,n)` where`r=size(mat,1)`

```julia-repl
julia> M=[1 2 3 4;2 3 4 1;3 4 1 2;4 1 2 3]
4×4 Matrix{Int64}:
 1  2  3  4
 2  3  4  1
 3  4  1  2
 4  1  2  3

julia> exterior_power(M,2)
6×6 Matrix{Int64}:
  -1   -2   -7   -1  -10  -13
  -2   -8  -10  -10  -12    2
  -7  -10  -13    1    2    1
  -1  -10    1  -13    2    7
 -10  -12    2    2    8   10
 -13    2    1    7   10   -1
```


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L344-L368' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.ratio' href='#GenLinearAlgebra.ratio'>#</a>
**`GenLinearAlgebra.ratio`** &mdash; *Function*.



`ratio(v::abstractVector,w::abstractVector)` 

ratio `v/w`, `nothing` if `v` is not a multiple of `w`.


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L456-L460' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.diagconj_elt' href='#GenLinearAlgebra.diagconj_elt'>#</a>
**`GenLinearAlgebra.diagconj_elt`** &mdash; *Function*.



`diagconj_elt(M,N)`

`M` and `N` must be square matrices of the same size. This function returns a  list `d`  such that  `N==inv(Diagonal(d))*M*Diagonal(d)` if  such a list exists, and `nothing` otherwise.

```julia_repl
julia> M=[1 2;2 1];N=[1 4;1 1]
2×2 Matrix{Int64}:
 1  4
 1  1

julia> diagconj_elt(M,N)
2-element Vector{Rational{Int64}}:
 1
 2
```


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L555-L573' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.transporter' href='#GenLinearAlgebra.transporter'>#</a>
**`GenLinearAlgebra.transporter`** &mdash; *Function*.



`transporter(l1, l2 )`

`l1`  and `l2` should be vectors of  the same length of square matrices all of the same size. The result is a basis of the vector space of matrices `A` such  that for any `i` we have  `A*l1[i]=l2[i]*A` –- the basis is returned as  a vector of matrices, empty if the vector space is 0. This is useful to find whether two representations are isomorphic.


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L429-L437' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.bigcell_decomposition' href='#GenLinearAlgebra.bigcell_decomposition'>#</a>
**`GenLinearAlgebra.bigcell_decomposition`** &mdash; *Function*.



`bigcell_decomposition(M [, b])`

`M`  should be a square  matrix, and `b` specifies  a block structure for a matrix  of  same  size  as  `M`  (it  is  a  `Vector`  of  `Vector`s  whose concatenation  is `1:size(M,1)`).  If `b`  is not  given, the trivial block structure `[[i] for i in axes(M,1)]` is assumed.

The  function  decomposes  `M`  as  a  product  `P₁ L P` where `P` is upper block-unitriangular   (with  identity  diagonal   blocks),  `P₁`  is  lower block-unitriangular  and `L` is block-diagonal for the block structure `b`. If  `M` is symmetric then  `P₁` is the transposed  of `P` and the result is the  pair  `[P,L]`;  else  the  result  is  the triple `[P₁,L,P]`. The only condition  for  this  decomposition  of  `M`  to  be  possible  is that the principal  minors  according  to  the  block  structure be invertible. This routine  is used  in the  Lusztig-Shoji algorithm  for computing  the Green functions  and the example  below is extracted  from the computation of the Green functions for `G₂`.

```julia-repl
julia> using LaurentPolynomials

julia> @Pol q
Pol{Int64}: q

julia> M=[q^6 q^0 q^3 q^3 q^5+q q^4+q^2; q^0 q^6 q^3 q^3 q^5+q q^4+q^2; q^3 q^3 q^6 q^0 q^4+q^2 q^5+q; q^3 q^3 q^0 q^6 q^4+q^2 q^5+q; q^5+q q^5+q q^4+q^2 q^4+q^2 q^6+q^4+q^2+1 q^5+2*q^3+q; q^4+q^2 q^4+q^2 q^5+q q^5+q q^5+2*q^3+q q^6+q^4+q^2+1]
6×6 Matrix{Pol{Int64}}:
 q⁶     1      q³     q³     q⁵+q        q⁴+q²
 1      q⁶     q³     q³     q⁵+q        q⁴+q²
 q³     q³     q⁶     1      q⁴+q²       q⁵+q
 q³     q³     1      q⁶     q⁴+q²       q⁵+q
 q⁵+q   q⁵+q   q⁴+q²  q⁴+q²  q⁶+q⁴+q²+1  q⁵+2q³+q
 q⁴+q²  q⁴+q²  q⁵+q   q⁵+q   q⁵+2q³+q    q⁶+q⁴+q²+1

julia> bb=[[2],[4],[6],[3,5],[1]];

julia> (P,L)=bigcell_decomposition(M,bb);

julia> P
6×6 Matrix{Pol{Int64}}:
 1    0  0    0    0        0
 q⁻⁶  1  q⁻³  q⁻³  q⁻¹+q⁻⁵  q⁻²+q⁻⁴
 0    0  1    0    0        0
 q⁻³  0  0    1    q⁻²      q⁻¹
 q⁻¹  0  0    0    1        0
 q⁻²  0  q⁻¹  0    q⁻¹      1

julia> L
6×6 Matrix{Pol{Int64}}:
 q⁶-q⁴-1+q⁻²  0   0            0     0            0
 0            q⁶  0            0     0            0
 0            0   q⁶-q⁴-1+q⁻²  0     0            0
 0            0   0            q⁶-1  0            0
 0            0   0            0     q⁶-q⁴-1+q⁻²  0
 0            0   0            0     0            q⁶-1

julia> M==transpose(P)*L*P
true
```


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L245-L304' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.traces_words_mats' href='#GenLinearAlgebra.traces_words_mats'>#</a>
**`GenLinearAlgebra.traces_words_mats`** &mdash; *Function*.



`traces_words_mats(mats,words)`

given  a list `mats`  of matrices and  a list `words`  of words returns the list  of traces of the corresponding products of the matrices. Each subword is evaluated only once.

```julia-repl
julia> R=[[-1 -1 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1], [1 0 0 0; -1 -1 -1 0; 0 0 1 0; 0 0 0 1], [1 0 0 0; 0 1 0 0; 0 -2 -1 -1; 0 0 0 1], [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 -1 -1]]; # 17th representation of F4

julia> words=[[], [1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4], [2,3,2,3], [2,1], [1,2,3,4,2,3,2,3,4,3], [1,2,3,4,1,2,3,4,1,2,3,4], [4,3], [1,2,1,3,2,3,1,2,3,4], [1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4], [1,2,3,4,1,2,3,4], [1,2,3,4], [1], [2,3,2,3,4,3,2,3,4], [1,4,3], [4,3,2], [2,3,2,1,3], [3], [1,2,1,3,2,1,3,2,3], [2,1,4], [3,2,1], [2,4,3,2,3], [1,3], [3,2], [1,2,3,4,1,2,3,4,1,2,3,4,2,3], [1,2,3,4,2,3]];

julia> [traces_words_mats(R,words)] # 17th character of F4
1-element Vector{Vector{Int64}}:
 [4, 0, 0, 1, -1, 0, 1, -1, -2, 2  …  0, 2, -2, -1, 1, 0, 0, 2, -2, 0]
```


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L594-L610' class='documenter-source'>source</a><br>

<a id='GenLinearAlgebra.all_ge_1' href='#GenLinearAlgebra.all_ge_1'>#</a>
**`GenLinearAlgebra.all_ge_1`** &mdash; *Function*.



`all_ge_1(M::Matrix;approx=x->x)`

This  function determines if a list of real linear forms represented by the rows  of a  matrix `M`  can be  made simultaneously  `≥1`. The  result is a vector  `v` such  that `all(≥(1),M*v)`,  or `nothing`  if there  is no such vector.

`approx(x)`  is a  function giving  an approximate  real value for `x`. For instance,  setting `approx=Float64` enables to  use this function with real `Cyc` numbers.

```julia-repl
julia> all_ge_1([1 1 -1;1 -1 1;-1 1 1])
3-element Vector{Float64}:
 1.0
 1.0
 1.0
```


<a target='_blank' href='https://github.com/jmichel7/GenLinearAlgebra.jl/blob/530f1050cc5ddecdb9a54a452d21b349d306a277/src/GenLinearAlgebra.jl#L637-L655' class='documenter-source'>source</a><br>

