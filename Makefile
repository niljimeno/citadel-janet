all:
	jpm build

run:
	rm -rf build
	make
	./build/citadel
