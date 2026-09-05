using DrWatson
@quickactivate "project"
using Agents
using DataFrames
using Plots
include(srcdir("daisyworld.jl"))
using CairoMakie

model = daisyworld()

daisycolor(a::Daisy) = a.breed

plotkwargs = (
    agent_color = daisycolor,
    agent_size = 20,
    agent_marker = '✿',
    heatarray = :temperature,
    heatkwargs = (colorrange = (-20, 60),),
)

abmvideo(
    plotsdir("simulation.webm"),
    model;
    title = "Daisy World",
    frames = 60,
    framerate = 10,
    recordkwargs = (
        compression = 20,
    ),
    plotkwargs...,
)