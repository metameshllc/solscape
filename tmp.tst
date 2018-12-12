digraph G {
  graph [ ratio = "auto", page = "100", compound = true ];
subgraph "clusterArbitrable" {
  graph [ label = "Arbitrable", color = "lightgray", style = "filled" ];
  "Arbitrable.assignArbitrator" [ label = "assignArbitrator" ];
}

subgraph "clusterArbitrationAssignment" {
  graph [ label = "ArbitrationAssignment", color = "lightgray", style = "filled" ];
  "ArbitrationAssignment.assignArbitrator" [ label = "assignArbitrator", color = "green" ];
}

subgraph "clusterArbitrationDemoContract" {
  graph [ label = "ArbitrationDemoContract", color = "lightgray", style = "filled" ];
}

subgraph "clusterEscrowDemoContract" {
  graph [ label = "EscrowDemoContract", color = "lightgray", style = "filled" ];
}

subgraph "clusterSingleAgentEscrowAssigner" {
  graph [ label = "SingleAgentEscrowAssigner", color = "lightgray", style = "filled" ];
  "SingleAgentEscrowAssigner.assignEscrowAgent" [ label = "assignEscrowAgent", color = "green" ];
}

subgraph "clusterSingleEscrowAgentAssignable" {
  graph [ label = "SingleEscrowAgentAssignable", color = "lightgray", style = "filled" ];
  "SingleEscrowAgentAssignable.assignEscrowAgent" [ label = "assignEscrowAgent", color = "green" ];
}

subgraph "clusterManaged" {
  graph [ label = "Managed", color = "lightgray", style = "filled" ];
  "Managed.<Constructor>" [ label = "<Constructor>", color = "green" ];
  "Managed.addManager" [ label = "addManager", color = "green" ];
  "Managed.managersOnly" [ label = "managersOnly", color = "yellow" ];
  "Managed.addressIsManager" [ label = "addressIsManager" ];
}

subgraph "clusterMigrations" {
  graph [ label = "Migrations", color = "lightgray", style = "filled" ];
  "Migrations.<Constructor>" [ label = "<Constructor>", color = "green" ];
  "Migrations.restricted" [ label = "restricted", color = "yellow" ];
  "Migrations.setCompleted" [ label = "setCompleted" ];
  "Migrations.upgrade" [ label = "upgrade", color = "green" ];
}

subgraph "clusterOneTimePayment" {
  graph [ label = "OneTimePayment", color = "lightgray", style = "filled" ];
  "OneTimePayment.<Fallback>" [ label = "<Fallback>", color = "blue" ];
  "OneTimePayment.recordPendingPayment" [ label = "recordPendingPayment", color = "green" ];
  "OneTimePayment.pendingPaymentInquiry" [ label = "pendingPaymentInquiry", color = "green" ];
  "OneTimePayment.generateKey" [ label = "generateKey" ];
}

subgraph "clusterRecurringPayment" {
  graph [ label = "RecurringPayment", color = "lightgray", style = "filled" ];
  "RecurringPayment.<Fallback>" [ label = "<Fallback>", color = "blue" ];
  "RecurringPayment.makePayment" [ label = "makePayment", color = "green" ];
  "RecurringPayment.requestRefund" [ label = "requestRefund", color = "green" ];
}

subgraph "clusterOneTimeTokenTransfer" {
  graph [ label = "OneTimeTokenTransfer", color = "lightgray", style = "filled" ];
  "OneTimeTokenTransfer.transfer" [ label = "transfer", color = "green" ];
}

subgraph "clusterTokenDemoContract" {
  graph [ label = "TokenDemoContract", color = "lightgray", style = "filled" ];
  "TokenDemoContract.<Constructor>" [ label = "<Constructor>", color = "green" ];
  "TokenDemoContract._mint" [ label = "_mint" ];
}

subgraph "clusterCapperRole" {
  graph [ label = "CapperRole", color = "lightgray", style = "filled" ];
  "CapperRole.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "CapperRole.onlyCapper" [ label = "onlyCapper", color = "yellow" ];
  "CapperRole.isCapper" [ label = "isCapper" ];
  "CapperRole.addCapper" [ label = "addCapper", color = "green" ];
  "CapperRole.renounceCapper" [ label = "renounceCapper", color = "green" ];
  "CapperRole._addCapper" [ label = "_addCapper" ];
  "CapperRole._removeCapper" [ label = "_removeCapper" ];
  "CapperRole._preValidatePurchase" [ label = "_preValidatePurchase" ];
  "CapperRole._updatePurchasingState" [ label = "_updatePurchasingState" ];
}

subgraph "clusterMinterRole" {
  graph [ label = "MinterRole", color = "lightgray", style = "filled" ];
  "MinterRole.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "MinterRole.onlyMinter" [ label = "onlyMinter", color = "yellow" ];
  "MinterRole.isMinter" [ label = "isMinter" ];
  "MinterRole.addMinter" [ label = "addMinter", color = "green" ];
  "MinterRole.renounceMinter" [ label = "renounceMinter", color = "green" ];
  "MinterRole._addMinter" [ label = "_addMinter" ];
  "MinterRole._removeMinter" [ label = "_removeMinter" ];
}

subgraph "clusterPauserRole" {
  graph [ label = "PauserRole", color = "lightgray", style = "filled" ];
  "PauserRole.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "PauserRole.onlyPauser" [ label = "onlyPauser", color = "yellow" ];
  "PauserRole.isPauser" [ label = "isPauser" ];
  "PauserRole.addPauser" [ label = "addPauser", color = "green" ];
  "PauserRole.renouncePauser" [ label = "renouncePauser", color = "green" ];
  "PauserRole._addPauser" [ label = "_addPauser" ];
  "PauserRole._removePauser" [ label = "_removePauser" ];
}

subgraph "clusterSignerRole" {
  graph [ label = "SignerRole", color = "lightgray", style = "filled" ];
  "SignerRole.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "SignerRole.onlySigner" [ label = "onlySigner", color = "yellow" ];
  "SignerRole.isSigner" [ label = "isSigner" ];
  "SignerRole.addSigner" [ label = "addSigner", color = "green" ];
  "SignerRole.renounceSigner" [ label = "renounceSigner", color = "green" ];
  "SignerRole._addSigner" [ label = "_addSigner" ];
  "SignerRole._removeSigner" [ label = "_removeSigner" ];
}

subgraph "clusterRoles" {
  graph [ label = "Roles", color = "lightgray", style = "filled" ];
  "Roles.add" [ label = "add", color = "white" ];
  "Roles.remove" [ label = "remove", color = "white" ];
  "Roles.has" [ label = "has" ];
}

subgraph "clusterCrowdsale" {
  graph [ label = "Crowdsale", color = "lightgray", style = "filled" ];
  "Crowdsale.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "Crowdsale.<Fallback>" [ label = "<Fallback>", color = "blue" ];
  "Crowdsale.token" [ label = "token", color = "green" ];
  "Crowdsale.wallet" [ label = "wallet", color = "green" ];
  "Crowdsale.rate" [ label = "rate", color = "green" ];
  "Crowdsale.weiRaised" [ label = "weiRaised", color = "green" ];
  "Crowdsale.buyTokens" [ label = "buyTokens" ];
  "Crowdsale._preValidatePurchase" [ label = "_preValidatePurchase" ];
  "Crowdsale._postValidatePurchase" [ label = "_postValidatePurchase" ];
  "Crowdsale._deliverTokens" [ label = "_deliverTokens", color = "white" ];
  "Crowdsale._processPurchase" [ label = "_processPurchase" ];
  "Crowdsale._updatePurchasingState" [ label = "_updatePurchasingState" ];
  "Crowdsale._getTokenAmount" [ label = "_getTokenAmount" ];
  "Crowdsale._forwardFunds" [ label = "_forwardFunds" ];
}

subgraph "clusterFinalizableCrowdsale" {
  graph [ label = "FinalizableCrowdsale", color = "lightgray", style = "filled" ];
  "FinalizableCrowdsale.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "FinalizableCrowdsale.finalized" [ label = "finalized", color = "green" ];
  "FinalizableCrowdsale.finalize" [ label = "finalize", color = "green" ];
  "FinalizableCrowdsale._finalization" [ label = "_finalization" ];
  "FinalizableCrowdsale.hasClosed" [ label = "hasClosed" ];
}

subgraph "clusterPostDeliveryCrowdsale" {
  graph [ label = "PostDeliveryCrowdsale", color = "lightgray", style = "filled" ];
  "PostDeliveryCrowdsale.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "PostDeliveryCrowdsale.withdrawTokens" [ label = "withdrawTokens", color = "green" ];
  "PostDeliveryCrowdsale.balanceOf" [ label = "balanceOf", color = "green" ];
  "Crowdsale._processPurchase" [ label = "_processPurchase", color = "white" ];
  "PostDeliveryCrowdsale.hasClosed" [ label = "hasClosed" ];
}

subgraph "clusterRefundableCrowdsale" {
  graph [ label = "RefundableCrowdsale", color = "lightgray", style = "filled" ];
  "RefundableCrowdsale.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "RefundableCrowdsale.goal" [ label = "goal", color = "green" ];
  "RefundableCrowdsale.claimRefund" [ label = "claimRefund", color = "green" ];
  "RefundableCrowdsale.goalReached" [ label = "goalReached" ];
  "FinalizableCrowdsale._finalization" [ label = "_finalization", color = "white" ];
  "Crowdsale._forwardFunds" [ label = "_forwardFunds", color = "white" ];
  "RefundableCrowdsale.wallet" [ label = "wallet" ];
  "RefundableCrowdsale.finalized" [ label = "finalized" ];
  "RefundableCrowdsale.weiRaised" [ label = "weiRaised" ];
}

subgraph "clusterAllowanceCrowdsale" {
  graph [ label = "AllowanceCrowdsale", color = "lightgray", style = "filled" ];
  "AllowanceCrowdsale.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "AllowanceCrowdsale.tokenWallet" [ label = "tokenWallet", color = "green" ];
  "AllowanceCrowdsale.remainingTokens" [ label = "remainingTokens", color = "green" ];
  "Crowdsale._deliverTokens" [ label = "_deliverTokens", color = "white" ];
  "AllowanceCrowdsale.token" [ label = "token" ];
}

subgraph "clusterMintedCrowdsale" {
  graph [ label = "MintedCrowdsale", color = "lightgray", style = "filled" ];
  "MintedCrowdsale.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "Crowdsale._deliverTokens" [ label = "_deliverTokens", color = "white" ];
  "MintedCrowdsale.token" [ label = "token" ];
}

subgraph "clusterIncreasingPriceCrowdsale" {
  graph [ label = "IncreasingPriceCrowdsale", color = "lightgray", style = "filled" ];
  "IncreasingPriceCrowdsale.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "IncreasingPriceCrowdsale.rate" [ label = "rate", color = "green" ];
  "IncreasingPriceCrowdsale.initialRate" [ label = "initialRate", color = "green" ];
  "IncreasingPriceCrowdsale.finalRate" [ label = "finalRate", color = "green" ];
  "IncreasingPriceCrowdsale.getCurrentRate" [ label = "getCurrentRate", color = "green" ];
  "Crowdsale._getTokenAmount" [ label = "_getTokenAmount", color = "white" ];
  "IncreasingPriceCrowdsale.isOpen" [ label = "isOpen" ];
  "IncreasingPriceCrowdsale.openingTime" [ label = "openingTime" ];
  "IncreasingPriceCrowdsale.closingTime" [ label = "closingTime" ];
}

subgraph "clusterCappedCrowdsale" {
  graph [ label = "CappedCrowdsale", color = "lightgray", style = "filled" ];
  "CappedCrowdsale.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "CappedCrowdsale.cap" [ label = "cap", color = "green" ];
  "CappedCrowdsale.capReached" [ label = "capReached", color = "green" ];
  "Crowdsale._preValidatePurchase" [ label = "_preValidatePurchase", color = "white" ];
  "CappedCrowdsale.weiRaised" [ label = "weiRaised" ];
}

subgraph "clusterIndividuallyCappedCrowdsale" {
  graph [ label = "IndividuallyCappedCrowdsale", color = "lightgray", style = "filled" ];
  "IndividuallyCappedCrowdsale.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "IndividuallyCappedCrowdsale.setCap" [ label = "setCap", color = "blue" ];
  "IndividuallyCappedCrowdsale.getCap" [ label = "getCap", color = "green" ];
  "IndividuallyCappedCrowdsale.getContribution" [ label = "getContribution", color = "green" ];
  "Crowdsale._preValidatePurchase" [ label = "_preValidatePurchase", color = "white" ];
  "Crowdsale._updatePurchasingState" [ label = "_updatePurchasingState", color = "white" ];
}

subgraph "clusterTimedCrowdsale" {
  graph [ label = "TimedCrowdsale", color = "lightgray", style = "filled" ];
  "TimedCrowdsale.onlyWhileOpen" [ label = "onlyWhileOpen", color = "yellow" ];
  "TimedCrowdsale.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "TimedCrowdsale.openingTime" [ label = "openingTime", color = "green" ];
  "TimedCrowdsale.closingTime" [ label = "closingTime", color = "green" ];
  "TimedCrowdsale.isOpen" [ label = "isOpen" ];
  "TimedCrowdsale.hasClosed" [ label = "hasClosed", color = "green" ];
  "Crowdsale._preValidatePurchase" [ label = "_preValidatePurchase", color = "white" ];
}

subgraph "clusterECDSA" {
  graph [ label = "ECDSA", color = "lightgray", style = "filled" ];
  "ECDSA.recover" [ label = "recover", color = "white" ];
  "ECDSA.toEthSignedMessageHash" [ label = "toEthSignedMessageHash", color = "white" ];
}

subgraph "clusterMerkleProof" {
  graph [ label = "MerkleProof", color = "lightgray", style = "filled" ];
  "MerkleProof.verify" [ label = "verify", color = "white" ];
}

subgraph "clusterCounter" {
  graph [ label = "Counter", color = "lightgray", style = "filled" ];
  "Counter.next" [ label = "next", color = "white" ];
}

subgraph "clusterERC20TokenMetadata" {
  graph [ label = "ERC20TokenMetadata", color = "lightgray", style = "filled" ];
  "ERC20TokenMetadata.tokenURI" [ label = "tokenURI", color = "blue" ];
}

subgraph "clusterERC20WithMetadata" {
  graph [ label = "ERC20WithMetadata", color = "lightgray", style = "filled" ];
  "ERC20WithMetadata.<Constructor>" [ label = "<Constructor>", color = "green" ];
  "ERC20WithMetadata.tokenURI" [ label = "tokenURI", color = "blue" ];
}

subgraph "clusterERC20Migrator" {
  graph [ label = "ERC20Migrator", color = "lightgray", style = "filled" ];
  "ERC20Migrator.<Constructor>" [ label = "<Constructor>", color = "green" ];
  "ERC20Migrator.legacyToken" [ label = "legacyToken", color = "green" ];
  "ERC20Migrator.newToken" [ label = "newToken", color = "green" ];
  "ERC20Migrator.beginMigration" [ label = "beginMigration", color = "green" ];
  "ERC20Migrator.migrate" [ label = "migrate", color = "green" ];
  "ERC20Migrator.migrateAll" [ label = "migrateAll", color = "green" ];
}

subgraph "clusterSignatureBouncer" {
  graph [ label = "SignatureBouncer", color = "lightgray", style = "filled" ];
  "SignatureBouncer.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "SignatureBouncer.onlyValidSignature" [ label = "onlyValidSignature", color = "yellow" ];
  "SignatureBouncer.onlyValidSignatureAndMethod" [ label = "onlyValidSignatureAndMethod", color = "yellow" ];
  "SignatureBouncer.onlyValidSignatureAndData" [ label = "onlyValidSignatureAndData", color = "yellow" ];
  "SignatureBouncer._isValidSignature" [ label = "_isValidSignature" ];
  "SignatureBouncer._isValidSignatureAndMethod" [ label = "_isValidSignatureAndMethod" ];
  "SignatureBouncer._isValidSignatureAndData" [ label = "_isValidSignatureAndData" ];
  "SignatureBouncer._isValidDataHash" [ label = "_isValidDataHash" ];
}

subgraph "clusterTokenVesting" {
  graph [ label = "TokenVesting", color = "lightgray", style = "filled" ];
  "TokenVesting.<Constructor>" [ label = "<Constructor>", color = "green" ];
  "TokenVesting.beneficiary" [ label = "beneficiary", color = "green" ];
  "TokenVesting.cliff" [ label = "cliff", color = "green" ];
  "TokenVesting.start" [ label = "start", color = "green" ];
  "TokenVesting.duration" [ label = "duration", color = "green" ];
  "TokenVesting.revocable" [ label = "revocable", color = "green" ];
  "TokenVesting.released" [ label = "released", color = "green" ];
  "TokenVesting.revoked" [ label = "revoked", color = "green" ];
  "TokenVesting.release" [ label = "release", color = "green" ];
  "TokenVesting.revoke" [ label = "revoke", color = "green" ];
  "TokenVesting._releasableAmount" [ label = "_releasableAmount" ];
  "TokenVesting._vestedAmount" [ label = "_vestedAmount" ];
  "TokenVesting.owner" [ label = "owner" ];
}

subgraph "clusterERC165Checker" {
  graph [ label = "ERC165Checker", color = "lightgray", style = "filled" ];
  "ERC165Checker._supportsERC165" [ label = "_supportsERC165", color = "white" ];
  "ERC165Checker._supportsInterface" [ label = "_supportsInterface", color = "white" ];
  "ERC165Checker._supportsAllInterfaces" [ label = "_supportsAllInterfaces", color = "white" ];
  "ERC165Checker._supportsERC165Interface" [ label = "_supportsERC165Interface" ];
  "ERC165Checker._callERC165SupportsInterface" [ label = "_callERC165SupportsInterface" ];
}

subgraph "clusterERC165" {
  graph [ label = "ERC165", color = "lightgray", style = "filled" ];
  "ERC165.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "ERC165.supportsInterface" [ label = "supportsInterface", color = "blue" ];
  "ERC165._registerInterface" [ label = "_registerInterface" ];
}

subgraph "clusterIERC165" {
  graph [ label = "IERC165", color = "lightgray", style = "filled" ];
  "IERC165.supportsInterface" [ label = "supportsInterface", color = "blue" ];
}

subgraph "clusterPausable" {
  graph [ label = "Pausable", color = "lightgray", style = "filled" ];
  "Pausable.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "Pausable.paused" [ label = "paused", color = "green" ];
  "Pausable.whenNotPaused" [ label = "whenNotPaused", color = "yellow" ];
  "Pausable.whenPaused" [ label = "whenPaused", color = "yellow" ];
  "Pausable.pause" [ label = "pause", color = "green" ];
  "Pausable.unpause" [ label = "unpause", color = "green" ];
  "Pausable.transfer" [ label = "transfer" ];
  "Pausable.transferFrom" [ label = "transferFrom" ];
  "Pausable.approve" [ label = "approve" ];
  "Pausable.increaseAllowance" [ label = "increaseAllowance" ];
  "Pausable.decreaseAllowance" [ label = "decreaseAllowance" ];
  "Pausable.setApprovalForAll" [ label = "setApprovalForAll" ];
}

subgraph "clusterMath" {
  graph [ label = "Math", color = "lightgray", style = "filled" ];
  "Math.min" [ label = "min", color = "white" ];
  "Math.max" [ label = "max", color = "white" ];
  "Math.average" [ label = "average" ];
}

subgraph "clusterSafeMath" {
  graph [ label = "SafeMath", color = "lightgray", style = "filled" ];
  "SafeMath.mul" [ label = "mul", color = "white" ];
  "SafeMath.div" [ label = "div", color = "white" ];
  "SafeMath.sub" [ label = "sub", color = "white" ];
  "SafeMath.add" [ label = "add", color = "white" ];
  "SafeMath.mod" [ label = "mod", color = "white" ];
}

subgraph "clusterOwnable" {
  graph [ label = "Ownable", color = "lightgray", style = "filled" ];
  "Ownable.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "Ownable.owner" [ label = "owner", color = "green" ];
  "Ownable.onlyOwner" [ label = "onlyOwner", color = "yellow" ];
  "Ownable.isOwner" [ label = "isOwner" ];
  "Ownable.renounceOwnership" [ label = "renounceOwnership", color = "green" ];
  "Ownable.transferOwnership" [ label = "transferOwnership", color = "green" ];
  "Ownable._transferOwnership" [ label = "_transferOwnership" ];
}

subgraph "clusterSecondary" {
  graph [ label = "Secondary", color = "lightgray", style = "filled" ];
  "Secondary.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "Secondary.onlyPrimary" [ label = "onlyPrimary", color = "yellow" ];
  "Secondary.primary" [ label = "primary", color = "green" ];
  "Secondary.transferPrimary" [ label = "transferPrimary", color = "green" ];
}

subgraph "clusterConditionalEscrow" {
  graph [ label = "ConditionalEscrow", color = "lightgray", style = "filled" ];
  "ConditionalEscrow.withdrawalAllowed" [ label = "withdrawalAllowed" ];
  "ConditionalEscrow.withdraw" [ label = "withdraw", color = "green" ];
  "ConditionalEscrow.deposit" [ label = "deposit" ];
}

subgraph "clusterEscrow" {
  graph [ label = "Escrow", color = "lightgray", style = "filled" ];
  "Escrow.withdraw" [ label = "withdraw", color = "green" ];
  "Escrow.depositsOf" [ label = "depositsOf" ];
  "Escrow.deposit" [ label = "deposit", color = "green" ];
}

subgraph "clusterRefundEscrow" {
  graph [ label = "RefundEscrow", color = "lightgray", style = "filled" ];
  "RefundEscrow.withdraw" [ label = "withdraw" ];
  "RefundEscrow.close" [ label = "close", color = "green" ];
  "RefundEscrow.beneficiaryWithdraw" [ label = "beneficiaryWithdraw", color = "green" ];
  "RefundEscrow.enableRefunds" [ label = "enableRefunds", color = "green" ];
  "RefundEscrow.<Constructor>" [ label = "<Constructor>", color = "green" ];
  "RefundEscrow.state" [ label = "state", color = "green" ];
  "RefundEscrow.beneficiary" [ label = "beneficiary", color = "green" ];
  "RefundEscrow.deposit" [ label = "deposit", color = "green" ];
  "ConditionalEscrow.withdrawalAllowed" [ label = "withdrawalAllowed", color = "green" ];
}

subgraph "clusterPaymentSplitter" {
  graph [ label = "PaymentSplitter", color = "lightgray", style = "filled" ];
  "PaymentSplitter.<Constructor>" [ label = "<Constructor>", color = "green" ];
  "PaymentSplitter.<Fallback>" [ label = "<Fallback>", color = "blue" ];
  "PaymentSplitter.totalShares" [ label = "totalShares", color = "green" ];
  "PaymentSplitter.totalReleased" [ label = "totalReleased", color = "green" ];
  "PaymentSplitter.shares" [ label = "shares", color = "green" ];
  "PaymentSplitter.released" [ label = "released", color = "green" ];
  "PaymentSplitter.payee" [ label = "payee", color = "green" ];
  "PaymentSplitter.release" [ label = "release", color = "green" ];
  "PaymentSplitter._addPayee" [ label = "_addPayee" ];
}

subgraph "clusterPullPayment" {
  graph [ label = "PullPayment", color = "lightgray", style = "filled" ];
  "PullPayment.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "PullPayment.withdrawPayments" [ label = "withdrawPayments", color = "green" ];
  "PullPayment.payments" [ label = "payments", color = "green" ];
  "PullPayment._asyncTransfer" [ label = "_asyncTransfer", color = "white" ];
}

subgraph "clusterERC20Burnable" {
  graph [ label = "ERC20Burnable", color = "lightgray", style = "filled" ];
  "ERC20Burnable.burn" [ label = "burn", color = "green" ];
  "ERC20Burnable.burnFrom" [ label = "burnFrom", color = "green" ];
  "ERC20Burnable._burn" [ label = "_burn" ];
  "ERC20Burnable._burnFrom" [ label = "_burnFrom" ];
}

subgraph "clusterERC20Capped" {
  graph [ label = "ERC20Capped", color = "lightgray", style = "filled" ];
  "ERC20Capped.<Constructor>" [ label = "<Constructor>", color = "green" ];
  "ERC20Capped.cap" [ label = "cap", color = "green" ];
  "ERC20Capped._mint" [ label = "_mint", color = "white" ];
  "ERC20Capped.totalSupply" [ label = "totalSupply" ];
}

subgraph "clusterERC20Detailed" {
  graph [ label = "ERC20Detailed", color = "lightgray", style = "filled" ];
  "ERC20Detailed.<Constructor>" [ label = "<Constructor>", color = "green" ];
  "ERC20Detailed.name" [ label = "name", color = "green" ];
  "ERC20Detailed.symbol" [ label = "symbol", color = "green" ];
  "ERC20Detailed.decimals" [ label = "decimals", color = "green" ];
}

subgraph "clusterERC20Mintable" {
  graph [ label = "ERC20Mintable", color = "lightgray", style = "filled" ];
  "ERC20Mintable.mint" [ label = "mint", color = "green" ];
  "ERC20Mintable._mint" [ label = "_mint" ];
}

subgraph "clusterERC20Pausable" {
  graph [ label = "ERC20Pausable", color = "lightgray", style = "filled" ];
  "ERC20Pausable.transfer" [ label = "transfer", color = "green" ];
  "IERC20.transferFrom" [ label = "transferFrom", color = "green" ];
  "ERC20Pausable.approve" [ label = "approve", color = "green" ];
  "ERC20Pausable.increaseAllowance" [ label = "increaseAllowance", color = "green" ];
  "ERC20Pausable.decreaseAllowance" [ label = "decreaseAllowance", color = "green" ];
}

subgraph "clusterERC20" {
  graph [ label = "ERC20", color = "lightgray", style = "filled" ];
  "ERC20.totalSupply" [ label = "totalSupply", color = "green" ];
  "IERC20.balanceOf" [ label = "balanceOf", color = "green" ];
  "IERC20.allowance" [ label = "allowance", color = "green" ];
  "ERC20.transfer" [ label = "transfer", color = "green" ];
  "ERC20.approve" [ label = "approve", color = "green" ];
  "IERC20.transferFrom" [ label = "transferFrom", color = "green" ];
  "ERC20.increaseAllowance" [ label = "increaseAllowance", color = "green" ];
  "ERC20.decreaseAllowance" [ label = "decreaseAllowance", color = "green" ];
  "ERC20._transfer" [ label = "_transfer" ];
  "ERC20._mint" [ label = "_mint", color = "white" ];
  "ERC20._burn" [ label = "_burn", color = "white" ];
  "ERC20._burnFrom" [ label = "_burnFrom", color = "white" ];
}

subgraph "clusterIERC20" {
  graph [ label = "IERC20", color = "lightgray", style = "filled" ];
  "IERC20.transferFrom" [ label = "transferFrom", color = "blue" ];
  "IERC20.safeTransfer" [ label = "safeTransfer" ];
  "IERC20.safeTransferFrom" [ label = "safeTransferFrom" ];
  "IERC20.balanceOf" [ label = "balanceOf", color = "blue" ];
  "IERC20.allowance" [ label = "allowance", color = "blue" ];
  "IERC20.totalSupply" [ label = "totalSupply", color = "blue" ];
  "IERC20.transfer" [ label = "transfer" ];
  "IERC20.approve" [ label = "approve" ];
}

subgraph "clusterSafeERC20" {
  graph [ label = "SafeERC20", color = "lightgray", style = "filled" ];
  "SafeERC20.safeTransfer" [ label = "safeTransfer", color = "white" ];
  "SafeERC20.safeTransferFrom" [ label = "safeTransferFrom", color = "white" ];
  "SafeERC20.safeApprove" [ label = "safeApprove", color = "white" ];
  "SafeERC20.safeIncreaseAllowance" [ label = "safeIncreaseAllowance", color = "white" ];
  "SafeERC20.safeDecreaseAllowance" [ label = "safeDecreaseAllowance", color = "white" ];
}

subgraph "clusterTokenTimelock" {
  graph [ label = "TokenTimelock", color = "lightgray", style = "filled" ];
  "TokenTimelock.<Constructor>" [ label = "<Constructor>", color = "green" ];
  "TokenTimelock.token" [ label = "token", color = "green" ];
  "TokenTimelock.beneficiary" [ label = "beneficiary", color = "green" ];
  "TokenTimelock.releaseTime" [ label = "releaseTime", color = "green" ];
  "TokenTimelock.release" [ label = "release", color = "green" ];
}

subgraph "clusterERC721Burnable" {
  graph [ label = "ERC721Burnable", color = "lightgray", style = "filled" ];
  "ERC721Burnable.burn" [ label = "burn", color = "green" ];
  "ERC721Burnable._isApprovedOrOwner" [ label = "_isApprovedOrOwner" ];
  "ERC721Burnable._burn" [ label = "_burn" ];
  "ERC721Burnable.ownerOf" [ label = "ownerOf" ];
}

subgraph "clusterERC721Enumerable" {
  graph [ label = "ERC721Enumerable", color = "lightgray", style = "filled" ];
  "ERC721Enumerable.<Constructor>" [ label = "<Constructor>", color = "green" ];
  "ERC721Enumerable.tokenOfOwnerByIndex" [ label = "tokenOfOwnerByIndex", color = "green" ];
  "ERC721Enumerable.totalSupply" [ label = "totalSupply" ];
  "ERC721Enumerable.tokenByIndex" [ label = "tokenByIndex", color = "green" ];
  "ERC721Enumerable._addTokenTo" [ label = "_addTokenTo", color = "white" ];
  "ERC721Enumerable._removeTokenFrom" [ label = "_removeTokenFrom", color = "white" ];
  "ERC721Enumerable._mint" [ label = "_mint", color = "white" ];
  "ERC721Enumerable._burn" [ label = "_burn", color = "white" ];
  "ERC721Enumerable.balanceOf" [ label = "balanceOf" ];
}

subgraph "clusterERC721Full" {
  graph [ label = "ERC721Full", color = "lightgray", style = "filled" ];
  "ERC721Full.<Constructor>" [ label = "<Constructor>", color = "green" ];
}

subgraph "clusterERC721Holder" {
  graph [ label = "ERC721Holder", color = "lightgray", style = "filled" ];
  "ERC721Holder.onERC721Received" [ label = "onERC721Received", color = "green" ];
}

subgraph "clusterERC721MetadataMintable" {
  graph [ label = "ERC721MetadataMintable", color = "lightgray", style = "filled" ];
  "ERC721MetadataMintable.mintWithTokenURI" [ label = "mintWithTokenURI", color = "green" ];
  "ERC721MetadataMintable._mint" [ label = "_mint" ];
  "ERC721MetadataMintable._setTokenURI" [ label = "_setTokenURI" ];
}

subgraph "clusterERC721Metadata" {
  graph [ label = "ERC721Metadata", color = "lightgray", style = "filled" ];
  "ERC721Metadata.<Constructor>" [ label = "<Constructor>", color = "green" ];
  "ERC721Metadata.name" [ label = "name", color = "blue" ];
  "ERC721Metadata.symbol" [ label = "symbol", color = "blue" ];
  "ERC721Metadata.tokenURI" [ label = "tokenURI", color = "blue" ];
  "ERC721Metadata._setTokenURI" [ label = "_setTokenURI", color = "white" ];
  "ERC721Metadata._burn" [ label = "_burn", color = "white" ];
  "ERC721Metadata._exists" [ label = "_exists" ];
}

subgraph "clusterERC721Mintable" {
  graph [ label = "ERC721Mintable", color = "lightgray", style = "filled" ];
  "ERC721Mintable.mint" [ label = "mint", color = "green" ];
  "ERC721Mintable._mint" [ label = "_mint" ];
}

subgraph "clusterERC721Pausable" {
  graph [ label = "ERC721Pausable", color = "lightgray", style = "filled" ];
  "Pausable.approve" [ label = "approve", color = "green" ];
  "ERC721Pausable.setApprovalForAll" [ label = "setApprovalForAll", color = "green" ];
  "Pausable.transferFrom" [ label = "transferFrom", color = "green" ];
}

subgraph "clusterERC721" {
  graph [ label = "ERC721", color = "lightgray", style = "filled" ];
  "ERC721.<Constructor>" [ label = "<Constructor>", color = "green" ];
  "ERC721.balanceOf" [ label = "balanceOf", color = "green" ];
  "ERC721.ownerOf" [ label = "ownerOf" ];
  "ERC721.approve" [ label = "approve", color = "green" ];
  "ERC721.getApproved" [ label = "getApproved", color = "green" ];
  "ERC721.setApprovalForAll" [ label = "setApprovalForAll", color = "green" ];
  "ERC721.isApprovedForAll" [ label = "isApprovedForAll" ];
  "ERC721.transferFrom" [ label = "transferFrom", color = "green" ];
  "ERC721.safeTransferFrom" [ label = "safeTransferFrom" ];
  "ERC721._exists" [ label = "_exists" ];
  "ERC721._isApprovedOrOwner" [ label = "_isApprovedOrOwner" ];
  "ERC721._mint" [ label = "_mint", color = "white" ];
  "ERC721._burn" [ label = "_burn", color = "white" ];
  "ERC721._addTokenTo" [ label = "_addTokenTo" ];
  "ERC721._removeTokenFrom" [ label = "_removeTokenFrom" ];
  "ERC721._checkOnERC721Received" [ label = "_checkOnERC721Received" ];
  "ERC721._clearApproval" [ label = "_clearApproval" ];
}

subgraph "clusterIERC721Enumerable" {
  graph [ label = "IERC721Enumerable", color = "lightgray", style = "filled" ];
  "IERC721Enumerable._addTokenTo" [ label = "_addTokenTo" ];
  "IERC721Enumerable._removeTokenFrom" [ label = "_removeTokenFrom" ];
  "IERC721Enumerable._mint" [ label = "_mint" ];
  "IERC721Enumerable._burn" [ label = "_burn" ];
  "IERC721Enumerable.totalSupply" [ label = "totalSupply", color = "green" ];
  "IERC721Enumerable.tokenOfOwnerByIndex" [ label = "tokenOfOwnerByIndex", color = "green" ];
  "IERC721Enumerable.tokenByIndex" [ label = "tokenByIndex", color = "green" ];
}

subgraph "clusterIERC721Full" {
  graph [ label = "IERC721Full", color = "lightgray", style = "filled" ];
}

subgraph "clusterIERC721Metadata" {
  graph [ label = "IERC721Metadata", color = "lightgray", style = "filled" ];
  "IERC721Metadata._burn" [ label = "_burn" ];
  "IERC721Metadata.name" [ label = "name", color = "blue" ];
  "IERC721Metadata.symbol" [ label = "symbol", color = "blue" ];
  "IERC721Metadata.tokenURI" [ label = "tokenURI", color = "blue" ];
}

subgraph "clusterIERC721Receiver" {
  graph [ label = "IERC721Receiver", color = "lightgray", style = "filled" ];
  "IERC721Receiver.onERC721Received" [ label = "onERC721Received", color = "green" ];
}

subgraph "clusterIERC721" {
  graph [ label = "IERC721", color = "lightgray", style = "filled" ];
  "IERC721.balanceOf" [ label = "balanceOf", color = "green" ];
  "IERC721.ownerOf" [ label = "ownerOf", color = "green" ];
  "IERC721.approve" [ label = "approve", color = "green" ];
  "IERC721.getApproved" [ label = "getApproved", color = "green" ];
  "IERC721.setApprovalForAll" [ label = "setApprovalForAll", color = "green" ];
  "IERC721.isApprovedForAll" [ label = "isApprovedForAll", color = "green" ];
  "IERC721.transferFrom" [ label = "transferFrom", color = "green" ];
  "IERC721.safeTransferFrom" [ label = "safeTransferFrom", color = "green" ];
}

subgraph "clusterAddress" {
  graph [ label = "Address", color = "lightgray", style = "filled" ];
  "Address.isContract" [ label = "isContract", color = "white" ];
}

subgraph "clusterArrays" {
  graph [ label = "Arrays", color = "lightgray", style = "filled" ];
  "Arrays.findUpperBound" [ label = "findUpperBound", color = "white" ];
}

subgraph "clusterReentrancyGuard" {
  graph [ label = "ReentrancyGuard", color = "lightgray", style = "filled" ];
  "ReentrancyGuard.<Constructor>" [ label = "<Constructor>", color = "white" ];
  "ReentrancyGuard.nonReentrant" [ label = "nonReentrant", color = "yellow" ];
}

subgraph "cluster[{"type":"MemberAccess","expression":{"type":"Identifier","name":"pending"},"memberName":"to"}]" {
  graph [ label = "[{"type":"MemberAccess","expression":{"type":"Identifier","name":"pending"},"memberName":"to"}]", color = "lightgray" ];
  "[{"type":"MemberAccess","expression":{"type":"Identifier","name":"pending"},"memberName":"to"}].transfer" [ label = "transfer" ];
}

subgraph "clusterabi" {
  graph [ label = "abi", color = "lightgray" ];
  "abi.encodePacked" [ label = "encodePacked" ];
  "abi.encodeWithSelector" [ label = "encodeWithSelector" ];
}

subgraph "cluster_to" {
  graph [ label = "_to", color = "lightgray" ];
  "_to.transfer" [ label = "transfer" ];
}

subgraph "clusterRoles.Role" {
  graph [ label = "Roles.Role", color = "lightgray" ];
  "Roles.Role.has" [ label = "has" ];
  "Roles.Role.add" [ label = "add" ];
  "Roles.Role.remove" [ label = "remove" ];
}

subgraph "cluster_weiRaised" {
  graph [ label = "_weiRaised", color = "lightgray" ];
  "_weiRaised.add" [ label = "add" ];
}

subgraph "clusterweiAmount" {
  graph [ label = "weiAmount", color = "lightgray" ];
  "weiAmount.mul" [ label = "mul" ];
}

subgraph "cluster_wallet" {
  graph [ label = "_wallet", color = "lightgray" ];
  "_wallet.transfer" [ label = "transfer" ];
}

subgraph "cluster_initialRate" {
  graph [ label = "_initialRate", color = "lightgray" ];
  "_initialRate.sub" [ label = "sub" ];
}

subgraph "clusterelapsedTime" {
  graph [ label = "elapsedTime", color = "lightgray" ];
  "elapsedTime.mul" [ label = "mul" ];
}

subgraph "clustercurrentRate" {
  graph [ label = "currentRate", color = "lightgray" ];
  "currentRate.mul" [ label = "mul" ];
}

subgraph "clusterhash" {
  graph [ label = "hash", color = "lightgray" ];
  "hash.toEthSignedMessageHash" [ label = "toEthSignedMessageHash" ];
}

subgraph "clusterstart" {
  graph [ label = "start", color = "lightgray" ];
  "start.add" [ label = "add" ];
}

subgraph "clusterbalance" {
  graph [ label = "balance", color = "lightgray" ];
  "balance.sub" [ label = "sub" ];
}

subgraph "clustercurrentBalance" {
  graph [ label = "currentBalance", color = "lightgray" ];
  "currentBalance.add" [ label = "add" ];
}

subgraph "cluster_start" {
  graph [ label = "_start", color = "lightgray" ];
  "_start.add" [ label = "add" ];
}

subgraph "clustertotalBalance" {
  graph [ label = "totalBalance", color = "lightgray" ];
  "totalBalance.mul" [ label = "mul" ];
}

subgraph "clusterpayee" {
  graph [ label = "payee", color = "lightgray" ];
  "payee.transfer" [ label = "transfer" ];
}

subgraph "cluster_beneficiary" {
  graph [ label = "_beneficiary", color = "lightgray" ];
  "_beneficiary.transfer" [ label = "transfer" ];
}

subgraph "clustertotalReceived" {
  graph [ label = "totalReceived", color = "lightgray" ];
  "totalReceived.mul" [ label = "mul" ];
}

subgraph "cluster_totalReleased" {
  graph [ label = "_totalReleased", color = "lightgray" ];
  "_totalReleased.add" [ label = "add" ];
}

subgraph "clusteraccount" {
  graph [ label = "account", color = "lightgray" ];
  "account.transfer" [ label = "transfer" ];
}

subgraph "cluster_totalShares" {
  graph [ label = "_totalShares", color = "lightgray" ];
  "_totalShares.add" [ label = "add" ];
}

subgraph "cluster_totalSupply" {
  graph [ label = "_totalSupply", color = "lightgray" ];
  "_totalSupply.add" [ label = "add" ];
  "_totalSupply.sub" [ label = "sub" ];
}

subgraph "clusterto" {
  graph [ label = "to", color = "lightgray" ];
  "to.isContract" [ label = "isContract" ];
}

  "ArbitrationAssignment.assignArbitrator";
  "Arbitrable.assignArbitrator";
  "SingleAgentEscrowAssigner.assignEscrowAgent";
  "SingleEscrowAgentAssignable.assignEscrowAgent";
  "Managed.managersOnly";
  "Managed.addressIsManager";
  "Migrations.upgrade";
  "Migrations.setCompleted";
  "OneTimePayment.";
  "[{"type":"MemberAccess","expression":{"type":"Identifier","name":"pending"},"memberName":"to"}].transfer";
  "OneTimePayment.recordPendingPayment";
  "OneTimePayment.generateKey";
  "OneTimePayment.pendingPaymentInquiry";
  "abi.encodePacked";
  "RecurringPayment.makePayment";
  "_to.transfer";
  "OneTimeTokenTransfer.transfer";
  "IERC20.transferFrom";
  "TokenDemoContract.null";
  "TokenDemoContract._mint";
  "CapperRole.null";
  "CapperRole._addCapper";
  "CapperRole.onlyCapper";
  "CapperRole.isCapper";
  "Roles.Role.has";
  "CapperRole.addCapper";
  "CapperRole.renounceCapper";
  "CapperRole._removeCapper";
  "Roles.Role.add";
  "Roles.Role.remove";
  "MinterRole.null";
  "MinterRole._addMinter";
  "MinterRole.onlyMinter";
  "MinterRole.isMinter";
  "MinterRole.addMinter";
  "MinterRole.renounceMinter";
  "MinterRole._removeMinter";
  "PauserRole.null";
  "PauserRole._addPauser";
  "PauserRole.onlyPauser";
  "PauserRole.isPauser";
  "PauserRole.addPauser";
  "PauserRole.renouncePauser";
  "PauserRole._removePauser";
  "SignerRole.null";
  "SignerRole._addSigner";
  "SignerRole.onlySigner";
  "SignerRole.isSigner";
  "SignerRole.addSigner";
  "SignerRole.renounceSigner";
  "SignerRole._removeSigner";
  "Roles.add";
  "Roles.has";
  "Roles.remove";
  "Crowdsale.";
  "Crowdsale.buyTokens";
  "Crowdsale._preValidatePurchase";
  "Crowdsale._getTokenAmount";
  "_weiRaised.add";
  "Crowdsale._processPurchase";
  "Crowdsale._updatePurchasingState";
  "Crowdsale._forwardFunds";
  "Crowdsale._postValidatePurchase";
  "Crowdsale._deliverTokens";
  "IERC20.safeTransfer";
  "weiAmount.mul";
  "_wallet.transfer";
  "FinalizableCrowdsale.finalize";
  "FinalizableCrowdsale.hasClosed";
  "FinalizableCrowdsale._finalization";
  "PostDeliveryCrowdsale.withdrawTokens";
  "PostDeliveryCrowdsale.hasClosed";
  "RefundableCrowdsale.null";
  "RefundableCrowdsale.wallet";
  "RefundableCrowdsale.claimRefund";
  "RefundableCrowdsale.finalized";
  "RefundableCrowdsale.goalReached";
  "RefundEscrow.withdraw";
  "RefundableCrowdsale.weiRaised";
  "RefundEscrow.close";
  "RefundEscrow.beneficiaryWithdraw";
  "RefundEscrow.enableRefunds";
  "AllowanceCrowdsale.remainingTokens";
  "Math.min";
  "AllowanceCrowdsale.token";
  "ERC20Mintable.mint";
  "MintedCrowdsale.token";
  "IncreasingPriceCrowdsale.getCurrentRate";
  "IncreasingPriceCrowdsale.isOpen";
  "IncreasingPriceCrowdsale.openingTime";
  "IncreasingPriceCrowdsale.closingTime";
  "_initialRate.sub";
  "elapsedTime.mul";
  "currentRate.mul";
  "CappedCrowdsale.capReached";
  "CappedCrowdsale.weiRaised";
  "CapperRole._preValidatePurchase";
  "CapperRole._updatePurchasingState";
  "TimedCrowdsale.onlyWhileOpen";
  "TimedCrowdsale.isOpen";
  "ECDSA.toEthSignedMessageHash";
  "MerkleProof.verify";
  "ERC20Migrator.beginMigration";
  "ERC20Migrator.migrate";
  "IERC20.safeTransferFrom";
  "ERC20Migrator.migrateAll";
  "IERC20.balanceOf";
  "IERC20.allowance";
  "SignatureBouncer.onlyValidSignature";
  "SignatureBouncer._isValidSignature";
  "SignatureBouncer.onlyValidSignatureAndMethod";
  "SignatureBouncer._isValidSignatureAndMethod";
  "SignatureBouncer.onlyValidSignatureAndData";
  "SignatureBouncer._isValidSignatureAndData";
  "SignatureBouncer._isValidDataHash";
  "hash.toEthSignedMessageHash";
  "TokenVesting.null";
  "start.add";
  "TokenVesting.release";
  "TokenVesting._releasableAmount";
  "TokenVesting.revoke";
  "balance.sub";
  "TokenVesting.owner";
  "TokenVesting._vestedAmount";
  "currentBalance.add";
  "_start.add";
  "totalBalance.mul";
  "ERC165Checker._supportsERC165";
  "ERC165Checker._supportsERC165Interface";
  "ERC165Checker._supportsInterface";
  "ERC165Checker._supportsAllInterfaces";
  "ERC165Checker._callERC165SupportsInterface";
  "abi.encodeWithSelector";
  "ERC165.null";
  "ERC165._registerInterface";
  "Ownable.onlyOwner";
  "Ownable.isOwner";
  "Ownable.transferOwnership";
  "Ownable._transferOwnership";
  "ConditionalEscrow.withdraw";
  "ConditionalEscrow.withdrawalAllowed";
  "Escrow.withdraw";
  "payee.transfer";
  "RefundEscrow.deposit";
  "ConditionalEscrow.deposit";
  "_beneficiary.transfer";
  "PaymentSplitter.null";
  "PaymentSplitter._addPayee";
  "PaymentSplitter.release";
  "totalReceived.mul";
  "_totalReleased.add";
  "account.transfer";
  "_totalShares.add";
  "PullPayment.withdrawPayments";
  "PullPayment.payments";
  "Escrow.depositsOf";
  "ERC20Burnable.burn";
  "ERC20Burnable._burn";
  "ERC20Burnable.burnFrom";
  "ERC20Burnable._burnFrom";
  "ERC20Capped._mint";
  "ERC20Capped.totalSupply";
  "ERC20Mintable._mint";
  "ERC20Pausable.transfer";
  "Pausable.transfer";
  "Pausable.transferFrom";
  "ERC20Pausable.approve";
  "Pausable.approve";
  "ERC20Pausable.increaseAllowance";
  "Pausable.increaseAllowance";
  "ERC20Pausable.decreaseAllowance";
  "Pausable.decreaseAllowance";
  "ERC20.transfer";
  "ERC20._transfer";
  "ERC20._mint";
  "_totalSupply.add";
  "ERC20._burn";
  "_totalSupply.sub";
  "ERC20._burnFrom";
  "SafeERC20.safeTransfer";
  "IERC20.transfer";
  "SafeERC20.safeTransferFrom";
  "SafeERC20.safeApprove";
  "IERC20.approve";
  "SafeERC20.safeIncreaseAllowance";
  "SafeERC20.safeDecreaseAllowance";
  "TokenTimelock.release";
  "ERC721Burnable.burn";
  "ERC721Burnable._isApprovedOrOwner";
  "ERC721Burnable._burn";
  "ERC721Burnable.ownerOf";
  "ERC721Enumerable.tokenOfOwnerByIndex";
  "ERC721Enumerable.balanceOf";
  "ERC721Enumerable.tokenByIndex";
  "ERC721Enumerable.totalSupply";
  "ERC721Enumerable._addTokenTo";
  "IERC721Enumerable._addTokenTo";
  "ERC721Enumerable._removeTokenFrom";
  "IERC721Enumerable._removeTokenFrom";
  "ERC721Enumerable._mint";
  "IERC721Enumerable._mint";
  "ERC721Enumerable._burn";
  "IERC721Enumerable._burn";
  "ERC721MetadataMintable.mintWithTokenURI";
  "ERC721MetadataMintable._mint";
  "ERC721MetadataMintable._setTokenURI";
  "ERC721Metadata.tokenURI";
  "ERC721Metadata._exists";
  "ERC721Metadata._setTokenURI";
  "ERC721Metadata._burn";
  "IERC721Metadata._burn";
  "ERC721Mintable.mint";
  "ERC721Mintable._mint";
  "ERC721Pausable.setApprovalForAll";
  "Pausable.setApprovalForAll";
  "ERC721.approve";
  "ERC721.ownerOf";
  "ERC721.isApprovedForAll";
  "ERC721.getApproved";
  "ERC721._exists";
  "ERC721.transferFrom";
  "ERC721._isApprovedOrOwner";
  "ERC721._clearApproval";
  "ERC721._removeTokenFrom";
  "ERC721._addTokenTo";
  "ERC721.safeTransferFrom";
  "ERC721._checkOnERC721Received";
  "ERC721._mint";
  "ERC721._burn";
  "to.isContract";
  "IERC721Receiver.onERC721Received";
  "Arrays.findUpperBound";
  "Math.average";
  "ArbitrationAssignment.assignArbitrator" -> "Arbitrable.assignArbitrator" [ color = "orange" ];
  "SingleAgentEscrowAssigner.assignEscrowAgent" -> "SingleEscrowAgentAssignable.assignEscrowAgent" [ color = "orange" ];
  "Managed.managersOnly" -> "Managed.addressIsManager" [ color = "green" ];
  "Migrations.upgrade" -> "Migrations.setCompleted" [ color = "orange" ];
  "OneTimePayment." -> "[{"type":"MemberAccess","expression":{"type":"Identifier","name":"pending"},"memberName":"to"}].transfer" [ color = "orange" ];
  "OneTimePayment.recordPendingPayment" -> "OneTimePayment.generateKey" [ color = "green" ];
  "OneTimePayment.pendingPaymentInquiry" -> "OneTimePayment.generateKey" [ color = "green" ];
  "OneTimePayment.generateKey" -> "abi.encodePacked" [ color = "orange" ];
  "RecurringPayment.makePayment" -> "_to.transfer" [ color = "orange" ];
  "OneTimeTokenTransfer.transfer" -> "IERC20.transferFrom" [ color = "orange" ];
  "TokenDemoContract.null" -> "TokenDemoContract._mint" [ color = "green" ];
  "CapperRole.null" -> "CapperRole._addCapper" [ color = "green" ];
  "CapperRole.onlyCapper" -> "CapperRole.isCapper" [ color = "green" ];
  "CapperRole.isCapper" -> "Roles.Role.has" [ color = "orange" ];
  "CapperRole.addCapper" -> "CapperRole._addCapper" [ color = "green" ];
  "CapperRole.renounceCapper" -> "CapperRole._removeCapper" [ color = "green" ];
  "CapperRole._addCapper" -> "Roles.Role.add" [ color = "orange" ];
  "CapperRole._removeCapper" -> "Roles.Role.remove" [ color = "orange" ];
  "MinterRole.null" -> "MinterRole._addMinter" [ color = "green" ];
  "MinterRole.onlyMinter" -> "MinterRole.isMinter" [ color = "green" ];
  "MinterRole.isMinter" -> "Roles.Role.has" [ color = "orange" ];
  "MinterRole.addMinter" -> "MinterRole._addMinter" [ color = "green" ];
  "MinterRole.renounceMinter" -> "MinterRole._removeMinter" [ color = "green" ];
  "MinterRole._addMinter" -> "Roles.Role.add" [ color = "orange" ];
  "MinterRole._removeMinter" -> "Roles.Role.remove" [ color = "orange" ];
  "PauserRole.null" -> "PauserRole._addPauser" [ color = "green" ];
  "PauserRole.onlyPauser" -> "PauserRole.isPauser" [ color = "green" ];
  "PauserRole.isPauser" -> "Roles.Role.has" [ color = "orange" ];
  "PauserRole.addPauser" -> "PauserRole._addPauser" [ color = "green" ];
  "PauserRole.renouncePauser" -> "PauserRole._removePauser" [ color = "green" ];
  "PauserRole._addPauser" -> "Roles.Role.add" [ color = "orange" ];
  "PauserRole._removePauser" -> "Roles.Role.remove" [ color = "orange" ];
  "SignerRole.null" -> "SignerRole._addSigner" [ color = "green" ];
  "SignerRole.onlySigner" -> "SignerRole.isSigner" [ color = "green" ];
  "SignerRole.isSigner" -> "Roles.Role.has" [ color = "orange" ];
  "SignerRole.addSigner" -> "SignerRole._addSigner" [ color = "green" ];
  "SignerRole.renounceSigner" -> "SignerRole._removeSigner" [ color = "green" ];
  "SignerRole._addSigner" -> "Roles.Role.add" [ color = "orange" ];
  "SignerRole._removeSigner" -> "Roles.Role.remove" [ color = "orange" ];
  "Roles.add" -> "Roles.has" [ color = "green" ];
  "Roles.remove" -> "Roles.has" [ color = "green" ];
  "Crowdsale." -> "Crowdsale.buyTokens" [ color = "green" ];
  "Crowdsale.buyTokens" -> "Crowdsale._preValidatePurchase" [ color = "green" ];
  "Crowdsale.buyTokens" -> "Crowdsale._getTokenAmount" [ color = "green" ];
  "Crowdsale.buyTokens" -> "_weiRaised.add" [ color = "orange" ];
  "Crowdsale.buyTokens" -> "Crowdsale._processPurchase" [ color = "green" ];
  "Crowdsale.buyTokens" -> "Crowdsale._updatePurchasingState" [ color = "green" ];
  "Crowdsale.buyTokens" -> "Crowdsale._forwardFunds" [ color = "green" ];
  "Crowdsale.buyTokens" -> "Crowdsale._postValidatePurchase" [ color = "green" ];
  "Crowdsale._deliverTokens" -> "IERC20.safeTransfer" [ color = "orange" ];
  "Crowdsale._processPurchase" -> "Crowdsale._deliverTokens" [ color = "green" ];
  "Crowdsale._getTokenAmount" -> "weiAmount.mul" [ color = "orange" ];
  "Crowdsale._forwardFunds" -> "_wallet.transfer" [ color = "orange" ];
  "FinalizableCrowdsale.finalize" -> "FinalizableCrowdsale.hasClosed" [ color = "green" ];
  "FinalizableCrowdsale.finalize" -> "FinalizableCrowdsale._finalization" [ color = "green" ];
  "PostDeliveryCrowdsale.withdrawTokens" -> "PostDeliveryCrowdsale.hasClosed" [ color = "green" ];
  "PostDeliveryCrowdsale.withdrawTokens" -> "Crowdsale._deliverTokens" [ color = "green" ];
  "RefundableCrowdsale.null" -> "RefundableCrowdsale.wallet" [ color = "green" ];
  "RefundableCrowdsale.claimRefund" -> "RefundableCrowdsale.finalized" [ color = "green" ];
  "RefundableCrowdsale.claimRefund" -> "RefundableCrowdsale.goalReached" [ color = "green" ];
  "RefundableCrowdsale.claimRefund" -> "RefundEscrow.withdraw" [ color = "orange" ];
  "RefundableCrowdsale.goalReached" -> "RefundableCrowdsale.weiRaised" [ color = "green" ];
  "FinalizableCrowdsale._finalization" -> "RefundableCrowdsale.goalReached" [ color = "green" ];
  "FinalizableCrowdsale._finalization" -> "RefundEscrow.close" [ color = "orange" ];
  "FinalizableCrowdsale._finalization" -> "RefundEscrow.beneficiaryWithdraw" [ color = "orange" ];
  "FinalizableCrowdsale._finalization" -> "RefundEscrow.enableRefunds" [ color = "orange" ];
  "FinalizableCrowdsale._finalization" -> "FinalizableCrowdsale._finalization" [ color = "orange" ];
  "AllowanceCrowdsale.remainingTokens" -> "Math.min" [ color = "orange" ];
  "AllowanceCrowdsale.remainingTokens" -> "AllowanceCrowdsale.token" [ color = "green" ];
  "AllowanceCrowdsale.remainingTokens" -> "AllowanceCrowdsale.token" [ color = "green" ];
  "Crowdsale._deliverTokens" -> "AllowanceCrowdsale.token" [ color = "green" ];
  "Crowdsale._deliverTokens" -> "ERC20Mintable.mint" [ color = "orange" ];
  "Crowdsale._deliverTokens" -> "MintedCrowdsale.token" [ color = "green" ];
  "IncreasingPriceCrowdsale.getCurrentRate" -> "IncreasingPriceCrowdsale.isOpen" [ color = "green" ];
  "IncreasingPriceCrowdsale.getCurrentRate" -> "IncreasingPriceCrowdsale.openingTime" [ color = "green" ];
  "IncreasingPriceCrowdsale.getCurrentRate" -> "IncreasingPriceCrowdsale.closingTime" [ color = "green" ];
  "IncreasingPriceCrowdsale.getCurrentRate" -> "IncreasingPriceCrowdsale.openingTime" [ color = "green" ];
  "IncreasingPriceCrowdsale.getCurrentRate" -> "_initialRate.sub" [ color = "orange" ];
  "IncreasingPriceCrowdsale.getCurrentRate" -> "_initialRate.sub" [ color = "orange" ];
  "IncreasingPriceCrowdsale.getCurrentRate" -> "elapsedTime.mul" [ color = "orange" ];
  "Crowdsale._getTokenAmount" -> "IncreasingPriceCrowdsale.getCurrentRate" [ color = "green" ];
  "Crowdsale._getTokenAmount" -> "currentRate.mul" [ color = "orange" ];
  "CappedCrowdsale.capReached" -> "CappedCrowdsale.weiRaised" [ color = "green" ];
  "Crowdsale._preValidatePurchase" -> "Crowdsale._preValidatePurchase" [ color = "orange" ];
  "Crowdsale._preValidatePurchase" -> "CappedCrowdsale.weiRaised" [ color = "green" ];
  "Crowdsale._preValidatePurchase" -> "CapperRole._preValidatePurchase" [ color = "orange" ];
  "Crowdsale._updatePurchasingState" -> "CapperRole._updatePurchasingState" [ color = "orange" ];
  "TimedCrowdsale.onlyWhileOpen" -> "TimedCrowdsale.isOpen" [ color = "green" ];
  "Crowdsale._preValidatePurchase" -> "Crowdsale._preValidatePurchase" [ color = "orange" ];
  "ECDSA.toEthSignedMessageHash" -> "abi.encodePacked" [ color = "orange" ];
  "MerkleProof.verify" -> "abi.encodePacked" [ color = "orange" ];
  "MerkleProof.verify" -> "abi.encodePacked" [ color = "orange" ];
  "ERC20Migrator.beginMigration" -> "MinterRole.isMinter" [ color = "orange" ];
  "ERC20Migrator.migrate" -> "IERC20.safeTransferFrom" [ color = "orange" ];
  "ERC20Migrator.migrate" -> "ERC20Mintable.mint" [ color = "orange" ];
  "ERC20Migrator.migrateAll" -> "IERC20.balanceOf" [ color = "orange" ];
  "ERC20Migrator.migrateAll" -> "IERC20.allowance" [ color = "orange" ];
  "ERC20Migrator.migrateAll" -> "Math.min" [ color = "orange" ];
  "ERC20Migrator.migrateAll" -> "ERC20Migrator.migrate" [ color = "green" ];
  "SignatureBouncer.onlyValidSignature" -> "SignatureBouncer._isValidSignature" [ color = "green" ];
  "SignatureBouncer.onlyValidSignatureAndMethod" -> "SignatureBouncer._isValidSignatureAndMethod" [ color = "green" ];
  "SignatureBouncer.onlyValidSignatureAndData" -> "SignatureBouncer._isValidSignatureAndData" [ color = "green" ];
  "SignatureBouncer._isValidSignature" -> "SignatureBouncer._isValidDataHash" [ color = "green" ];
  "SignatureBouncer._isValidSignature" -> "abi.encodePacked" [ color = "orange" ];
  "SignatureBouncer._isValidSignatureAndMethod" -> "SignatureBouncer._isValidDataHash" [ color = "green" ];
  "SignatureBouncer._isValidSignatureAndMethod" -> "abi.encodePacked" [ color = "orange" ];
  "SignatureBouncer._isValidSignatureAndData" -> "SignatureBouncer._isValidDataHash" [ color = "green" ];
  "SignatureBouncer._isValidSignatureAndData" -> "abi.encodePacked" [ color = "orange" ];
  "SignatureBouncer._isValidDataHash" -> "hash.toEthSignedMessageHash" [ color = "orange" ];
  "SignatureBouncer._isValidDataHash" -> "SignerRole.isSigner" [ color = "green" ];
  "TokenVesting.null" -> "start.add" [ color = "orange" ];
  "TokenVesting.null" -> "start.add" [ color = "orange" ];
  "TokenVesting.release" -> "TokenVesting._releasableAmount" [ color = "green" ];
  "TokenVesting.release" -> "IERC20.safeTransfer" [ color = "orange" ];
  "TokenVesting.revoke" -> "IERC20.balanceOf" [ color = "orange" ];
  "TokenVesting.revoke" -> "TokenVesting._releasableAmount" [ color = "green" ];
  "TokenVesting.revoke" -> "balance.sub" [ color = "orange" ];
  "TokenVesting.revoke" -> "IERC20.safeTransfer" [ color = "orange" ];
  "TokenVesting.revoke" -> "TokenVesting.owner" [ color = "green" ];
  "TokenVesting._releasableAmount" -> "TokenVesting._vestedAmount" [ color = "green" ];
  "TokenVesting._vestedAmount" -> "IERC20.balanceOf" [ color = "orange" ];
  "TokenVesting._vestedAmount" -> "currentBalance.add" [ color = "orange" ];
  "TokenVesting._vestedAmount" -> "_start.add" [ color = "orange" ];
  "TokenVesting._vestedAmount" -> "totalBalance.mul" [ color = "orange" ];
  "ERC165Checker._supportsERC165" -> "ERC165Checker._supportsERC165Interface" [ color = "green" ];
  "ERC165Checker._supportsERC165" -> "ERC165Checker._supportsERC165Interface" [ color = "green" ];
  "ERC165Checker._supportsInterface" -> "ERC165Checker._supportsERC165" [ color = "green" ];
  "ERC165Checker._supportsInterface" -> "ERC165Checker._supportsERC165Interface" [ color = "green" ];
  "ERC165Checker._supportsAllInterfaces" -> "ERC165Checker._supportsERC165" [ color = "green" ];
  "ERC165Checker._supportsAllInterfaces" -> "ERC165Checker._supportsERC165Interface" [ color = "green" ];
  "ERC165Checker._supportsERC165Interface" -> "ERC165Checker._callERC165SupportsInterface" [ color = "green" ];
  "ERC165Checker._callERC165SupportsInterface" -> "abi.encodeWithSelector" [ color = "orange" ];
  "ERC165.null" -> "ERC165._registerInterface" [ color = "green" ];
  "Ownable.onlyOwner" -> "Ownable.isOwner" [ color = "green" ];
  "Ownable.transferOwnership" -> "Ownable._transferOwnership" [ color = "green" ];
  "ConditionalEscrow.withdraw" -> "ConditionalEscrow.withdrawalAllowed" [ color = "green" ];
  "ConditionalEscrow.withdraw" -> "Escrow.withdraw" [ color = "orange" ];
  "Escrow.withdraw" -> "payee.transfer" [ color = "orange" ];
  "RefundEscrow.deposit" -> "ConditionalEscrow.deposit" [ color = "orange" ];
  "RefundEscrow.beneficiaryWithdraw" -> "_beneficiary.transfer" [ color = "orange" ];
  "PaymentSplitter.null" -> "PaymentSplitter._addPayee" [ color = "green" ];
  "PaymentSplitter.release" -> "totalReceived.mul" [ color = "orange" ];
  "PaymentSplitter.release" -> "_totalReleased.add" [ color = "orange" ];
  "PaymentSplitter.release" -> "account.transfer" [ color = "orange" ];
  "PaymentSplitter._addPayee" -> "_totalShares.add" [ color = "orange" ];
  "PullPayment.withdrawPayments" -> "Escrow.withdraw" [ color = "orange" ];
  "PullPayment.payments" -> "Escrow.depositsOf" [ color = "orange" ];
  "ERC20Burnable.burn" -> "ERC20Burnable._burn" [ color = "green" ];
  "ERC20Burnable.burnFrom" -> "ERC20Burnable._burnFrom" [ color = "green" ];
  "ERC20Capped._mint" -> "ERC20Capped.totalSupply" [ color = "green" ];
  "ERC20Capped._mint" -> "ERC20Mintable._mint" [ color = "orange" ];
  "ERC20Mintable.mint" -> "ERC20Mintable._mint" [ color = "green" ];
  "ERC20Pausable.transfer" -> "Pausable.transfer" [ color = "orange" ];
  "IERC20.transferFrom" -> "Pausable.transferFrom" [ color = "orange" ];
  "ERC20Pausable.approve" -> "Pausable.approve" [ color = "orange" ];
  "ERC20Pausable.increaseAllowance" -> "Pausable.increaseAllowance" [ color = "orange" ];
  "ERC20Pausable.decreaseAllowance" -> "Pausable.decreaseAllowance" [ color = "orange" ];
  "ERC20.transfer" -> "ERC20._transfer" [ color = "green" ];
  "IERC20.transferFrom" -> "ERC20._transfer" [ color = "green" ];
  "ERC20._mint" -> "_totalSupply.add" [ color = "orange" ];
  "ERC20._burn" -> "_totalSupply.sub" [ color = "orange" ];
  "ERC20._burnFrom" -> "ERC20._burn" [ color = "green" ];
  "SafeERC20.safeTransfer" -> "IERC20.transfer" [ color = "orange" ];
  "SafeERC20.safeTransferFrom" -> "IERC20.transferFrom" [ color = "orange" ];
  "SafeERC20.safeApprove" -> "IERC20.allowance" [ color = "orange" ];
  "SafeERC20.safeApprove" -> "IERC20.approve" [ color = "orange" ];
  "SafeERC20.safeIncreaseAllowance" -> "IERC20.allowance" [ color = "orange" ];
  "SafeERC20.safeIncreaseAllowance" -> "IERC20.approve" [ color = "orange" ];
  "SafeERC20.safeDecreaseAllowance" -> "IERC20.allowance" [ color = "orange" ];
  "SafeERC20.safeDecreaseAllowance" -> "IERC20.approve" [ color = "orange" ];
  "TokenTimelock.release" -> "IERC20.balanceOf" [ color = "orange" ];
  "TokenTimelock.release" -> "IERC20.safeTransfer" [ color = "orange" ];
  "ERC721Burnable.burn" -> "ERC721Burnable._isApprovedOrOwner" [ color = "green" ];
  "ERC721Burnable.burn" -> "ERC721Burnable._burn" [ color = "green" ];
  "ERC721Burnable.burn" -> "ERC721Burnable.ownerOf" [ color = "green" ];
  "ERC165.null" -> "ERC165._registerInterface" [ color = "green" ];
  "ERC721Enumerable.tokenOfOwnerByIndex" -> "ERC721Enumerable.balanceOf" [ color = "green" ];
  "ERC721Enumerable.tokenByIndex" -> "ERC721Enumerable.totalSupply" [ color = "green" ];
  "ERC721Enumerable._addTokenTo" -> "IERC721Enumerable._addTokenTo" [ color = "orange" ];
  "ERC721Enumerable._removeTokenFrom" -> "IERC721Enumerable._removeTokenFrom" [ color = "orange" ];
  "ERC721Enumerable._mint" -> "IERC721Enumerable._mint" [ color = "orange" ];
  "ERC721Enumerable._burn" -> "IERC721Enumerable._burn" [ color = "orange" ];
  "ERC721MetadataMintable.mintWithTokenURI" -> "ERC721MetadataMintable._mint" [ color = "green" ];
  "ERC721MetadataMintable.mintWithTokenURI" -> "ERC721MetadataMintable._setTokenURI" [ color = "green" ];
  "ERC165.null" -> "ERC165._registerInterface" [ color = "green" ];
  "ERC721Metadata.tokenURI" -> "ERC721Metadata._exists" [ color = "green" ];
  "ERC721Metadata._setTokenURI" -> "ERC721Metadata._exists" [ color = "green" ];
  "ERC721Metadata._burn" -> "IERC721Metadata._burn" [ color = "orange" ];
  "ERC721Mintable.mint" -> "ERC721Mintable._mint" [ color = "green" ];
  "Pausable.approve" -> "Pausable.approve" [ color = "orange" ];
  "ERC721Pausable.setApprovalForAll" -> "Pausable.setApprovalForAll" [ color = "orange" ];
  "Pausable.transferFrom" -> "Pausable.transferFrom" [ color = "orange" ];
  "ERC165.null" -> "ERC165._registerInterface" [ color = "green" ];
  "ERC721.approve" -> "ERC721.ownerOf" [ color = "green" ];
  "ERC721.approve" -> "ERC721.isApprovedForAll" [ color = "green" ];
  "ERC721.getApproved" -> "ERC721._exists" [ color = "green" ];
  "ERC721.transferFrom" -> "ERC721._isApprovedOrOwner" [ color = "green" ];
  "ERC721.transferFrom" -> "ERC721._clearApproval" [ color = "green" ];
  "ERC721.transferFrom" -> "ERC721._removeTokenFrom" [ color = "green" ];
  "ERC721.transferFrom" -> "ERC721._addTokenTo" [ color = "green" ];
  "ERC721.safeTransferFrom" -> "ERC721.safeTransferFrom" [ color = "green" ];
  "ERC721.safeTransferFrom" -> "ERC721.transferFrom" [ color = "green" ];
  "ERC721.safeTransferFrom" -> "ERC721._checkOnERC721Received" [ color = "green" ];
  "ERC721._isApprovedOrOwner" -> "ERC721.ownerOf" [ color = "green" ];
  "ERC721._isApprovedOrOwner" -> "ERC721.getApproved" [ color = "green" ];
  "ERC721._isApprovedOrOwner" -> "ERC721.isApprovedForAll" [ color = "green" ];
  "ERC721._mint" -> "ERC721._addTokenTo" [ color = "green" ];
  "ERC721._burn" -> "ERC721._clearApproval" [ color = "green" ];
  "ERC721._burn" -> "ERC721._removeTokenFrom" [ color = "green" ];
  "ERC721._removeTokenFrom" -> "ERC721.ownerOf" [ color = "green" ];
  "ERC721._checkOnERC721Received" -> "to.isContract" [ color = "orange" ];
  "ERC721._checkOnERC721Received" -> "IERC721Receiver.onERC721Received" [ color = "orange" ];
  "ERC721._clearApproval" -> "ERC721.ownerOf" [ color = "green" ];
  "Arrays.findUpperBound" -> "Math.average" [ color = "orange" ];


rankdir=LR
node [shape=plaintext]
subgraph cluster_01 { 
label = "Legend";
key [label=<<table border="0" cellpadding="2" cellspacing="0" cellborder="0">
  <tr><td align="right" port="i1">Internal Call</td></tr>
  <tr><td align="right" port="i2">External Call</td></tr>
  <tr><td align="right" port="i3">Defined Contract</td></tr>
  <tr><td align="right" port="i4">Undefined Contract</td></tr>
  </table>>]
key2 [label=<<table border="0" cellpadding="2" cellspacing="0" cellborder="0">
  <tr><td port="i1">&nbsp;&nbsp;&nbsp;</td></tr>
  <tr><td port="i2">&nbsp;&nbsp;&nbsp;</td></tr>
  <tr><td port="i3" bgcolor="lightgray">&nbsp;&nbsp;&nbsp;</td></tr>
  <tr><td port="i4">
    <table border="1" cellborder="0" cellspacing="0" cellpadding="7" color="lightgray">
      <tr>
       <td></td>
      </tr>
     </table>
  </td></tr>
  </table>>]
key:i1:e -> key2:i1:w [color=green]
key:i2:e -> key2:i2:w [color=orange]
}
}

