SMODS.Seal {
    key = 'sunsetseal',
    pos = { x = 4, y = 0 },
    config = {
        extra = {
            x_mult = 1.5
        }
    },
    badge_colour = HEX('ffbf66'),
   loc_txt = {
        name = 'Sunset Seal',
        label = 'Sunset Seal',
        text = {
        [1] = 'when this card scores add {C:mult}1.5 XMult{}'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { x_mult = card.ability.seal.extra.x_mult }
        end
    end
}