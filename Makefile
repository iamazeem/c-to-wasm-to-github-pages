SOURCE = n.c
TARGET = n

all: build

build:
	$(CC) $(CFLAGS) $(SOURCE) -o $(TARGET) $(LDFLAGS)

test:
	@(! ./n 2>/dev/null)
	@(! ./n -1 2>/dev/null)
	@(! ./n 11 2>/dev/null)
	@(./n 1 >/dev/null && ./n 10 >/dev/null)

wasm:
	emmake make build \
		CFLAGS="-O3 -Os -sINVOKE_RUN=0 -sEXPORTED_RUNTIME_METHODS='[\"callMain\"]'" \
		TARGET=$(TARGET).js

clean:
	$(RM) $(TARGET) $(TARGET).js $(TARGET).wasm

.PHONY: all build test clean
