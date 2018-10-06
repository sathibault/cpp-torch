<<<<<<< HEAD
=======
install: build/libcpptorch.so
	make -C build install

build/libcpptorch.so: /usr/local/cpp-torch/lib/libTHNN.so
	mkdir -p build
	cd build; cmake -DCMAKE_INSTALL_PREFIX=/usr/local/cpp-torch -DCMAKE_PREFIX_PATH=/usr/local/cpp-torch ..
	make -C build

/usr/local/cpp-torch/lib/libTHNN.so: nn/build/libTHNN.so
	make -C nn/build install

>>>>>>> fix-submodules
nn/build/libTHNN.so: nn/CMakeLists.txt /usr/local/cpp-torch/lib/libTH.so
	mkdir -p nn/build
	cd nn/build; cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local/cpp-torch ../lib/THNN
	make -C nn/build

/usr/local/cpp-torch/lib/libTH.so: torch7/build/libTH.so
<<<<<<< HEAD
	cd torch7/build; make install
=======
	make -C torch7/build install
>>>>>>> fix-submodules

torch7/build/libTH.so: torch7/CMakeLists.txt
	mkdir -p torch7/build
	cd torch7/build; cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local/cpp-torch ../lib/TH
	make -C torch7/build

nn/CMakeLists.txt:
	git submodule update --init

torch7/CMakeLists.txt:
	git submodule update --init
