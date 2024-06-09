# Noir and Poseidon

## Noir

**Noir** is a domain-specific language designed for writing zero-knowledge proof circuits. It aims to provide a simple and expressive syntax for creating circuits that can be used in zk-SNARKs and other zero-knowledge proof systems.

### Key Features of Noir

- **Simplicity**: Noir is designed to be easy to read and write, even for those new to zero-knowledge proofs.
- **Expressiveness**: Provides constructs that make it straightforward to express complex cryptographic operations.
- **Integration with zk-SNARKs**: Optimized for generating efficient zk-SNARK circuits.

### Example Circuit in Noir

The following example demonstrates how to use the Poseidon hash function in a Noir circuit to hash a bid and a secret, check if the public hash matches the computed hash, and ensure the circuit's correctness.

## Poseidon

**Poseidon** is a cryptographic hash function specifically designed for efficiency in zero-knowledge proof systems. It is particularly well-suited for use in zk-SNARKs and zk-STARKs due to its low computational overhead and low number of constraints when used in arithmetic circuits.

### Key Features of Poseidon

- **ZKP Optimization**: Highly efficient in the context of zero-knowledge proofs, leading to faster proof generation and smaller proof sizes.
- **Low Computation Cost**: Requires fewer computational resources compared to traditional hash functions like SHA-256.
- **Low Constraint Count**: Optimized for use in arithmetic circuits, minimizing the number of constraints needed.
- **Security**: Provides strong cryptographic security properties suitable for ZKP applications.

### Benefits of Using Poseidon

1. **Efficiency**: Lower computational and constraint costs make Poseidon ideal for ZKP systems.
2. **Security**: Maintains strong cryptographic guarantees while being optimized for arithmetic circuits.
3. **Adoption**: Widely used in various zero-knowledge proof projects, demonstrating its utility and robustness.

### Poseidon in Noir

In the context of Noir, Poseidon can be used to create efficient hash operations within zk-SNARK circuits. By leveraging the optimized performance and security of Poseidon, developers can ensure their zero-knowledge proof systems are both robust and efficient.

### Summary

- **Noir**: A language for writing zero-knowledge proof circuits, designed for simplicity and expressiveness.
- **Poseidon**: A cryptographic hash function optimized for zero-knowledge proofs, offering efficiency and strong security properties.

By leveraging Noir for circuit design and Poseidon for efficient hashing, developers can create robust and efficient zero-knowledge proof systems suitable for various cryptographic applications.

# What is a Circuit in Zero-Knowledge Proofs?

In the realm of zero-knowledge proofs, a **circuit** is a formalized mathematical model that represents a computational task or logic. It is used to transform a computation into a form that can be efficiently proven and verified using cryptographic techniques.

## Key Concepts

### 1. Arithmetic Circuits
Arithmetic circuits are a type of circuit used in zk-SNARKs. They consist of gates and wires:
- **Gates**: Perform basic arithmetic operations like addition and multiplication.
- **Wires**: Connect the gates and carry values between them.

### 2. Inputs and Outputs
- **Inputs**: Values provided to the circuit to perform the computation.
- **Outputs**: Results produced by the circuit after performing the computation.

### 3. Constraints
Constraints are rules that must be satisfied for the computation to be considered valid. They ensure the integrity and correctness of the computation.

## How Circuits are Used

### Compiling the Circuit
When you write a program in a high-level language like Noir and compile it using `nargo compile`, the program is transformed into an arithmetic circuit represented in a JSON file.

### Generating Proofs
Using the compiled circuit, a prover can generate a proof that they know an input satisfying the circuit's constraints without revealing the input itself. This is done using the `nargo prove` command.

### Verifying Proofs
A verifier can check the validity of the proof using the compiled circuit and the `nargo verify` command. This process ensures that the prover performed the computation correctly without learning the prover's private inputs.

## Example Workflow

1. **Write the Circuit**: Write the logic of the computation in a high-level language like Noir.
2. **Compile the Circuit**: Use `nargo compile` to transform the program into an arithmetic circuit (JSON file).
3. **Generate a Proof**: Use `nargo prove` to create a proof based on the compiled circuit and inputs.
4. **Verify the Proof**: Use `nargo verify` to check the proof's validity against the circuit.

## Benefits

- **Privacy**: Provers can prove knowledge of a computation without revealing the actual inputs.
- **Efficiency**: Arithmetic circuits and zk-SNARKs allow for efficient proof generation and verification.

By using circuits, zero-knowledge proofs enable private and efficient verification of computations, which is particularly useful in various applications such as blockchain, privacy-preserving protocols, and secure multi-party computations.




# ZK flow 

## Compiled Circuit JSON File

When you run the `nargo compile` command, a JSON file is generated inside the `target` folder. This file contains the compiled circuit's intermediate representation and is essential for creating and verifying zero-knowledge proofs.

## Key Components

- **Circuit Definition**: Describes the circuit's inputs, outputs, gates, and constraints.
- **ACIR (Arithmetic Circuit Intermediate Representation)**: Standardized format for the arithmetic circuit.
- **Metadata**: Includes information like the circuit's name, compilation timestamp, and compiler version.

## Usage

- **Generating Proofs**: The JSON file is used by `nargo prove` to create proofs based on the circuit.
- **Verifying Proofs**: The JSON file is used by `nargo verify` to check the validity of the proofs.


Write code in the main.nr file which checks logic for proving. 

- Add the values into the Prover.toml
- run: `nargo prove -p filename`
    
    It will fail if you try to generate a false proof " Failed to solve program: 'Cannot satisfy constraint'

- Proof will be generated in proofs folder: proofs/InitialNftOffering.proof
- run: `nargo verify `
    
    When the command nargo verify is executed, two processes happen:

    1. Noir checks in the proofs directory for a proof file with the project name (eg. test_project.proof)

    2. If that file is found, the proof's validity is checked

- if the proof is valid the command line will not return anything and just pass, if its invalid proof provided it will fail with an error.