# dotfiles

Files which I use on a daily basis

# Installation 
## Basics
	git clone https://github.com/yrmyjaska/dotfiles
Just copy all the files where you want them. Pretty self-explanatory. 
## Notes on emacs installation
There are a few problems with the emacs installation, as well as others because none
of the files are designed to be 'portable'. Here is a quick guide on how to overcome them.
### Firstly:
- copy .emacs file to ~/.emacs
- copy the .emacs.d/ directory as well to the home directory

### Do these in order to correct all the erros
Note: you will receive many errors
List of things to do to install everything correctly
- M-:  (byte-recompile-directory package-user-dir nil 'force) 
	- Do this in
- M-x all-the-icons-install-fonts
- You might need to delete 'auctex' related packages and reinstall them
- You should compile the irony server by yourself which is located in '.emacs.d/)'
   - How **I** make it work (Note: may not work for you)
       - Make sure 'clang-devel' and 'clang-libs' are installed
       - Then run the following commands:
	```cd ~/.emacs.d/elpa/<irony-dir> && mkdir build && cd build```
	```cmake ../server && sudo cmake --build . --use-stderr --config Release --target install```
	
   
