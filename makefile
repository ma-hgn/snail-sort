bd = ./build/

all: c d nim odin __python rust v

build-run: all
	make run

run:
	$(bd)c
	$(bd)d
	$(bd)nim
	$(bd)odin
	./snail.py
	$(bd)rust
	$(bd)v

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

v: snail.v
	v $^ -o $(bd)$@
	$(bd)$@

