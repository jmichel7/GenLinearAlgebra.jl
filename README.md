# GenLinearAlgebra

linear algebra over arbitrary fields and rings

The  `LinearAlgebra`  package  in  Julia  is  not  suitable  as  a  general
mathematics  package: it assumes  the field is  the Real or Complex numbers
and  uses floating  point to  do approximate  computations. For example the
invertible  rational matrix `[1//(n+m) for  n in 1:11, m  in 1:11]` has for
`LinearAlgebra` a `rank` of 10 and a `Float64` nullspace of dimension 1.

Here we are interested in functions which work over any field (or sometimes
any ring) and do exact computations.

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://jmichel7.github.io/GenLinearAlgebra.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://jmichel7.github.io/GenLinearAlgebra.jl/dev/)
[![Build Status](https://github.com/jmichel7/GenLinearAlgebra.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/jmichel7/GenLinearAlgebra.jl/actions/workflows/CI.yml?query=branch%3Amain)
