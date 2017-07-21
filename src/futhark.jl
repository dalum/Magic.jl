module ᛗodule

using ..Magic.μodule

export @ᛗ

macro ᛗ(words::Symbol...)
    token = :ᛗ
    for word in words
        token = ᛗᚨᚷᛁᚳ(word, token)
    end
    return esc(token)
end

function ᛗᚨᚷᛁᚳ(word::Symbol, token)
    glyphs = [Symbol(glyph) for glyph in string(word)]
    while length(glyphs) > 0
        glyph = eval(pop!(glyphs))
        token = glyph(glyphs, token)
    end
    return token
end

# runic alphabets
merge!(μodule.Table, Dict([
    :ᚨ => :+
    :ᛖ => :^
    :ᛁ => :*
    :ᛟ => :/
    :ᛩ => :\
    :ᚢ => :-
]))

ᚨ = μodule.a
ᛒ = μodule.b
ᛞ = μodule.d
ᛖ = μodule.e
ᚠ(glyphs, token) =
    (fname = Symbol(glyphs...); empty!(glyphs); :($fname(ᛗ) = $token))
ᚷ(glyphs, token) =
    (fname = Symbol(glyphs...); empty!(glyphs); :($fname(ᛗ...) = $token))
ᚻ = μodule.h
ᚲ = μodule.k
ᛚ = μodule.l
ᛗ = μodule.m
ᚾ = μodule.n
ᛈ = μodule.p
ᛩ = μodule.q
ᚱ = μodule.r
ᛋ = μodule.s
ᛏ = μodule.t
ᚢ = μodule.u
ᚹ = μodule.w


end  # module ᛗodule
