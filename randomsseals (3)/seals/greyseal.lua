SMODS.Seal {
    key = 'greyseal',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            x_chips = 1.5
        }
    },
    badge_colour = HEX('ababab'),
   loc_txt = {
        name = 'Grey Seal',
        label = 'Grey Seal',
        text = {
        [1] = 'when this card scores add {C:chips}1.5 XChips{}'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { x_chips = card.ability.seal.extra.x_chips }
        end
    end
}