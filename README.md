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
  - [ ] Keyboard
- [ ] Paging and memory protection
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
