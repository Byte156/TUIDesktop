all: bin/tuid

clear:
	rm -f build/* bin/*

bin:
	@mkdir -p bin
	@printf "# Created directory bin\n"

build:
	@mkdir -p build
	@printf "# Created directory build\n"

bin/tuid: build/tuid.o | bin
	@printf "# Linking bin/tuid..."
	@g++ -MMD -MP build/tuid.o -o bin/tuid -Wall -Wextra
	@printf "done\n"

build/tuid.o: src/main.cpp | build
	@printf "# Compiling build/tuid.o..."
	@g++ -MMD -MP -c src/main.cpp -o build/tuid.o -Wall -Wextra
	@printf "done\n"

.PHONY: all clear
