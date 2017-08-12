# julia-bathroom-solitaire
Julia Monte Carlo simulation of the game "bathroom (aka one-handed) solitaire"

Script uses Monte Carlo simulation to calculate the probability of winning
this [very difficult] game. The odds of winning using the set of rules assumed below appear to be only 0.71%. Good luck!

Game rules: [https://en.wikipedia.org/wiki/One-Handed_Solitaire](https://en.wikipedia.org/wiki/One-Handed_Solitaire)

Blog post by Miles Ott (results match this Julia script): [http://milesott.com/2014/08/19/i-stand-corrected-or-do-i](http://milesott.com/2014/08/19/i-stand-corrected-or-do-i)

## Usage
`julia -i bathroom_solitaire_sim.jl n_trials`

where `n_trials` is the number of games to simulate, e.g.,

`julia -i bathroom_solitaire_sim.jl 1000000`

## Sample Results
```
=============================================
Bathroom Solitaire Monte Carlo Simulation
=============================================
Number of trials:  1000000
Number of winners: 7167
Win percentage:    0.7167%
Runtime:           12.497582 seconds
=============================================
```

![](bathroom_solitaire.pdf?raw=true)
