PYTHON_CMD=python3.11

all:
	git submodule update --init
	git -C ./wgpu-native/ submodule update --init
	cargo build --manifest-path wgpu-native/Cargo.toml -r
	cp wgpu-native/ffi/wgpu.h include/wgpu.h
	cp wgpu-native/ffi/webgpu-headers/webgpu.h include/webgpu.h
	cp wgpu-native/ffi/webgpu-headers/webgpu.yml gen/webgpu.yml
	${PYTHON_CMD} gen/gen_zig_bindings.py
	${PYTHON_CMD} gen/merge_extensions.py

