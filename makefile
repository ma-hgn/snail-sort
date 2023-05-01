bd = ./build/

all: c d nim odin __python rust

build-run: all
	$(bd)c
	$(bd)d
	$(bd)nim
	$(bd)odin
	./snail.py
	$(bd)rust

run:
	$(bd)c
	$(bd)d
	$(bd)nim
	$(bd)odin
	./snail.py
	$(bd)rust

clean:
	rm -f $(bd)*

c: snail.c
	gcc -Wall -Wextra -pedantic $^ -o $(bd)$@
	$(bd)$@

d: snail.d
	dmd $^ -of=$(bd)$@
	$(bd)$@

nim: snail.nim
	nim c $^ && mv snail $(bd)$@
	$(bd)$@

odin: snail.odin
	odin build . && mv *.bin $(bd)odin
	$(bd)$@

__python: snail.py
	python3 $^

rust: snail.rs
	rustc $^ -o $(bd)$@
	$(bd)$@

