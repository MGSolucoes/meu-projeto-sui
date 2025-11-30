
module test2::test2{

use std ::string::String;

public struct HelloMessage has key, store{
    id: UID,
    text: String,
}

public entry fun create_message(
    text: String,
    ctx: &mut TxContext
){
    let message = HelloMessage {
        id: object::new(ctx),
        text: text,
    };
    transfer::transfer(message, tx_context::sender(ctx));
}
}



