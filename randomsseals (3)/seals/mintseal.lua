SMODS.Seal {
    key = 'mintseal',
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            dollars_min = 1,
            dollars_max = 20
        }
    },
    badge_colour = HEX('98fbd5'),
   loc_txt = {
        name = 'Mint Seal',
        label = 'Mint Seal',
        text = {
        [1] = 'when this card scores add {C:money}1-20${}'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { dollars = lenient_bignum(pseudorandom('dollars_30d6b959', card.ability.seal.extra.dollars_min, card.ability.seal.extra.dollars_max)) }
        end
    end
}