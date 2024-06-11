use dep::std::hash::poseidon;
use dep::string_utils::String;

fn main(bid: Field, secret: Field, public_hash: Field) {
    // Hash the bid and secret using Poseidon
    let hash = poseidon::bn254::hash_2([bid, secret]);

    // Convert the public hash from string to Field (manually if needed)
    // let public_hash_field = String::new(public_hash);

    // Check if the public hash matches the hash of bid and secret
    assert(hash == public_hash);
}
