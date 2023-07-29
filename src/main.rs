#![no_std]
#![no_main]
#![reexport_test_harness_main = "test_main"]
#![feature(custom_test_frameworks)]
#![test_runner(ros::test_runner)]

use core::panic::PanicInfo;
use ros::println;

#[no_mangle]
pub extern "C" fn _start() -> ! {
    println!("Bienvenido al SrOS{}", "!");

    #[cfg(test)]
    test_main();

    #[allow(clippy::empty_loop)]
    loop {}
}

#[cfg(not(test))]
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    println!("{}", info);
    loop {}
}

#[cfg(test)]
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    ros::test_panic_handler(info)
}
