module μodule

export @μ

macro μ(words::Symbol...)
    token = :μ
    for word in words
        token = μagic(word, token)
    end
    return esc(:((μ) -> $token))
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
    :d => :/
    :p => :*
    :q => :\
    :s => :+
    :x => :^
    :z => :-
])

a(glyphs, token) = token
b(glyphs, token) = :(x = $token; (x..., x...))
d(glyphs, token) = (f = Table[pop!(glyphs)]; :(reduce($f, $token)))
e(glyphs, token) = (:(x = $token; ($(eval(Expr(:call, pop!(glyphs), glyphs, :(:x)))), $(eval(Expr(:call, pop!(glyphs), glyphs, :(:x)))))))

n(glyphs, token) = :(x = $token; (one(x), x))
p(glyphs, token) = :(prod($token))
q(glyphs, token) = :(prod($token))
r(glyphs, token) = (reverse!(glyphs); token)
s(glyphs, token) = :(sum($token))

u(glyphs, token) = :(x = $token; UnitRange(x...))

end
