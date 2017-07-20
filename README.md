# Magic

Magic is a package that allows you to write `using Magic` anywhere in your Julia project.  It also provides some means of introducing magic into your code.

## Usage

```julia
julia> using Magic

julia> @μ abra kadabra dimbasum far
a (generic function with 1 methods)

julia> a(4)
256

julia> @μ ᚨᛒᚱᚨ ᚲᚨᛞᚨᛒᚱᚨ ᛞᛁᛗᛒᚨᛋᚢᛗ ᚠᚨᚱ
ᚨ (generic function with 1 method)

julia> ᚨ(4)
256
```
