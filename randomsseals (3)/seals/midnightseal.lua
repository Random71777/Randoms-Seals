SMODS.Seal {
    key = 'midnightseal',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            totalhandlevels = 0
        }
    },
    badge_colour = HEX('08112b'),
   loc_txt = {
        name = 'Midnight Seal',
        label = 'Midnight Seal',
        text = {
        [1] = 'Give {C:red}Mult{} and {C:blue}Chips{} equal to combined levels of all hands'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { mult = (function() local total = 0; for hand, data in pairs(G.GAME.hands) do if data.level >= to_big(1) then total = total + data.level end end; return total end)(), chips = (function() local total = 0; for hand, data in pairs(G.GAME.hands) do if data.level >= to_big(1) then total = total + data.level end end; return total end)() }
        end
    end
}