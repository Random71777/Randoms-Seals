SMODS.Seal {
    key = 'yellowseal',
    pos = { x = 6, y = 0 },
    badge_colour = HEX('F0E68C'),
   loc_txt = {
        name = 'Yellow Seal',
        label = 'Yellow Seal',
        text = {
        [1] = 'A {C:blue}custom{} seal with {C:red}unique{} effects.'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
        end
    end
}