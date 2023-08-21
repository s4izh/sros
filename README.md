# SrOS

Rust micro kernel targetting a x86_64 qemu machine build from scratch.

`cargo build` produces a standalone binary that can be booted with qemu
using `cargo run`.

This is a toy project to learn more about Rust and OS development.

## Features

- Basic functions
  - [x] Driver for VGA screen support via memory mapped IO
  - [x] Driver for Serial port support via port mapped IO (16550 UART)
  - [x] `print!` and `println!` macros for both VGA and Serial
  - [x] `panic!` handler that prints to VGA and Serial
  - [x] custom `test` framework for embedded system
  - [x] exit qemu properly via writting to port `0xf4` (`isa-debug-exit` device)

- [x] CPU exceptions handlers
  - [x] breakpoint handler
  - [x] double fault handler
- [x] Hardware interrupts handler
  - [x] Timer
  - [x] Keyboard
- [ ] Paging and memory protection
  - [x] Page fault handler
    - [ ] Complete page fault handler implementation
  - [x] Mapped the complete physical memory to virtual memory at a given offset (easy approach)
- [ ] Heap allocator
- [ ] Userspace
- [ ] Multiprocess and multithreading support
- [ ] Copy on write `fork`


## Docker enviroment

```bash
docker build -t ros .
./run_docker.sh
```

Then compile and run with `cargo run`

## Install on bare host

Need to install `qemu-full` (arch linux), `cargo` and `rustc`.

After that basic setup run:

```bash
rustup component add rust-src --toolchain nightly-x86_64-unknown-linux-gnu
cargo install bootimage
rustup component add llvm-tools-preview
rustup component add rust-analyzer
```
