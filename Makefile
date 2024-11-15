SOURCE = n.c
TARGET = n
TARGET_WASM = site/$(TARGET)

all: build

build: clean
	$(CC) $(CFLAGS) $(SOURCE) -o $(TARGET) $(LDFLAGS)

test: build
	@(! ./n 2>/dev/null)
	@(! ./n -1 2>/dev/null)
	@(! ./n 11 2>/dev/null)
	@(./n 1 >/dev/null && ./n 10 >/dev/null)

build-wasm:
	emmake make build \
		CFLAGS="-O3 -Os -sINVOKE_RUN=0 -sEXPORTED_RUNTIME_METHODS='[\"callMain\"]'" \
		TARGET=$(TARGET_WASM).js

serve-wasm: build-wasm
	cd site && ../serve.py

clean:
	$(RM) $(TARGET) $(TARGET_WASM).js $(TARGET_WASM).wasm

.PHONY: all build test build-wasm serve-wasm clean
