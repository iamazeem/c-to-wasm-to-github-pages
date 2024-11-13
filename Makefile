SOURCE = n.c
TARGET = n n.html n.js n.wasm

all: build

build:
	$(CC) $(CFLAGS) $(SOURCE) -o $(TARGET) $(LDFLAGS)

test:
	@(! ./n 2>/dev/null)
	@(! ./n -1 2>/dev/null)
	@(! ./n 11 2>/dev/null)
	@(./n 1 >/dev/null && ./n 10 >/dev/null)

wasm:
	emmake make build TARGET=n.html LDFLAGS=--emrun

clean:
	$(RM) $(TARGET)

.PHONY: all build test clean
