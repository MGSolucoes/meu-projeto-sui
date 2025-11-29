module hellopiaui::hellopiaui{

use std ::debug::print;
use std ::string::utf8;

fun pratica(){

print(&utf8(b"Hello, Piauí!"))
}

#[test]
fun test(){
pratica()
}
}