
output := badge.pdf

all: $(output)

build-depends:
	apt install python-cairosvg fonts-roboto

#
# TODO - add the other fonts
badge.pdf: badge.svg
	cairosvg $< -fpdf -o $@

