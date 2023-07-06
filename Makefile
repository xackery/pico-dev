NAME := pico-dev

.PHONY: build
build:
	mkdir -p build
	cd build && cmake ..
	cd build && make src
	-rm -rf bin
	mkdir -p bin
	@mv build/src.bin bin/${NAME}.bin
	@mv build/src.dis bin/${NAME}.dis
	@mv build/src.elf bin/${NAME}.elf
	@mv build/src.elf.map bin/${NAME}.elf.map
	@mv build/src.hex bin/${NAME}.hex
	@mv build/src.uf2 bin/${NAME}.uf2

.PHONY: deps-clone
deps-clone:
	git clone --depth 1 --branch 1.5.0 https://github.com/raspberrypi/pico-sdk.git deps/pico-sdk
	cd deps/pico-sdk && git submodule update --init
	cd deps/pico-sdk/lib && rm -rf tinyusb
	cd deps/pico-sdk/lib && git clone --depth 1 --branch 0.15.0 https://github.com/hathach/tinyusb.git
	git clone https://github.com/raspberrypi/openocd.git deps/openocd

.PHONY: deps-install
deps-install:
	cd deps/openocd && ./bootstrap
	cd deps/openocd && ./configure
	cd deps/openocd && make
	cd deps/openocd && make install