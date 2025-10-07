SMODS.Enhancement {
    key = 'wine',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            dollars = 3
        }
    },
    loc_txt = {
        name = 'Wine',
        text = {
        [1] = 'A {C:blue}custom{} enhancement with {C:red}unique{} effects.'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    shatters = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.cardarea == G.hand and context.main_scoring then
            card.should_destroy = false
            if G.GAME.dollars > to_big(100) then
                card.should_destroy = true
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "SMASH!", colour = G.C.RED})
            end
        end
        if context.end_of_round and context.cardarea == G.hand and context.other_card == card and context.individual then
            return { dollars = lenient_bignum(card.ability.extra.dollars) }
        end
    end
}