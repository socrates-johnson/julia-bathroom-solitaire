__precompile__()

module BathroomSolitaire

export play_game

# ==============================================================================
# Build deck
# ==============================================================================
function builddeck()
    suits = ["h", "d", "c", "s"]
    cards = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K"]

    return [c_i*s_i for s_i in suits for c_i in cards]
end

# ==============================================================================
# Draw cards
# ==============================================================================
function drawcards(n::Int, deck_down::Array{String,1}, deck_up::Array{Any,1})
    for ii in 1:n
        card = shift!(deck_down)
        prepend!(deck_up, [card])
    end

    return nothing
end

# ==============================================================================
# Check cards
# ==============================================================================
function checkcards(deck_up::Array{Any,1})
    # check for same suit
    if deck_up[1][2] == deck_up[4][2]
        deleteat!(deck_up, 2:3)
        check = true
    # check for same card
    elseif deck_up[1][1] == deck_up[4][1]
        deleteat!(deck_up, 1:4)
        check = true
    # no matches
    else
        check = false
    end

    return check
end

# ==============================================================================
# Monte Carlo simulation
# ==============================================================================
function play_game(n_trials::Int)
    # initialize counters
    num_left = zeros(Int, n_trials)
    num_winners = 0
    base_deck = builddeck()

    for ii = 1:n_trials
        deck_down = shuffle(base_deck)
        deck_up = []
        check = false

        # draw first four cards
        drawcards(4, deck_down, deck_up)

        # eliminate cards until deck_down is emtpy
        while length(deck_down) > 0
            if length(deck_up) > 3
                check = checkcards(deck_up)
                if check == false && length(deck_down) > 0
                    drawcards(1, deck_down, deck_up)
                end
            else
                while length(deck_up) < 4 && length(deck_down) > 0
                    drawcards(1, deck_down, deck_up)
                end
            end
        end

        # eliminate cards from deck_up until game is over
        if length(deck_up) > 3
            check = true
            while check == true
                if length(deck_up) > 3
                    check = checkcards(deck_up)
                else
                    check = false
                end
            end
        end

        # update num_left and num_winners
        num_left[ii] = length(deck_up)
        if length(deck_up) == 0
            num_winners += 1
        end
    end

    return (num_left, num_winners)

end

end
