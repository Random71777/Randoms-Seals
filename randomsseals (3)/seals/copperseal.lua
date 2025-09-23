SMODS.Seal {
    key = 'copperseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            handsplayedthisround = 0
        }
    },
    badge_colour = HEX('5f422b'),
   loc_txt = {
        name = 'Copper Seal',
        label = 'Copper Seal',
        text = {
        [1] = 'Retrigger this card for every {C:blue}Hand{} Played this Round'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.repetition and card.should_retrigger then
            return { repetitions = card.ability.seal.extra.retrigger_times }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = false
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = G.GAME.current_round.hands_played
        end
    end
}