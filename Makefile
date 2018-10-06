nn/build/libTHNN.so: nn/CMakeLists.txt /usr/local/cpp-torch/lib/libTH.so
	mkdir -p nn/build
	cd nn/build; cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local/cpp-torch ../lib/THNN
	make -C nn/build

/usr/local/cpp-torch/lib/libTH.so: torch7/build/libTH.so
	cd torch7/build; make install

torch7/build/libTH.so: torch7/CMakeLists.txt
	mkdir -p torch7/build
	cd torch7/build; cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local/cpp-torch ../lib/TH
	make -C torch7/build

nn/CMakeLists.txt:
	git submodule update --init

torch7/CMakeLists.txt:
	git submodule update --init
