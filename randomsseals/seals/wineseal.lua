SMODS.Seal {
    key = 'wineseal',
    pos = { x = 5, y = 0 },
    config = {
        extra = {
            dollars = 2
        }
    },
    badge_colour = HEX('a30f5e'),
   loc_txt = {
        name = 'Wine Seal',
        label = 'Wine Seal',
        text = {
        [1] = 'when this card scores add {C:money}2${}',
        [2] = 'when this card scores with over {C:money}100${} in',
        [3] = 'your bank destroy this card'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:start_dissolve()
                    return true
                end
            }))
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Destroyed!", colour = G.C.RED})
            return
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            if G.GAME.dollars >= to_big(100) then
                card.should_destroy = true
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "POP!", colour = G.C.RED})
            end
        end
        if context.main_scoring and context.cardarea == G.play then
            return { dollars = lenient_bignum(card.ability.seal.extra.dollars) }
        end
    end
}