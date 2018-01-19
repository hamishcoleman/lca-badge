
output := badge.pdf

all: $(output)

build-depends:
	apt install python-cairosvg

#
# TODO - add fonts
badge.pdf: badge.svg
	cairosvg $< -fpdf -o $@

