using Documenter, GenLinearAlgebra

DocMeta.setdocmeta!(GenLinearAlgebra, :DocTestSetup, :(using GenLinearAlgebra); recursive=true)

makedocs(;
    modules=[GenLinearAlgebra],
    authors="Jean Michel <jean.michel@imj-prg.fr> and contributors",
    sitename="GenLinearAlgebra.jl",
    format=Documenter.HTML(;
        canonical="https://jmichel7.github.io/GenLinearAlgebra.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
    warnonly=:missing_docs,
)

deploydocs(;
    repo="github.com/jmichel7/GenLinearAlgebra.jl",
    devbranch="main",
)
