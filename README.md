# dotfiles

Files which I use on a daily basis

# Installation 
## Basics
	git clone https://github.com/yrmyjaska/dotfiles
Just copy all the files where you want them. Pretty self-explanatory. 

# Troubleshooting & Co.

## Rust emacs support
1. [install Rust](https://rustup.rs/)
2. [Install Rust Analyzer](https://rust-analyzer.github.io/) via ```rustup nightly component add rust-analyzer-preview```
3. ???
4. Profit

## Polybar not launching or Pulseaudio mic not working
Chmod ```launch.sh``` and then mic script in ```.config/polybar/```
