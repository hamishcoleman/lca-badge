
output := badge.pdf

all: $(output)

build-depends:
	apt install python-cairosvg fonts-roboto

#
# TODO - add the other fonts
badge.pdf: badge.svg TwitterColorEmoji-SVGinOT-Linux-1.3.installed
	cairosvg $< -fpdf -o $@

#
# Fetch and install the emoji font
#
TwitterColorEmoji-SVGinOT-Linux-1.3.tar.gz:
	wget https://github.com/eosrei/twemoji-color-font/releases/download/v1.3/TwitterColorEmoji-SVGinOT-Linux-1.3.tar.gz
	touch $@

TwitterColorEmoji-SVGinOT-Linux-1.3/install.sh: TwitterColorEmoji-SVGinOT-Linux-1.3.tar.gz
	tar xvf $<

TwitterColorEmoji-SVGinOT-Linux-1.3.installed: TwitterColorEmoji-SVGinOT-Linux-1.3/install.sh
	cd $(dir $<) && ./install.sh
	touch $@
