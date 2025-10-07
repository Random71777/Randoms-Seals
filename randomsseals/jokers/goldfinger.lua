SMODS.Joker{ --Gold Finger
    key = "goldfinger",
    config = {
        extra = {
            odds = 100,
            dollars = 10,
            shatter = 0,
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'Gold Finger',
        ['text'] = {
            [1] = 'Gives {C:money}$10{}',
            [2] = '{C:green}1 in 100{} chance this is destroyed at the end of round.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["randomss_randomss_jokers"] = true },
    in_pool = function(self, args)
          return (
          not args 
            
          or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and G.GAME.pool_flags.randomss_gros_michel_extinct
      end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_0510f007', 1, card.ability.extra.odds, 'j_randomss_goldfinger', false) then
              SMODS.calculate_effect({func = function()
                card:shatter()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Shiny!", colour = G.C.RED})
          end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    dollars = card.ability.extra.dollars
                }
        end
    end
}