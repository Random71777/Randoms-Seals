SMODS.Joker{ --Jimbo News
    key = "jimbonews",
    config = {
        extra = {
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Jimbo News',
        ['text'] = {
            [1] = 'Whenever you destroy a card create a random {C:tarot}tarot{} card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
    pools = { ["randomss_randomss_jokers"] = true },

    calculate = function(self, card, context)
        if context.remove_playing_cards  then
                return {
                    
    func = function()
    for i = 1, 1 do
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
            play_sound('timpani')
            SMODS.add_card({ set = 'Tarot', soulable = true, })                            
            card:juice_up(0.3, 0.5)
            return true
        end
        }))
    end
    delay(0.6)

                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                    return true
                  end
                }
        end
    end
}