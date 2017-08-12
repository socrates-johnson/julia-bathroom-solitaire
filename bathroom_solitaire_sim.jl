# ==============================================================================
# Import
# ==============================================================================
include("./BathroomSolitaire.jl")
using BathroomSolitaire
using PyPlot

# ==============================================================================
# Monte Carlo simulation
# ==============================================================================
# pre-compiliation step
_, _ = play_game(1)

# play game
n_trials = parse(Int, ARGS[1])
tic()
num_left, num_winners = play_game(n_trials)
stop = toq()

# ==============================================================================
# Print run summary
# ==============================================================================
@printf("\n=============================================\n")
@printf("Bathroom Solitaire Monte Carlo Simulation\n")
@printf("=============================================\n")
@printf("Number of trials:  %d\n", n_trials)
@printf("Number of winners: %d\n", num_winners)
@printf("Win percentage:    %.4f%%\n", 100.*num_winners/n_trials)
@printf("Runtime:           %f seconds\n", stop)
@printf("=============================================\n\n")

# ==============================================================================
# Plot histogram
# ==============================================================================
h = PyPlot.plt[:hist](num_left, 26, normed=true, edgecolor="black")
xlabel("Cards Remaining")
ylabel("Frequency (%)")
title("$n_trials Games of Bathroom Solitaire")
