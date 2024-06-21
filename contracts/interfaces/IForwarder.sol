interface IForwarder {
    struct ForwardRequest {
        address from;
        address to;
        uint256 value;
        uint256 gas;
        uint256 nonce;
        bytes data;
    }

    function getNonce(address from) external view returns (uint256);
    function verify(
        ForwardRequest calldata req,
        bytes32 domainSeparator,
        bytes32 requestTypeHash,
        bytes calldata suffixData,
        bytes calldata sig
    ) external view;
    function execute(
        ForwardRequest calldata req,
        bytes32 domainSeparator,
        bytes32 requestTypeHash,
        bytes calldata suffixData,
        bytes calldata sig
    ) external payable returns (bool, bytes memory);
    function registerRequestType(string calldata typeName, string calldata typeSuffix) external;
    function registerDomainSeparator(string calldata name, string calldata version) external;
}
