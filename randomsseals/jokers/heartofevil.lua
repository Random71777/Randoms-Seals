SMODS.Joker{ --Heart of Evil
    key = "heartofevil",
    config = {
        extra = {
            Mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Heart of Evil',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X0.5{} Mult whenever you hold a',
            [2] = '{C:hearts}Heart{} Face card in your hand',
            [3] = '(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["randomss_randomss_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Mult}}
    end,

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            context.other_card.should_destroy = false
            if (context.other_card:is_face() and context.other_card:is_suit("Hearts")) then
                context.other_card.should_destroy = true
                return {
                    func = function()
                    card.ability.extra.Mult = (card.ability.extra.Mult) + 0.5
                    return true
                end,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                        }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Mult
                }
        end
    end
}