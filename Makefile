LINUX_BUILD_DIR = build/linux
TESTS_BUILD_DIR = build/tests
BENCH_BUILD_DIR = build/bench

# Default build type is Release
BUILD_TYPE ?= Release

BENCH_CMAKE_PARAMS = \
	-DTANGRAM_BUILD_BENCHMARKS=1 \
	-DCMAKE_BUILD_TYPE=Release \
	${CMAKE_OPTIONS}

TESTS_CMAKE_PARAMS = \
	-DTANGRAM_BUILD_TESTS=1 \
	-DCMAKE_BUILD_TYPE=Debug \
	${CMAKE_OPTIONS}

LINUX_CMAKE_PARAMS = \
	-DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
	-DTANGRAM_PLATFORM=linux \
	-DCMAKE_EXPORT_COMPILE_COMMANDS=TRUE \
	${CMAKE_OPTIONS}

.PHONY: linux

linux: cmake-linux
	# cmake --build ${LINUX_BUILD_DIR} -- -j4
	$(MAKE) -C ${LINUX_BUILD_DIR}

cmake-linux:
	cmake -H. -B${LINUX_BUILD_DIR} ${LINUX_CMAKE_PARAMS}


.PHONY: clean
clean: clean-linux clean-shaders clean-tests clean-benchmark

clean-linux:
	rm -rf ${LINUX_BUILD_DIR}

clean-shaders:
	rm -rf core/generated/*.h

clean-tests:
	rm -rf ${TESTS_BUILD_DIR}

clean-benchmark:
	rm -rf ${BENCH_BUILD_DIR}