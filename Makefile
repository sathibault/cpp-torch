TARGET_DIR ?= /usr/local/cpp-torch

install: build/libcpptorch.so
	make -C build install

build/libcpptorch.so: $(TARGET_DIR)/lib/libTHNN.so
	mkdir -p build
	cd build; cmake -DCMAKE_INSTALL_PREFIX=$(TARGET_DIR) -DCMAKE_PREFIX_PATH=$(TARGET_DIR) ..
	make -C build

$(TARGET_DIR)/lib/libTHNN.so: nn/build/libTHNN.so
	make -C nn/build install

nn/build/libTHNN.so: nn/CMakeLists.txt $(TARGET_DIR)/lib/libTH.so
	mkdir -p nn/build
	cd nn/build; cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$(TARGET_DIR) ../lib/THNN
	make -C nn/build

$(TARGET_DIR)/lib/libTH.so: torch7/build/libTH.so
	make -C torch7/build install

torch7/build/libTH.so: torch7/CMakeLists.txt
	mkdir -p torch7/build
	cd torch7/build; cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$(TARGET_DIR) ../lib/TH
	make -C torch7/build

nn/CMakeLists.txt:
	git submodule update --init

torch7/CMakeLists.txt:
	git submodule update --init
