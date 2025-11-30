
module badge_nft::badge_nft {

    use sui::display;
    use std::string::{Self, String};
    use sui::package::{Self, Publisher};


    public struct BADGE_NFT has drop {}


    public struct BadgeNFT has key, store {
        id: UID,
        name: String,
        description: String,
        url: String,
    }

 
    fun init(otw: BADGE_NFT, ctx: &mut TxContext) {
        let publisher = package::claim(otw, ctx);
        transfer::public_transfer(publisher, tx_context::sender(ctx));
    }


    public entry fun mint(
        name: vector<u8>,
        description: vector<u8>, 
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let badge = BadgeNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: string::utf8(url),
        };

        transfer::public_transfer(badge, tx_context::sender(ctx));
    }


    public entry fun create_display(
        publisher: &Publisher,
        ctx: &mut TxContext
    ) {
        let mut display = display::new_with_fields<BadgeNFT>(
            publisher,
            vector[
                string::utf8(b"name"),
                string::utf8(b"description"),
                string::utf8(b"image_url")
            ],
            vector[
                string::utf8(b"{name}"),
                string::utf8(b"{description}"),
                string::utf8(b"{url}")
            ],
            ctx
        );

        display::update_version(&mut display);
        transfer::public_transfer(display, tx_context::sender(ctx));
    }
}