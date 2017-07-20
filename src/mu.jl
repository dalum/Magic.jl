module μodule

export @μ

macro μ(words::Symbol...)
    token = :μ
    for word in words
        token = μagic(word, token)
    end
    return esc(token)
end

function μagic(word::Symbol, token)
    glyphs = [Symbol(glyph) for glyph in string(word)]
    while length(glyphs) > 0
        glyph = eval(pop!(glyphs))
        token = glyph(glyphs, token)
    end
    return token
end

Table = Dict([
    :a => :+
    :e => :^
    :i => :*
    :o => :/
    :q => :\
    :u => :-
    # in Runes
    :ᚨ => :+
    :ᛖ => :^
    :ᛁ => :*
    :ᛟ => :/
    :ᛩ => :\
    :ᚢ => :-
])

a(glyphs, token) = token
b(glyphs, token) = :(x = $token; (x, x))
d(glyphs, token) = (length(glyphs) > 0 ? (f = Table[pop!(glyphs)]; :(reduce($f, $token))) :
                    Expr(token.head, :reduce, token.args[2:end]...))
e(glyphs, token) = (:(x = $token; ($(eval(Expr(:call, pop!(glyphs), glyphs, :(:x)))), $(eval(Expr(:call, pop!(glyphs), glyphs, :(:x)))))))
f(glyphs, token) = (fname = Symbol(glyphs...); empty!(glyphs); :($fname(μ) = $token))
g(glyphs, token) = (fname = Symbol(glyphs...); empty!(glyphs); :($fname(μ...) = $token))
h(glyphs, token) = (:(first($token)))

k(glyphs, token) = :(collect($token))
l(glyphs, token) = :(last($token))

m(glyphs, token) = (f = Table[pop!(glyphs)]; :(map($f, $token)))
n(glyphs, token) = :(x = $token; (one(x), x))
p(glyphs, token) = :(prod($token))
q(glyphs, token) = Expr(token.head, reverse(token.args))
r(glyphs, token) = (reverse!(glyphs); token)
s(glyphs, token) = :(sum($token))
t(glyphs, token) = (:($token[2:end]))

u(glyphs, token) = :(x = $token; UnitRange(x...))
w(glyphs, token) = (n = Int(first("$(pop!(glyphs))")); :($token, $n))
!(glyphs::Vector{Symbol}, token) = (:())

# in Runes
ᚨ = a
ᛒ = b
ᛞ = d
ᛖ = e
ᚠ = f
ᚷ = g
ᚻ = h
ᚲ = k
ᛚ = l
ᛗ = m
ᚾ = n
ᛈ = p
ᛩ = q
ᚱ = r
ᛋ = s
ᛏ = t
ᚢ = u
ᚹ = w

end
