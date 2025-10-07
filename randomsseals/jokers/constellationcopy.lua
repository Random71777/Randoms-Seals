SMODS.Joker{ --Light Glyph
    key = "constellationcopy",
    config = {
        extra = {
            xmultvar = 1,
            levels = 1
        }
    },
    loc_txt = {
        ['name'] = 'Light Glyph',
        ['text'] = {
            [1] = 'Whenever you a {C:planet}Planet{} card Upgrade a random Hand Type'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.using_consumeable  and not context.blueprint then
            if context.consumeable and context.consumeable.ability.set == 'Planet' then
                local available_hands = {}
        for hand, value in pairs(G.GAME.hands) do
          if value.visible and value.level >= to_big(1) then
            table.insert(available_hands, hand)
          end
        end
        local target_hand = #available_hands > 0 and pseudorandom_element(available_hands, pseudoseed('level_up_hand')) or "High Card"
                return {
                    level_up = card.ability.extra.levels,
      level_up_hand = target_hand,
                    message = localize('k_level_up_ex')
                }
            end
        end
    end
}