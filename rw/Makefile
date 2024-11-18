SOURCE = rw.c
TARGET = rw
TARGET_WASM = site/$(TARGET)

all: build

build:
	$(CC) $(CFLAGS) $(SOURCE) -o $(TARGET) $(LDFLAGS)
	@echo "Built successfully!"

test: build
	@echo "Testing..."
	@printf "test-no-args: " && (! ./${TARGET} 2>/dev/null && echo "PASS" || echo "FAIL")
	@printf "test-invalid-arg-input-file: " && (! ./${TARGET} invalid-input-file 2>/dev/null && echo "PASS" || echo "FAIL")
	@printf "test-invalid-arg-input-dir: " && (! ./${TARGET} invalid-input-file 2>/dev/null && echo "PASS" || echo "FAIL")
	@printf "test-invalid-arg-output-dir: " && (! ./${TARGET} rw.c site 2>/dev/null && echo "PASS" || echo "FAIL")
	@printf "test-valid-input-and-output-files: " && (./${TARGET} rw.c rw.c.test && echo "PASS" || echo "FAIL")
	@$(RM) rw.c.test
	@echo "Tested successfully!"

build-wasm:
	emmake make build \
		CFLAGS="-O0" \
		LDFLAGS="-sINVOKE_RUN=0 -sEXPORTED_RUNTIME_METHODS='[\"callMain\"]' --embed-file test.txt" \
		TARGET=$(TARGET_WASM).js

serve-wasm: build-wasm
	cd site && ../../serve.py

clean:
	$(RM) $(TARGET) $(TARGET_WASM).js $(TARGET_WASM).wasm

.PHONY: all build test build-wasm serve-wasm clean
