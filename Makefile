SOURCE = n.c
TARGET = n
TARGET_WASM = site/$(TARGET)

all: build

build:
	$(CC) $(CFLAGS) $(SOURCE) -o $(TARGET) $(LDFLAGS)
	@echo "Built successfully!"

test: build
	@echo "Testing..."
	@printf "test-no-args: " && (! ./${TARGET} 2>/dev/null && echo "PASS" || echo "FAIL")
	@printf "test-invalid-arg-negative-value: " && (! ./${TARGET} -1 2>/dev/null && echo "PASS" || echo "FAIL")
	@printf "test-invalid-arg-positive-value: " && (! ./${TARGET} 11 2>/dev/null && echo "PASS" || echo "FAIL")
	@printf "test-valid-value-lower-bound: " && (./${TARGET} 1 >/dev/null && echo "PASS" || echo "FAIL")
	@printf "test-valid-value-upper-bound: " && (./${TARGET} 10 >/dev/null && echo "PASS" || echo "FAIL")
	@echo "Tested successfully!"

build-wasm:
	emmake make build \
		CFLAGS="-O3 -Os" \
		LDFLAGS="-sINVOKE_RUN=0 -sEXPORTED_RUNTIME_METHODS='[\"callMain\"]'" \
		TARGET=$(TARGET_WASM).js

serve-wasm: build-wasm
	cd site && ../serve.py

clean:
	$(RM) $(TARGET) $(TARGET_WASM).js $(TARGET_WASM).wasm

.PHONY: all build test build-wasm serve-wasm clean
