const circomlib = require('circomlibjs');

async function main() {
    const poseidon = await circomlib.buildPoseidon();

    // Example inputs
    const bid = 123;
    const secret = 456;

    // Compute the Poseidon hash
    const hashInput = [bid, secret];
    const publicHash = poseidon.F.toString(poseidon(hashInput));

    console.log(`Public hash: ${publicHash}`);
}

main().catch(console.error);
