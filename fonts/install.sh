#!/bin/sh
URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FiraCode.zip"

install() {
	curl -L -s -o /tmp/fura.zip "$URL"
	unzip /tmp/fura.zip -d /tmp/FiraCode
	cp /tmp/FiraCode/*.ttf "$1"
}

if [ "$(uname -s)" = "Darwin" ]; then
	if command -v brew >/dev/null 2>&1; then
		brew tap homebrew/cask-fonts
		brew cask install font-fira-code
		# brew cask install font-fira-mono
		# brew cask install font-fira-mono-for-powerline
		# brew cask install font-fira-sans
		brew cask install font-firacode-nerd-font
		brew cask install font-firacode-nerd-font-mono
		brew cask install font-input
	else
		install ~/Library/Fonts
	fi
else
	mkdir -p ~/.fonts
	install ~/.fonts
fi
