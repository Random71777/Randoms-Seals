SMODS.Joker{ --Funny Story
    key = "funnystory",
    config = {
        extra = {
            currentante = 0
        }
    },
    loc_txt = {
        ['name'] = 'Funny Story',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X1{} Mult per Ante',
            [2] = '(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["randomss_randomss_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {(G.GAME.round_resets.ante or 0)}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = G.GAME.round_resets.ante
                }
        end
    end
}