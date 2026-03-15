#!/bin/zsh

pkill -9 swaync
pkill -9 waybar

swaync &
waybar &
