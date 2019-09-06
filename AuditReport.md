# Solscape Report

 ## Line Count 
* **7780** Solidity lines exist in this contract system.
* but, only **7340** of those need audited.


## File Count 
* **43** Solidity files exist in this contract system.
* **40** of those files are recommended for auditing.

 ## File Lists

<details> 
<summary>Recommended Files for Auditing</summary> 

 ``` 
AccessToken.sol
AccessTokenUpgradeExample.sol
BrickblockAccount.sol
BrickblockFountainStub.sol
BrickblockFountainStub.sol
BrickblockToken.sol
BrickblockToken.sol
BrokenRemoteContractStub.sol
ContractRegistry.sol
CustomPOAToken.sol
CustomPOAToken.sol
EmployeeTokenSalaryPayout.sol
ExchangeRateProvider.sol
ExchangeRateProviderStub.sol
FeeManager.sol
IAccessToken.sol
IBrickblockToken.sol
IExchangeRateProvider.sol
IFeeManager.sol
IPoaCrowdsale.sol
IPoaManager.sol
IPoaTokenCrowdsale.sol
IPoaToken.sol
IRegistry.sol
IWhitelist.sol
OraclizeAPI.sol
PoaCommon.sol
PoaCrowdsale.sol
PoaLogger.sol
PoaManager.sol
PoaProxyCommon.sol
PoaProxy.sol
PoaToken.sol
RemoteContractStub.sol
RemoteContractUserStub.sol
SafeMathPower.sol
UpgradedPoa.sol
WarpTool.sol
WarpTool.sol
Whitelist.sol 

 ``` 
</details> 
<details> 
<summary>Recommended Files for Skipping</summary> 

 ``` 
ExchangeRates.sol
IExchangeRates.sol
Migrations.sol 

 ``` 
</details> 

 ## Surya Report 
<details> 
<summary>Description Report</summary> 


### Surya Describe 

 ``` 
 +  WarpTool 
    - [Pub] warp #

 +  BrickblockFountainStub (Ownable)
    - [Pub] <Constructor> #
    - [Pub] balanceOf
    - [Prv] updateAccount #
    - [Pub] lockCompanyFunds #
    - [Pub] lockBBT #
    - [Pub] claimCompanyTokens #

 +  BrickblockToken (PausableToken)
    - [Pub] <Constructor> #
    - [Ext] toggleDead #
    - [Prv] isContract
    - [Ext] changeFountainContractAddress #
    - [Ext] distributeTokens #
    - [Ext] distributeBonusTokens #
    - [Ext] finalizeTokenSale #
    - [Ext] <Fallback> #

 +  CustomPOAToken (PausableToken)
    - [Pub] <Constructor> #
    - [Pub] weiToTokens
    - [Pub] tokensToWei
    - [Pub] unpause #
    - [Prv] enterStage #
    - [Ext] whitelistAddress #
    - [Ext] blacklistAddress #
    - [Pub] whitelisted
    - [Pub] calculateFee
    - [Pub] buy ($)
    - [Ext] activate ($)
    - [Ext] terminate #
    - [Ext] kill #
    - [Pub] currentPayout
    - [Prv] settleUnclaimedPerTokenPayouts #
    - [Ext] setFailed #
    - [Ext] reclaim #
    - [Ext] payout ($)
    - [Ext] claim #
    - [Pub] transfer #
    - [Pub] transferFrom #
    - [Pub] <Fallback> ($)

 +  Whitelist (Ownable)
    - [Pub] addAddress #
    - [Pub] removeAddress #

 +  PoaProxyCommon 
    - [Pub] getContractAddress

 +  EmployeeTokenSalaryPayout (Ownable)
    - [Pub] <Constructor> #
    - [Pub] addEmployee #
    - [Pub] removeEmployee #
    - [Pub] updateQuarterlyAmount #
    - [Prv] payout #
    - [Pub] getTotalPayoutAmount
    - [Pub] distributePayouts #
    - [Pub] claimAll #

 +  ExchangeRateProvider (usingOraclize)
    - [Pub] <Constructor> #
    - [Ext] setCallbackGasPrice #
    - [Pub] sendQuery ($)
    - [Prv] setQueryId #
    - [Pub] __callback #
    - [Pub] selfDestruct #
    - [Pub] <Fallback> ($)

 + [Lib] SafeMathPower 
    - [Prv] add
    - [Prv] mul
    - [Prv] rmul
    - [Int] rpow

 +  WarpTool 
    - [Pub] warp #

 +  PoaLogger 
    - [Pub] <Constructor> #
    - [Ext] logStage #
    - [Ext] logBuy #
    - [Ext] logProofOfCustodyUpdated #
    - [Ext] logPayout #
    - [Ext] logClaim #
    - [Ext] logTerminated #
    - [Ext] logCustodianChanged #
    - [Ext] logReClaim #
    - [Ext] logProxyUpgraded #

 +  UpgradedPoa (PoaToken)
    - [Pub] setUpgrade #

 +  RemoteContractStub 
    - [Pub] <Constructor> #
    - [Pub] add
    - [Pub] setTestNumber #

 +  ExchangeRateProviderStub 
    - [Pub] <Constructor> #
    - [Ext] setCallbackGasPrice #
    - [Pub] sendQuery ($)
    - [Pub] setQueryId #
    - [Pub] simulate__callback #
    - [Int] parseInt
    - [Int] parseInt
    - [Pub] selfDestruct #
    - [Pub] <Fallback> ($)

 + [Int] RemoteContractStubInterface 
    - [Ext] testNumber
    - [Ext] add
    - [Ext] setTestNumber #

 +  RemoteContractUserStub 
    - [Pub] <Constructor> #
    - [Prv] getRemoteContractStub
    - [Pub] remoteAdd
    - [Pub] remoteTestNumber
    - [Pub] remoteSetNumber #

 +  BrokenRemoteContractStub 
    - [Pub] <Constructor> #
    - [Pub] add
    - [Pub] setTestNumber #

 +  BrickblockFountainStub (Ownable)
    - [Pub] <Constructor> #
    - [Pub] balanceOf
    - [Prv] updateAccount #
    - [Pub] lockCompanyFunds #
    - [Pub] lockBBT #
    - [Pub] claimCompanyTokens #

 +  OraclizeI 
    - [Ext] query ($)
    - [Ext] query_withGasLimit ($)
    - [Pub] query2 ($)
    - [Ext] query2_withGasLimit ($)
    - [Pub] queryN ($)
    - [Ext] queryN_withGasLimit ($)
    - [Pub] getPrice #
    - [Pub] getPrice #
    - [Ext] setProofType #
    - [Ext] setCustomGasPrice #
    - [Ext] randomDS_getSessionPubKeyHash

 +  OraclizeAddrResolverI 
    - [Pub] getAddress #

 + [Lib] Buffer 
    - [Int] init
    - [Prv] resize
    - [Prv] max
    - [Int] append
    - [Int] append
    - [Int] appendInt

 + [Lib] CBOR 
    - [Prv] encodeType
    - [Prv] encodeIndefiniteLengthType
    - [Int] encodeUInt
    - [Int] encodeInt
    - [Int] encodeBytes
    - [Int] encodeString
    - [Int] startArray
    - [Int] startMap
    - [Int] endSequence

 +  usingOraclize 
    - [Int] oraclize_setNetwork #
    - [Int] oraclize_setNetwork #
    - [Pub] __callback #
    - [Pub] __callback #
    - [Int] oraclize_getPrice #
    - [Int] oraclize_getPrice #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_query #
    - [Int] oraclize_cbAddress #
    - [Int] oraclize_setProof #
    - [Int] oraclize_setCustomGasPrice #
    - [Int] oraclize_randomDS_getSessionPubKeyHash #
    - [Int] getCodeSize
    - [Int] parseAddr
    - [Int] strCompare
    - [Int] indexOf
    - [Int] strConcat
    - [Int] strConcat
    - [Int] strConcat
    - [Int] strConcat
    - [Int] parseInt
    - [Int] parseInt
    - [Int] uint2str
    - [Int] stra2cbor
    - [Int] ba2cbor
    - [Int] oraclize_setNetworkName #
    - [Int] oraclize_getNetworkName
    - [Int] oraclize_newRandomDSQuery #
    - [Int] oraclize_randomDS_setCommitment #
    - [Int] verifySig #
    - [Int] oraclize_randomDS_proofVerify__sessionKeyValidity #
    - [Int] oraclize_randomDS_proofVerify__returnCode #
    - [Int] matchBytes32Prefix
    - [Int] oraclize_randomDS_proofVerify__main #
    - [Int] copyBytes
    - [Int] safer_ecrecover #
    - [Int] ecrecovery #
    - [Int] safeMemoryCleaner

 +  AccessToken (PausableToken)
    - [Pub] <Constructor> #
    - [Ext] lockedBbkOf
    - [Ext] lockBBK #
    - [Ext] unlockBBK #
    - [Ext] distribute #
    - [Prv] getMintedActFromCurrentLockPeriod
    - [Prv] settleCurrentLockPeriod #
    - [Pub] balanceOf
    - [Pub] transfer #
    - [Pub] transferFrom #
    - [Ext] burn #

 +  PoaCommon (PoaProxyCommon)
    - [Pub] proofOfCustody
    - [Int] enterStage #
    - [Pub] calculateFee
    - [Int] payFee #
    - [Int] isFiatInvestor
    - [Pub] isWhitelisted
    - [Int] to32LengthString
    - [Int] to64LengthString

 +  FeeManager 
    - [Pub] <Constructor> #
    - [Pub] weiToAct
    - [Pub] actToWei
    - [Pub] payFee ($)
    - [Pub] claimFee #

 +  PoaProxy (PoaProxyCommon)
    - [Pub] <Constructor> #
    - [Prv] isContract
    - [Pub] proxyChangeTokenMaster #
    - [Pub] proxyChangeCrowdsaleMaster #
    - [Ext] <Fallback> ($)

 +  BrickblockAccount (Ownable)
    - [Pub] <Constructor> #
    - [Ext] pullFunds #
    - [Ext] lockBBK #
    - [Ext] unlockBBK #
    - [Ext] claimFee #
    - [Ext] withdrawEthFunds #
    - [Ext] withdrawActFunds #
    - [Ext] withdrawBbkFunds #
    - [Pub] <Fallback> ($)

 +  AccessTokenUpgradeExample (AccessToken)
    - [Pub] <Constructor> #
    - [Pub] balanceOf

 +  ContractRegistry (Ownable)
    - [Pub] updateContractAddress #
    - [Pub] getContractAddress
    - [Pub] getContractAddress32

 + [Int] IRegistry 
    - [Ext] owner #
    - [Ext] updateContractAddress #
    - [Ext] getContractAddress

 + [Int] IAccessToken 
    - [Ext] lockBBK #
    - [Ext] unlockBBK #
    - [Ext] transfer #
    - [Ext] distribute #
    - [Ext] burn #

 + [Int] IPoaToken 
    - [Ext] initializeToken #
    - [Ext] pause #
    - [Ext] unpause #
    - [Ext] terminate #
    - [Ext] proofOfCustody
    - [Ext] toggleWhitelistTransfers #

 + [Int] IPoaCrowdsale 
    - [Ext] initializeCrowdsale #

 + [Int] IWhitelist 
    - [Ext] whitelisted #

 + [Int] IExchangeRateProvider 
    - [Ext] sendQuery ($)
    - [Ext] setCallbackGasPrice #
    - [Ext] selfDestruct #

 + [Int] IFeeManager 
    - [Ext] claimFee #
    - [Ext] payFee ($)

 + [Int] IPoaTokenCrowdsale 
    - [Ext] owner
    - [Ext] decimals
    - [Ext] totalPerTokenPayout
    - [Ext] whitelistTransfers
    - [Ext] initializeToken #
    - [Ext] changeCustodianAddress #
    - [Ext] terminate #
    - [Ext] pause #
    - [Ext] unpause #
    - [Ext] toggleWhitelistTransfers #
    - [Ext] name
    - [Ext] symbol
    - [Ext] isActivationFeePaid
    - [Ext] currentPayout
    - [Ext] payout ($)
    - [Ext] claim #
    - [Ext] updateProofOfCustody #
    - [Ext] balanceOf
    - [Ext] transfer #
    - [Ext] transferFrom #
    - [Ext] paused
    - [Ext] allowance
    - [Ext] approve #
    - [Ext] precisionOfPercentCalc #
    - [Ext] initializeCrowdsale #
    - [Ext] startFiatSale #
    - [Ext] startEthSale #
    - [Ext] calculateTokenAmountForAmountInCents #
    - [Ext] buyFiat #
    - [Ext] removeFiat #
    - [Ext] buy ($)
    - [Ext] calculateTotalFee
    - [Ext] payActivationFee ($)
    - [Ext] activate #
    - [Ext] setStageToTimedOut #
    - [Ext] reclaim #
    - [Ext] cancelFunding #
    - [Ext] getFiatRate
    - [Ext] percent #
    - [Ext] weiToFiatCents
    - [Ext] fiatCentsToWei
    - [Ext] fundedEthAmountInCents
    - [Ext] fundingGoalInWei
    - [Ext] fiatCurrency
    - [Ext] crowdsaleInitialized
    - [Ext] startTimeForEthFundingPeriod
    - [Ext] durationForEthFundingPeriod
    - [Ext] durationForActivationPeriod
    - [Ext] fundingGoalInCents
    - [Ext] fundedFiatAmountInCents
    - [Ext] broker
    - [Ext] checkFundingSuccessful #
    - [Ext] feeRateInPermille
    - [Ext] calculateFee
    - [Ext] getContractAddress
    - [Ext] isWhitelisted
    - [Ext] proofOfCustody
    - [Ext] stage
    - [Ext] totalSupply
    - [Ext] fundedFiatAmountInTokens
    - [Ext] fundedFiatAmountPerUserInTokens
    - [Ext] fundedEthAmountInWei
    - [Ext] fundedEthAmountPerUserInWei
    - [Ext] registry
    - [Ext] unclaimedPayoutTotals
    - [Ext] tokenInitialized
    - [Ext] poaCrowdsaleMaster
    - [Ext] custodian
    - [Ext] crowdsaleVersion
    - [Ext] tokenVersion
    - [Ext] poaTokenMaster

 + [Int] IBrickblockToken 
    - [Ext] transfer #
    - [Ext] transferFrom #
    - [Ext] balanceOf
    - [Ext] approve #

 + [Int] IPoaManager 
    - [Ext] getTokenStatus

 +  BrickblockToken (PausableToken)
    - [Pub] <Constructor> #
    - [Ext] toggleDead #
    - [Prv] isContract
    - [Ext] changeFountainContractAddress #
    - [Ext] distributeTokens #
    - [Ext] distributeBonusTokens #
    - [Ext] finalizeTokenSale #

 +  PoaToken (PoaCommon)
    - [Ext] initializeToken #
    - [Ext] changeCustodianAddress #
    - [Ext] terminate #
    - [Pub] transferOwnership #
    - [Pub] pause #
    - [Pub] unpause #
    - [Ext] toggleWhitelistTransfers #
    - [Ext] name
    - [Ext] symbol
    - [Pub] totalSupply
    - [Pub] currentPayout
    - [Int] settleUnclaimedPerTokenPayouts #
    - [Ext] payout ($)
    - [Ext] claim #
    - [Ext] updateProofOfCustody #
    - [Int] startingBalance
    - [Pub] balanceOf
    - [Pub] transfer #
    - [Pub] transferFrom #
    - [Pub] approve #
    - [Pub] increaseApproval #
    - [Pub] decreaseApproval #
    - [Pub] allowance
    - [Ext] <Fallback> ($)

 +  PoaManager (Ownable)
    - [Pub] <Constructor> #
    - [Prv] addEntity #
    - [Prv] removeEntity #
    - [Prv] setEntityActiveValue #
    - [Pub] getBrokerAddressList
    - [Pub] addBroker #
    - [Pub] removeBroker #
    - [Pub] listBroker #
    - [Pub] delistBroker #
    - [Pub] getBrokerStatus
    - [Pub] getTokenAddressList
    - [Prv] createPoaTokenProxy #
    - [Pub] addToken #
    - [Pub] removeToken #
    - [Pub] listToken #
    - [Pub] delistToken #
    - [Pub] getTokenStatus
    - [Pub] pauseToken #
    - [Pub] unpauseToken #
    - [Pub] terminateToken #
    - [Ext] upgradeToken #
    - [Ext] upgradeCrowdsale #
    - [Ext] toggleTokenWhitelistTransfers #

 +  PoaCrowdsale (PoaCommon)
    - [Ext] initializeCrowdsale #
    - [Ext] startFiatSale #
    - [Ext] startEthSale #
    - [Pub] calculateTokenAmountForAmountInCents
    - [Ext] buyFiat #
    - [Ext] removeFiat #
    - [Ext] buy ($)
    - [Int] applyFunding #
    - [Int] endFunding #
    - [Ext] checkFundingSuccessful #
    - [Pub] calculateTotalFee
    - [Pub] payActivationFee ($)
    - [Ext] activate #
    - [Ext] setStageToTimedOut #
    - [Ext] reclaim #
    - [Ext] cancelFunding #
    - [Pub] percent
    - [Pub] getFiatRate
    - [Pub] weiToFiatCents
    - [Pub] fiatCentsToWei
    - [Ext] fundedEthAmountInCents
    - [Ext] fundingGoalInWei
    - [Pub] fiatCurrency

 +  CustomPOAToken (PausableToken)
    - [Pub] <Constructor> #
    - [Pub] weiToTokens
    - [Pub] tokensToWei
    - [Pub] unpause #
    - [Prv] enterStage #
    - [Ext] whitelistAddress #
    - [Ext] blacklistAddress #
    - [Pub] whitelisted
    - [Pub] calculateFee
    - [Pub] buy ($)
    - [Ext] activate ($)
    - [Ext] terminate #
    - [Ext] kill #
    - [Pub] currentPayout
    - [Prv] settleUnclaimedPerTokenPayouts #
    - [Ext] setFailed #
    - [Ext] reclaim #
    - [Ext] payout ($)
    - [Ext] claim #
    - [Pub] transfer #
    - [Pub] transferFrom #
    - [Pub] <Fallback> ($)


 ($) = payable function
 # = non-constant function
  

 ``` 
</details> 
<details> 
<summary>Surya Parse Tree</summary> 


### Surya Parse 
 
 ``` 
├─ type: SourceUnit
└─ children
   ├─ 0
   │  ├─ type: PragmaDirective
   │  ├─ name: solidity
   │  └─ value: ^0.4.18
   └─ 1
      ├─ type: ContractDefinition
      ├─ name: WarpTool
      ├─ baseContracts
      ├─ subNodes
      │  ├─ 0
      │  │  ├─ type: StateVariableDeclaration
      │  │  ├─ variables
      │  │  │  └─ 0
      │  │  │     ├─ type: VariableDeclaration
      │  │  │     ├─ typeName
      │  │  │     │  ├─ type: ElementaryTypeName
      │  │  │     │  └─ name: bool
      │  │  │     ├─ name: state
      │  │  │     ├─ expression
      │  │  │     ├─ visibility: public
      │  │  │     ├─ isStateVar: true
      │  │  │     ├─ isDeclaredConst: false
      │  │  │     └─ isIndexed: false
      │  │  └─ initialValue
      │  └─ 1
      │     ├─ type: FunctionDefinition
      │     ├─ name: warp
      │     ├─ parameters
      │     ├─ returnParameters
      │     ├─ body
      │     │  ├─ type: Block
      │     │  └─ statements
      │     │     └─ 0
      │     │        ├─ type: ExpressionStatement
      │     │        └─ expression
      │     │           ├─ type: BinaryOperation
      │     │           ├─ operator: =
      │     │           ├─ left
      │     │           │  ├─ type: Identifier
      │     │           │  └─ name: state
      │     │           └─ right
      │     │              ├─ type: UnaryOperation
      │     │              ├─ operator: !
      │     │              ├─ subExpression
      │     │              │  ├─ type: Identifier
      │     │              │  └─ name: state
      │     │              └─ isPrefix: true
      │     ├─ visibility: public
      │     ├─ modifiers
      │     ├─ isConstructor: false
      │     └─ stateMutability
      └─ kind: contract


 ``` 
</details> 
<details> 
<summary>Markdown Report</summary> 

## Markdown Report 

## Sūrya's Description Report

### Files Description Table


|  File Name  |  SHA-1 Hash  |
|-------------|--------------|
| ../audits/brickblock-internal/frozen/contracts/tools/WarpTool.sol | c2e2f5b46c2382d5919a6a11852d8bd3718ea238 |
| ../audits/brickblock-internal/frozen/contracts/stubs/BrickblockFountainStub.sol | c50662a084170c9fa4e65593d3fc852425967585 |
| ../audits/brickblock-internal/frozen/contracts/BrickblockToken.sol | 1c0da6de7a744ef91bf81697e13641b4403acb44 |
| ../audits/brickblock-internal/frozen/contracts/CustomPOAToken.sol | f9fbc3ac29702b3635a1c46afafd57a1f945ec84 |
| ../audits/brickblock-internal/contracts/Whitelist.sol | f9ee42d089331581cece22b0318d6f026e3acef5 |
| ../audits/brickblock-internal/contracts/PoaProxyCommon.sol | ca072e37a336eeef8cd3cacf2f477a58f03c5d86 |
| ../audits/brickblock-internal/contracts/EmployeeTokenSalaryPayout.sol | b469b0ab7c2d750960a8f9bdd8275e8d5efa4de6 |
| ../audits/brickblock-internal/contracts/ExchangeRateProvider.sol | 8ff95e46f616e54fa282937296551959b1060924 |
| ../audits/brickblock-internal/contracts/tools/SafeMathPower.sol | 5b05eda9cd66514e99a9aa5c031e185033361fb2 |
| ../audits/brickblock-internal/contracts/tools/WarpTool.sol | c2e2f5b46c2382d5919a6a11852d8bd3718ea238 |
| ../audits/brickblock-internal/contracts/PoaLogger.sol | 348207ecfdf0500fed65326d3dd5f9075800ef05 |
| ../audits/brickblock-internal/contracts/stubs/UpgradedPoa.sol | e4148f2f920abf3cb4dd5b88269dde9149b5e5a8 |
| ../audits/brickblock-internal/contracts/stubs/RemoteContractStub.sol | e577382cee994745cf887a2cf6988c921919d209 |
| ../audits/brickblock-internal/contracts/stubs/ExchangeRateProviderStub.sol | 9a5c51435b9c818f8ca189e0db9308b7af608e0d |
| ../audits/brickblock-internal/contracts/stubs/RemoteContractUserStub.sol | 5d19faf1644c25c53f96dd7d0397904e27ad8347 |
| ../audits/brickblock-internal/contracts/stubs/BrokenRemoteContractStub.sol | 50af7680b2132804ea7222bcdd8fdefd4c8a8bdc |
| ../audits/brickblock-internal/contracts/stubs/BrickblockFountainStub.sol | ccf94b2700ac1df2ef3852a6b3cbc633aead812c |
| ../audits/brickblock-internal/contracts/OraclizeAPI.sol | c6ec1b0638dfe0ec46b28a1c5041aa0005c2b0fd |
| ../audits/brickblock-internal/contracts/AccessToken.sol | 3aa9c642e146278e5e16e0097cf3a4657f6296e4 |
| ../audits/brickblock-internal/contracts/PoaCommon.sol | ab72fe1f4047005f538c8cb89f5313550fa555d7 |
| ../audits/brickblock-internal/contracts/FeeManager.sol | cb3b8b8c6aaede9a2297d34f10ddddf77bf31fb5 |
| ../audits/brickblock-internal/contracts/PoaProxy.sol | 39b387af7d1b35ed21906f5ab3fc522705eeb6e9 |
| ../audits/brickblock-internal/contracts/BrickblockAccount.sol | 73164377ec36e5a83eb84fa61a9e0bdae9a0aa0c |
| ../audits/brickblock-internal/contracts/AccessTokenUpgradeExample.sol | 3de3ddf224ab6808a5f952ed2bf814d60ef60681 |
| ../audits/brickblock-internal/contracts/ContractRegistry.sol | 332034b817d85dd18f495b0f14e1caabfda8fece |
| ../audits/brickblock-internal/contracts/interfaces/IRegistry.sol | 5969b182a4a281d2dec5b07b3c33ad32b82f10bc |
| ../audits/brickblock-internal/contracts/interfaces/IAccessToken.sol | aabdc3fde0df3ac499bb9584a44c2883f9ce6909 |
| ../audits/brickblock-internal/contracts/interfaces/IPoaToken.sol | 84b1a4e01ab3de5b08dd3fbf5cf9707bc287c578 |
| ../audits/brickblock-internal/contracts/interfaces/IPoaCrowdsale.sol | c0eb6f8f27442d07998862875d83289564a7e77c |
| ../audits/brickblock-internal/contracts/interfaces/IWhitelist.sol | 3433869d0542bfd536f32eb50ea0131a68cca7e2 |
| ../audits/brickblock-internal/contracts/interfaces/IExchangeRateProvider.sol | c93cc72b1b14d3da7b68e9fabc894d03fd055959 |
| ../audits/brickblock-internal/contracts/interfaces/IFeeManager.sol | a7809299be159173bbf0d7d8bd5e7b2b86c3e7d7 |
| ../audits/brickblock-internal/contracts/interfaces/IPoaTokenCrowdsale.sol | cc1e79665fad538b1d76634c74a0b43d325ccf3e |
| ../audits/brickblock-internal/contracts/interfaces/IBrickblockToken.sol | 30f334e7fa99b21e7d7b6d22dd06769f362265d7 |
| ../audits/brickblock-internal/contracts/interfaces/IPoaManager.sol | 8010a090f641fb792c1d2b1cb85e3aea0867a939 |
| ../audits/brickblock-internal/contracts/BrickblockToken.sol | 823beb58155894100100252997f7660a2e5a91ef |
| ../audits/brickblock-internal/contracts/PoaToken.sol | 38481e5a1c853368ee605c9ee9828c1e6fee1297 |
| ../audits/brickblock-internal/contracts/PoaManager.sol | fff8ac355fb7df3d2821fa4a34587a98867a1ae2 |
| ../audits/brickblock-internal/contracts/PoaCrowdsale.sol | 26d2840ad4b9a70fee7f30e4baa438a33463c1a7 |
| ../audits/brickblock-internal/contracts/CustomPOAToken.sol | 5272d7edf789472b640748e52908115529d2f879 |


### Contracts Description Table


|  Contract  |         Type        |       Bases      |                  |                 |
|:----------:|:-------------------:|:----------------:|:----------------:|:---------------:|
|     └      |  **Function Name**  |  **Visibility**  |  **Mutability**  |  **Modifiers**  |
||||||
| **WarpTool** | Implementation |  |||
| └ | warp | Public ❗️ | 🛑  |NO❗️ |
||||||
| **BrickblockFountainStub** | Implementation | Ownable |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | balanceOf | Public ❗️ |   |NO❗️ |
| └ | updateAccount | Private 🔐 | 🛑  | |
| └ | lockCompanyFunds | Public ❗️ | 🛑  | onlyOwner |
| └ | lockBBT | Public ❗️ | 🛑  |NO❗️ |
| └ | claimCompanyTokens | Public ❗️ | 🛑  | onlyOwner |
||||||
| **BrickblockToken** | Implementation | PausableToken |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | toggleDead | External ❗️ | 🛑  | onlyOwner |
| └ | isContract | Private 🔐 |   | |
| └ | changeFountainContractAddress | External ❗️ | 🛑  | onlyOwner |
| └ | distributeTokens | External ❗️ | 🛑  | onlyOwner supplyAvailable |
| └ | distributeBonusTokens | External ❗️ | 🛑  | onlyOwner |
| └ | finalizeTokenSale | External ❗️ | 🛑  | onlyOwner |
| └ | \<Fallback\> | External ❗️ | 🛑  |NO❗️ |
||||||
| **CustomPOAToken** | Implementation | PausableToken |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | weiToTokens | Public ❗️ |   |NO❗️ |
| └ | tokensToWei | Public ❗️ |   |NO❗️ |
| └ | unpause | Public ❗️ | 🛑  | onlyOwner whenPaused |
| └ | enterStage | Private 🔐 | 🛑  | |
| └ | whitelistAddress | External ❗️ | 🛑  | onlyOwner atStage |
| └ | blacklistAddress | External ❗️ | 🛑  | onlyOwner atStage |
| └ | whitelisted | Public ❗️ |   |NO❗️ |
| └ | calculateFee | Public ❗️ |   |NO❗️ |
| └ | buy | Public ❗️ |  💵 | checkTimeout atStage isWhitelisted |
| └ | activate | External ❗️ |  💵 | checkTimeout onlyCustodian atStage |
| └ | terminate | External ❗️ | 🛑  | onlyCustodian atStage |
| └ | kill | External ❗️ | 🛑  | onlyOwner |
| └ | currentPayout | Public ❗️ |   |NO❗️ |
| └ | settleUnclaimedPerTokenPayouts | Private 🔐 | 🛑  | |
| └ | setFailed | External ❗️ | 🛑  | atStage checkTimeout |
| └ | reclaim | External ❗️ | 🛑  | checkTimeout atStage |
| └ | payout | External ❗️ |  💵 | atEitherStage onlyCustodian |
| └ | claim | External ❗️ | 🛑  | atEitherStage |
| └ | transfer | Public ❗️ | 🛑  | whenNotPaused |
| └ | transferFrom | Public ❗️ | 🛑  | whenNotPaused |
| └ | \<Fallback\> | Public ❗️ |  💵 |NO❗️ |
||||||
| **Whitelist** | Implementation | Ownable |||
| └ | addAddress | Public ❗️ | 🛑  | onlyOwner |
| └ | removeAddress | Public ❗️ | 🛑  | onlyOwner |
||||||
| **PoaProxyCommon** | Implementation |  |||
| └ | getContractAddress | Public ❗️ |   |NO❗️ |
||||||
| **EmployeeTokenSalaryPayout** | Implementation | Ownable |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | addEmployee | Public ❗️ | 🛑  | onlyOwner |
| └ | removeEmployee | Public ❗️ | 🛑  | onlyOwner |
| └ | updateQuarterlyAmount | Public ❗️ | 🛑  | onlyOwner |
| └ | payout | Private 🔐 | 🛑  | |
| └ | getTotalPayoutAmount | Public ❗️ |   |NO❗️ |
| └ | distributePayouts | Public ❗️ | 🛑  | onlyOwner |
| └ | claimAll | Public ❗️ | 🛑  | onlyOwner |
||||||
| **ExchangeRateProvider** | Implementation | usingOraclize |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | setCallbackGasPrice | External ❗️ | 🛑  | onlyExchangeRates |
| └ | sendQuery | Public ❗️ |  💵 | onlyAllowed |
| └ | setQueryId | Private 🔐 | 🛑  | |
| └ | __callback | Public ❗️ | 🛑  | onlyOraclizer |
| └ | selfDestruct | Public ❗️ | 🛑  | onlyExchangeRates |
| └ | \<Fallback\> | Public ❗️ |  💵 |NO❗️ |
||||||
| **SafeMathPower** | Library |  |||
| └ | add | Private 🔐 |   | |
| └ | mul | Private 🔐 |   | |
| └ | rmul | Private 🔐 |   | |
| └ | rpow | Internal 🔒 |   | |
||||||
| **WarpTool** | Implementation |  |||
| └ | warp | Public ❗️ | 🛑  |NO❗️ |
||||||
| **PoaLogger** | Implementation |  |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | logStage | External ❗️ | 🛑  | onlyActivePoaToken |
| └ | logBuy | External ❗️ | 🛑  | onlyActivePoaToken |
| └ | logProofOfCustodyUpdated | External ❗️ | 🛑  | onlyActivePoaToken |
| └ | logPayout | External ❗️ | 🛑  | onlyActivePoaToken |
| └ | logClaim | External ❗️ | 🛑  | onlyActivePoaToken |
| └ | logTerminated | External ❗️ | 🛑  | onlyActivePoaToken |
| └ | logCustodianChanged | External ❗️ | 🛑  | onlyActivePoaToken |
| └ | logReClaim | External ❗️ | 🛑  | onlyActivePoaToken |
| └ | logProxyUpgraded | External ❗️ | 🛑  | onlyActivePoaToken |
||||||
| **UpgradedPoa** | Implementation | PoaToken |||
| └ | setUpgrade | Public ❗️ | 🛑  |NO❗️ |
||||||
| **RemoteContractStub** | Implementation |  |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | add | Public ❗️ |   |NO❗️ |
| └ | setTestNumber | Public ❗️ | 🛑  |NO❗️ |
||||||
| **ExchangeRateProviderStub** | Implementation |  |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | setCallbackGasPrice | External ❗️ | 🛑  | onlyExchangeRates |
| └ | sendQuery | Public ❗️ |  💵 | onlyAllowed |
| └ | setQueryId | Public ❗️ | 🛑  |NO❗️ |
| └ | simulate__callback | Public ❗️ | 🛑  |NO❗️ |
| └ | parseInt | Internal 🔒 |   | |
| └ | parseInt | Internal 🔒 |   | |
| └ | selfDestruct | Public ❗️ | 🛑  | onlyExchangeRates |
| └ | \<Fallback\> | Public ❗️ |  💵 |NO❗️ |
||||||
| **RemoteContractStubInterface** | Interface |  |||
| └ | testNumber | External ❗️ |   |NO❗️ |
| └ | add | External ❗️ |   |NO❗️ |
| └ | setTestNumber | External ❗️ | 🛑  |NO❗️ |
||||||
| **RemoteContractUserStub** | Implementation |  |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | getRemoteContractStub | Private 🔐 |   | |
| └ | remoteAdd | Public ❗️ |   |NO❗️ |
| └ | remoteTestNumber | Public ❗️ |   |NO❗️ |
| └ | remoteSetNumber | Public ❗️ | 🛑  |NO❗️ |
||||||
| **BrokenRemoteContractStub** | Implementation |  |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | add | Public ❗️ |   |NO❗️ |
| └ | setTestNumber | Public ❗️ | 🛑  |NO❗️ |
||||||
| **BrickblockFountainStub** | Implementation | Ownable |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | balanceOf | Public ❗️ |   |NO❗️ |
| └ | updateAccount | Private 🔐 | 🛑  | |
| └ | lockCompanyFunds | Public ❗️ | 🛑  | onlyOwner |
| └ | lockBBT | Public ❗️ | 🛑  |NO❗️ |
| └ | claimCompanyTokens | Public ❗️ | 🛑  | onlyOwner |
||||||
| **OraclizeI** | Implementation |  |||
| └ | query | External ❗️ |  💵 |NO❗️ |
| └ | query_withGasLimit | External ❗️ |  💵 |NO❗️ |
| └ | query2 | Public ❗️ |  💵 |NO❗️ |
| └ | query2_withGasLimit | External ❗️ |  💵 |NO❗️ |
| └ | queryN | Public ❗️ |  💵 |NO❗️ |
| └ | queryN_withGasLimit | External ❗️ |  💵 |NO❗️ |
| └ | getPrice | Public ❗️ | 🛑  |NO❗️ |
| └ | getPrice | Public ❗️ | 🛑  |NO❗️ |
| └ | setProofType | External ❗️ | 🛑  |NO❗️ |
| └ | setCustomGasPrice | External ❗️ | 🛑  |NO❗️ |
| └ | randomDS_getSessionPubKeyHash | External ❗️ |   |NO❗️ |
||||||
| **OraclizeAddrResolverI** | Implementation |  |||
| └ | getAddress | Public ❗️ | 🛑  |NO❗️ |
||||||
| **Buffer** | Library |  |||
| └ | init | Internal 🔒 |   | |
| └ | resize | Private 🔐 |   | |
| └ | max | Private 🔐 |   | |
| └ | append | Internal 🔒 |   | |
| └ | append | Internal 🔒 |   | |
| └ | appendInt | Internal 🔒 |   | |
||||||
| **CBOR** | Library |  |||
| └ | encodeType | Private 🔐 |   | |
| └ | encodeIndefiniteLengthType | Private 🔐 |   | |
| └ | encodeUInt | Internal 🔒 |   | |
| └ | encodeInt | Internal 🔒 |   | |
| └ | encodeBytes | Internal 🔒 |   | |
| └ | encodeString | Internal 🔒 |   | |
| └ | startArray | Internal 🔒 |   | |
| └ | startMap | Internal 🔒 |   | |
| └ | endSequence | Internal 🔒 |   | |
||||||
| **usingOraclize** | Implementation |  |||
| └ | oraclize_setNetwork | Internal 🔒 | 🛑  | |
| └ | oraclize_setNetwork | Internal 🔒 | 🛑  | |
| └ | __callback | Public ❗️ | 🛑  |NO❗️ |
| └ | __callback | Public ❗️ | 🛑  |NO❗️ |
| └ | oraclize_getPrice | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_getPrice | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_query | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_cbAddress | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_setProof | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_setCustomGasPrice | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | oraclize_randomDS_getSessionPubKeyHash | Internal 🔒 | 🛑  | oraclizeAPI |
| └ | getCodeSize | Internal 🔒 |   | |
| └ | parseAddr | Internal 🔒 |   | |
| └ | strCompare | Internal 🔒 |   | |
| └ | indexOf | Internal 🔒 |   | |
| └ | strConcat | Internal 🔒 |   | |
| └ | strConcat | Internal 🔒 |   | |
| └ | strConcat | Internal 🔒 |   | |
| └ | strConcat | Internal 🔒 |   | |
| └ | parseInt | Internal 🔒 |   | |
| └ | parseInt | Internal 🔒 |   | |
| └ | uint2str | Internal 🔒 |   | |
| └ | stra2cbor | Internal 🔒 |   | |
| └ | ba2cbor | Internal 🔒 |   | |
| └ | oraclize_setNetworkName | Internal 🔒 | 🛑  | |
| └ | oraclize_getNetworkName | Internal 🔒 |   | |
| └ | oraclize_newRandomDSQuery | Internal 🔒 | 🛑  | |
| └ | oraclize_randomDS_setCommitment | Internal 🔒 | 🛑  | |
| └ | verifySig | Internal 🔒 | 🛑  | |
| └ | oraclize_randomDS_proofVerify__sessionKeyValidity | Internal 🔒 | 🛑  | |
| └ | oraclize_randomDS_proofVerify__returnCode | Internal 🔒 | 🛑  | |
| └ | matchBytes32Prefix | Internal 🔒 |   | |
| └ | oraclize_randomDS_proofVerify__main | Internal 🔒 | 🛑  | |
| └ | copyBytes | Internal 🔒 |   | |
| └ | safer_ecrecover | Internal 🔒 | 🛑  | |
| └ | ecrecovery | Internal 🔒 | 🛑  | |
| └ | safeMemoryCleaner | Internal 🔒 |   | |
||||||
| **AccessToken** | Implementation | PausableToken |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | lockedBbkOf | External ❗️ |   |NO❗️ |
| └ | lockBBK | External ❗️ | 🛑  |NO❗️ |
| └ | unlockBBK | External ❗️ | 🛑  |NO❗️ |
| └ | distribute | External ❗️ | 🛑  | onlyContract |
| └ | getMintedActFromCurrentLockPeriod | Private 🔐 |   | |
| └ | settleCurrentLockPeriod | Private 🔐 | 🛑  | |
| └ | balanceOf | Public ❗️ |   |NO❗️ |
| └ | transfer | Public ❗️ | 🛑  | whenNotPaused |
| └ | transferFrom | Public ❗️ | 🛑  | whenNotPaused |
| └ | burn | External ❗️ | 🛑  | onlyContract |
||||||
| **PoaCommon** | Implementation | PoaProxyCommon |||
| └ | proofOfCustody | Public ❗️ |   |NO❗️ |
| └ | enterStage | Internal 🔒 | 🛑  | |
| └ | calculateFee | Public ❗️ |   |NO❗️ |
| └ | payFee | Internal 🔒 | 🛑  | |
| └ | isFiatInvestor | Internal 🔒 |   | |
| └ | isWhitelisted | Public ❗️ |   |NO❗️ |
| └ | to32LengthString | Internal 🔒 |   | |
| └ | to64LengthString | Internal 🔒 |   | |
||||||
| **FeeManager** | Implementation |  |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | weiToAct | Public ❗️ |   |NO❗️ |
| └ | actToWei | Public ❗️ |   |NO❗️ |
| └ | payFee | Public ❗️ |  💵 |NO❗️ |
| └ | claimFee | Public ❗️ | 🛑  |NO❗️ |
||||||
| **PoaProxy** | Implementation | PoaProxyCommon |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | isContract | Private 🔐 |   | |
| └ | proxyChangeTokenMaster | Public ❗️ | 🛑  |NO❗️ |
| └ | proxyChangeCrowdsaleMaster | Public ❗️ | 🛑  |NO❗️ |
| └ | \<Fallback\> | External ❗️ |  💵 |NO❗️ |
||||||
| **BrickblockAccount** | Implementation | Ownable |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | pullFunds | External ❗️ | 🛑  | onlyOwner |
| └ | lockBBK | External ❗️ | 🛑  | onlyOwner |
| └ | unlockBBK | External ❗️ | 🛑  | onlyOwner |
| └ | claimFee | External ❗️ | 🛑  | onlyOwner |
| └ | withdrawEthFunds | External ❗️ | 🛑  | onlyOwner |
| └ | withdrawActFunds | External ❗️ | 🛑  | onlyOwner |
| └ | withdrawBbkFunds | External ❗️ | 🛑  | onlyOwner |
| └ | \<Fallback\> | Public ❗️ |  💵 |NO❗️ |
||||||
| **AccessTokenUpgradeExample** | Implementation | AccessToken |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | AccessToken |
| └ | balanceOf | Public ❗️ |   |NO❗️ |
||||||
| **ContractRegistry** | Implementation | Ownable |||
| └ | updateContractAddress | Public ❗️ | 🛑  | onlyOwner |
| └ | getContractAddress | Public ❗️ |   |NO❗️ |
| └ | getContractAddress32 | Public ❗️ |   |NO❗️ |
||||||
| **IRegistry** | Interface |  |||
| └ | owner | External ❗️ | 🛑  |NO❗️ |
| └ | updateContractAddress | External ❗️ | 🛑  |NO❗️ |
| └ | getContractAddress | External ❗️ |   |NO❗️ |
||||||
| **IAccessToken** | Interface |  |||
| └ | lockBBK | External ❗️ | 🛑  |NO❗️ |
| └ | unlockBBK | External ❗️ | 🛑  |NO❗️ |
| └ | transfer | External ❗️ | 🛑  |NO❗️ |
| └ | distribute | External ❗️ | 🛑  |NO❗️ |
| └ | burn | External ❗️ | 🛑  |NO❗️ |
||||||
| **IPoaToken** | Interface |  |||
| └ | initializeToken | External ❗️ | 🛑  |NO❗️ |
| └ | pause | External ❗️ | 🛑  |NO❗️ |
| └ | unpause | External ❗️ | 🛑  |NO❗️ |
| └ | terminate | External ❗️ | 🛑  |NO❗️ |
| └ | proofOfCustody | External ❗️ |   |NO❗️ |
| └ | toggleWhitelistTransfers | External ❗️ | 🛑  |NO❗️ |
||||||
| **IPoaCrowdsale** | Interface |  |||
| └ | initializeCrowdsale | External ❗️ | 🛑  |NO❗️ |
||||||
| **IWhitelist** | Interface |  |||
| └ | whitelisted | External ❗️ | 🛑  |NO❗️ |
||||||
| **IExchangeRateProvider** | Interface |  |||
| └ | sendQuery | External ❗️ |  💵 |NO❗️ |
| └ | setCallbackGasPrice | External ❗️ | 🛑  |NO❗️ |
| └ | selfDestruct | External ❗️ | 🛑  |NO❗️ |
||||||
| **IFeeManager** | Interface |  |||
| └ | claimFee | External ❗️ | 🛑  |NO❗️ |
| └ | payFee | External ❗️ |  💵 |NO❗️ |
||||||
| **IPoaTokenCrowdsale** | Interface |  |||
| └ | owner | External ❗️ |   |NO❗️ |
| └ | decimals | External ❗️ |   |NO❗️ |
| └ | totalPerTokenPayout | External ❗️ |   |NO❗️ |
| └ | whitelistTransfers | External ❗️ |   |NO❗️ |
| └ | initializeToken | External ❗️ | 🛑  |NO❗️ |
| └ | changeCustodianAddress | External ❗️ | 🛑  |NO❗️ |
| └ | terminate | External ❗️ | 🛑  |NO❗️ |
| └ | pause | External ❗️ | 🛑  |NO❗️ |
| └ | unpause | External ❗️ | 🛑  |NO❗️ |
| └ | toggleWhitelistTransfers | External ❗️ | 🛑  |NO❗️ |
| └ | name | External ❗️ |   |NO❗️ |
| └ | symbol | External ❗️ |   |NO❗️ |
| └ | isActivationFeePaid | External ❗️ |   |NO❗️ |
| └ | currentPayout | External ❗️ |   |NO❗️ |
| └ | payout | External ❗️ |  💵 |NO❗️ |
| └ | claim | External ❗️ | 🛑  |NO❗️ |
| └ | updateProofOfCustody | External ❗️ | 🛑  |NO❗️ |
| └ | balanceOf | External ❗️ |   |NO❗️ |
| └ | transfer | External ❗️ | 🛑  |NO❗️ |
| └ | transferFrom | External ❗️ | 🛑  |NO❗️ |
| └ | paused | External ❗️ |   |NO❗️ |
| └ | allowance | External ❗️ |   |NO❗️ |
| └ | approve | External ❗️ | 🛑  |NO❗️ |
| └ | precisionOfPercentCalc | External ❗️ | 🛑  |NO❗️ |
| └ | initializeCrowdsale | External ❗️ | 🛑  |NO❗️ |
| └ | startFiatSale | External ❗️ | 🛑  |NO❗️ |
| └ | startEthSale | External ❗️ | 🛑  |NO❗️ |
| └ | calculateTokenAmountForAmountInCents | External ❗️ | 🛑  |NO❗️ |
| └ | buyFiat | External ❗️ | 🛑  |NO❗️ |
| └ | removeFiat | External ❗️ | 🛑  |NO❗️ |
| └ | buy | External ❗️ |  💵 |NO❗️ |
| └ | calculateTotalFee | External ❗️ |   |NO❗️ |
| └ | payActivationFee | External ❗️ |  💵 |NO❗️ |
| └ | activate | External ❗️ | 🛑  |NO❗️ |
| └ | setStageToTimedOut | External ❗️ | 🛑  |NO❗️ |
| └ | reclaim | External ❗️ | 🛑  |NO❗️ |
| └ | cancelFunding | External ❗️ | 🛑  |NO❗️ |
| └ | getFiatRate | External ❗️ |   |NO❗️ |
| └ | percent | External ❗️ | 🛑  |NO❗️ |
| └ | weiToFiatCents | External ❗️ |   |NO❗️ |
| └ | fiatCentsToWei | External ❗️ |   |NO❗️ |
| └ | fundedEthAmountInCents | External ❗️ |   |NO❗️ |
| └ | fundingGoalInWei | External ❗️ |   |NO❗️ |
| └ | fiatCurrency | External ❗️ |   |NO❗️ |
| └ | crowdsaleInitialized | External ❗️ |   |NO❗️ |
| └ | startTimeForEthFundingPeriod | External ❗️ |   |NO❗️ |
| └ | durationForEthFundingPeriod | External ❗️ |   |NO❗️ |
| └ | durationForActivationPeriod | External ❗️ |   |NO❗️ |
| └ | fundingGoalInCents | External ❗️ |   |NO❗️ |
| └ | fundedFiatAmountInCents | External ❗️ |   |NO❗️ |
| └ | broker | External ❗️ |   |NO❗️ |
| └ | checkFundingSuccessful | External ❗️ | 🛑  |NO❗️ |
| └ | feeRateInPermille | External ❗️ |   |NO❗️ |
| └ | calculateFee | External ❗️ |   |NO❗️ |
| └ | getContractAddress | External ❗️ |   |NO❗️ |
| └ | isWhitelisted | External ❗️ |   |NO❗️ |
| └ | proofOfCustody | External ❗️ |   |NO❗️ |
| └ | stage | External ❗️ |   |NO❗️ |
| └ | totalSupply | External ❗️ |   |NO❗️ |
| └ | fundedFiatAmountInTokens | External ❗️ |   |NO❗️ |
| └ | fundedFiatAmountPerUserInTokens | External ❗️ |   |NO❗️ |
| └ | fundedEthAmountInWei | External ❗️ |   |NO❗️ |
| └ | fundedEthAmountPerUserInWei | External ❗️ |   |NO❗️ |
| └ | registry | External ❗️ |   |NO❗️ |
| └ | unclaimedPayoutTotals | External ❗️ |   |NO❗️ |
| └ | tokenInitialized | External ❗️ |   |NO❗️ |
| └ | poaCrowdsaleMaster | External ❗️ |   |NO❗️ |
| └ | custodian | External ❗️ |   |NO❗️ |
| └ | crowdsaleVersion | External ❗️ |   |NO❗️ |
| └ | tokenVersion | External ❗️ |   |NO❗️ |
| └ | poaTokenMaster | External ❗️ |   |NO❗️ |
||||||
| **IBrickblockToken** | Interface |  |||
| └ | transfer | External ❗️ | 🛑  |NO❗️ |
| └ | transferFrom | External ❗️ | 🛑  |NO❗️ |
| └ | balanceOf | External ❗️ |   |NO❗️ |
| └ | approve | External ❗️ | 🛑  |NO❗️ |
||||||
| **IPoaManager** | Interface |  |||
| └ | getTokenStatus | External ❗️ |   |NO❗️ |
||||||
| **BrickblockToken** | Implementation | PausableToken |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | toggleDead | External ❗️ | 🛑  | onlyOwner |
| └ | isContract | Private 🔐 |   | |
| └ | changeFountainContractAddress | External ❗️ | 🛑  | onlyOwner |
| └ | distributeTokens | External ❗️ | 🛑  | onlyOwner supplyAvailable |
| └ | distributeBonusTokens | External ❗️ | 🛑  | onlyOwner |
| └ | finalizeTokenSale | External ❗️ | 🛑  | onlyOwner |
||||||
| **PoaToken** | Implementation | PoaCommon |||
| └ | initializeToken | External ❗️ | 🛑  |NO❗️ |
| └ | changeCustodianAddress | External ❗️ | 🛑  | onlyCustodian |
| └ | terminate | External ❗️ | 🛑  | eitherCustodianOrOwner atStage |
| └ | transferOwnership | Public ❗️ | 🛑  | onlyOwner |
| └ | pause | Public ❗️ | 🛑  | onlyOwner whenNotPaused |
| └ | unpause | Public ❗️ | 🛑  | onlyOwner whenPaused atStage |
| └ | toggleWhitelistTransfers | External ❗️ | 🛑  | onlyOwner |
| └ | name | External ❗️ |   |NO❗️ |
| └ | symbol | External ❗️ |   |NO❗️ |
| └ | totalSupply | Public ❗️ |   |NO❗️ |
| └ | currentPayout | Public ❗️ |   |NO❗️ |
| └ | settleUnclaimedPerTokenPayouts | Internal 🔒 | 🛑  | |
| └ | payout | External ❗️ |  💵 | eitherBrokerOrCustodian atEitherStage |
| └ | claim | External ❗️ | 🛑  | atEitherStage |
| └ | updateProofOfCustody | External ❗️ | 🛑  | onlyCustodian validIpfsHash |
| └ | startingBalance | Internal 🔒 |   | |
| └ | balanceOf | Public ❗️ |   |NO❗️ |
| └ | transfer | Public ❗️ | 🛑  | whenNotPaused isTransferWhitelisted isTransferWhitelisted |
| └ | transferFrom | Public ❗️ | 🛑  | whenNotPaused isTransferWhitelisted isTransferWhitelisted |
| └ | approve | Public ❗️ | 🛑  | whenNotPaused |
| └ | increaseApproval | Public ❗️ | 🛑  | whenNotPaused |
| └ | decreaseApproval | Public ❗️ | 🛑  | whenNotPaused |
| └ | allowance | Public ❗️ |   |NO❗️ |
| └ | \<Fallback\> | External ❗️ |  💵 |NO❗️ |
||||||
| **PoaManager** | Implementation | Ownable |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | addEntity | Private 🔐 | 🛑  | |
| └ | removeEntity | Private 🔐 | 🛑  | |
| └ | setEntityActiveValue | Private 🔐 | 🛑  | |
| └ | getBrokerAddressList | Public ❗️ |   |NO❗️ |
| └ | addBroker | Public ❗️ | 🛑  | onlyOwner isNewBroker |
| └ | removeBroker | Public ❗️ | 🛑  | onlyOwner doesEntityExist |
| └ | listBroker | Public ❗️ | 🛑  | onlyOwner doesEntityExist |
| └ | delistBroker | Public ❗️ | 🛑  | onlyOwner doesEntityExist |
| └ | getBrokerStatus | Public ❗️ |   | doesEntityExist |
| └ | getTokenAddressList | Public ❗️ |   |NO❗️ |
| └ | createPoaTokenProxy | Private 🔐 | 🛑  | |
| └ | addToken | Public ❗️ | 🛑  | onlyActiveBroker |
| └ | removeToken | Public ❗️ | 🛑  | onlyOwner doesEntityExist |
| └ | listToken | Public ❗️ | 🛑  | onlyOwner doesEntityExist |
| └ | delistToken | Public ❗️ | 🛑  | onlyOwner doesEntityExist |
| └ | getTokenStatus | Public ❗️ |   | doesEntityExist |
| └ | pauseToken | Public ❗️ | 🛑  | onlyOwner |
| └ | unpauseToken | Public ❗️ | 🛑  | onlyOwner |
| └ | terminateToken | Public ❗️ | 🛑  | onlyOwner |
| └ | upgradeToken | External ❗️ | 🛑  | onlyOwner |
| └ | upgradeCrowdsale | External ❗️ | 🛑  | onlyOwner |
| └ | toggleTokenWhitelistTransfers | External ❗️ | 🛑  | onlyOwner |
||||||
| **PoaCrowdsale** | Implementation | PoaCommon |||
| └ | initializeCrowdsale | External ❗️ | 🛑  |NO❗️ |
| └ | startFiatSale | External ❗️ | 🛑  | onlyBroker atStage |
| └ | startEthSale | External ❗️ | 🛑  | atEitherStage |
| └ | calculateTokenAmountForAmountInCents | Public ❗️ |   |NO❗️ |
| └ | buyFiat | External ❗️ | 🛑  | atStage onlyCustodian |
| └ | removeFiat | External ❗️ | 🛑  | atStage onlyCustodian |
| └ | buy | External ❗️ |  💵 | checkTimeout atStage isBuyWhitelisted |
| └ | applyFunding | Internal 🔒 | 🛑  | |
| └ | endFunding | Internal 🔒 | 🛑  | |
| └ | checkFundingSuccessful | External ❗️ | 🛑  | atEitherStage |
| └ | calculateTotalFee | Public ❗️ |   | atStage |
| └ | payActivationFee | Public ❗️ |  💵 | atStage |
| └ | activate | External ❗️ | 🛑  | checkTimeout onlyCustodian atStage |
| └ | setStageToTimedOut | External ❗️ | 🛑  | atEitherStage checkTimeout |
| └ | reclaim | External ❗️ | 🛑  | checkTimeout atStage |
| └ | cancelFunding | External ❗️ | 🛑  | onlyCustodian atEitherStage |
| └ | percent | Public ❗️ |   |NO❗️ |
| └ | getFiatRate | Public ❗️ |   |NO❗️ |
| └ | weiToFiatCents | Public ❗️ |   |NO❗️ |
| └ | fiatCentsToWei | Public ❗️ |   |NO❗️ |
| └ | fundedEthAmountInCents | External ❗️ |   |NO❗️ |
| └ | fundingGoalInWei | External ❗️ |   |NO❗️ |
| └ | fiatCurrency | Public ❗️ |   |NO❗️ |
||||||
| **CustomPOAToken** | Implementation | PausableToken |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | weiToTokens | Public ❗️ |   |NO❗️ |
| └ | tokensToWei | Public ❗️ |   |NO❗️ |
| └ | unpause | Public ❗️ | 🛑  | onlyOwner whenPaused |
| └ | enterStage | Private 🔐 | 🛑  | |
| └ | whitelistAddress | External ❗️ | 🛑  | onlyOwner atStage |
| └ | blacklistAddress | External ❗️ | 🛑  | onlyOwner atStage |
| └ | whitelisted | Public ❗️ |   |NO❗️ |
| └ | calculateFee | Public ❗️ |   |NO❗️ |
| └ | buy | Public ❗️ |  💵 | checkTimeout atStage isWhitelisted |
| └ | activate | External ❗️ |  💵 | checkTimeout onlyCustodian atStage |
| └ | terminate | External ❗️ | 🛑  | onlyCustodian atStage |
| └ | kill | External ❗️ | 🛑  | onlyOwner |
| └ | currentPayout | Public ❗️ |   |NO❗️ |
| └ | settleUnclaimedPerTokenPayouts | Private 🔐 | 🛑  | |
| └ | setFailed | External ❗️ | 🛑  | atStage checkTimeout |
| └ | reclaim | External ❗️ | 🛑  | checkTimeout atStage |
| └ | payout | External ❗️ |  💵 | atEitherStage onlyCustodian |
| └ | claim | External ❗️ | 🛑  | atEitherStage |
| └ | transfer | Public ❗️ | 🛑  | whenNotPaused |
| └ | transferFrom | Public ❗️ | 🛑  | whenNotPaused |
| └ | \<Fallback\> | Public ❗️ |  💵 |NO❗️ |


### Legend

|  Symbol  |  Meaning  |
|:--------:|-----------|
|    🛑    | Function can modify state |
|    💵    | Function is payable |
</details> 
<details> 
<summary>Inheritance Graph</summary> 


 ## Inheritance Graph

**Surya's Inheritance Graph** creates an exhaustive visualization of parent and child contracts.
![Inheritance Graph](InheritanceGraph.png)

</details> 
<details> 
<summary>Call Graph</summary> 

## Call Graph 

**Surya's Call Graph** creates an exhaustive visualization of all function calls.
![Call Graph](CallGraph.png) 

</details> 

 # Analysis Report 

 <details> 
<summary>Solhint Report</summary> 

```

../audits/brickblock-internal/frozen/contracts/tools/WarpTool.sol
   7:3  error  Expected indentation of 4 spaces but found 2  indent
   9:3  error  Expected indentation of 4 spaces but found 2  indent
  11:3  error  Indentation is incorrect                      indent
  12:5  error  Expected indentation of 8 spaces but found 4  indent
  13:3  error  Expected indentation of 4 spaces but found 2  indent

../audits/brickblock-internal/frozen/contracts/stubs/BrickblockFountainStub.sol
  10:3  error  Expected indentation of 4 spaces but found 2  indent
  12:3  error  Expected indentation of 4 spaces but found 2  indent
  13:5  error  Expected indentation of 8 spaces but found 4  indent
  14:5  error  Expected indentation of 8 spaces but found 4  indent
  15:5  error  Expected indentation of 8 spaces but found 4  indent
  16:3  error  Expected indentation of 4 spaces but found 2  indent
  18:3  error  Expected indentation of 4 spaces but found 2  indent
  21:3  error  Expected indentation of 4 spaces but found 2  indent
  22:3  error  Expected indentation of 4 spaces but found 2  indent
  24:3  error  Expected indentation of 4 spaces but found 2  indent
  25:3  error  Expected indentation of 4 spaces but found 2  indent
  26:3  error  Expected indentation of 4 spaces but found 2  indent
  28:3  error  Expected indentation of 4 spaces but found 2  indent
  30:3  error  Indentation is incorrect                      indent
  31:5  error  Expected indentation of 8 spaces but found 4  indent
  32:5  error  Expected indentation of 8 spaces but found 4  indent
  33:3  error  Expected indentation of 4 spaces but found 2  indent
  36:3  error  Expected indentation of 4 spaces but found 2  indent
  40:3  error  Indentation is incorrect                      indent
  41:5  error  Expected indentation of 8 spaces but found 4  indent
  42:3  error  Expected indentation of 4 spaces but found 2  indent
  45:3  error  Expected indentation of 4 spaces but found 2  indent
  48:3  error  Indentation is incorrect                      indent
  49:5  error  Expected indentation of 8 spaces but found 4  indent
  50:3  error  Expected indentation of 4 spaces but found 2  indent
  53:3  error  Expected indentation of 4 spaces but found 2  indent
  57:3  error  Indentation is incorrect                      indent
  58:5  error  Expected indentation of 8 spaces but found 4  indent
  59:5  error  Expected indentation of 8 spaces but found 4  indent
  60:5  error  Expected indentation of 8 spaces but found 4  indent
  61:5  error  Expected indentation of 8 spaces but found 4  indent
  62:5  error  Expected indentation of 8 spaces but found 4  indent
  63:5  error  Expected indentation of 8 spaces but found 4  indent
  64:5  error  Expected indentation of 8 spaces but found 4  indent
  65:3  error  Expected indentation of 4 spaces but found 2  indent
  68:3  error  Expected indentation of 4 spaces but found 2  indent
  71:3  error  Indentation is incorrect                      indent
  72:5  error  Expected indentation of 8 spaces but found 4  indent
  73:5  error  Expected indentation of 8 spaces but found 4  indent
  74:5  error  Expected indentation of 8 spaces but found 4  indent
  75:5  error  Expected indentation of 8 spaces but found 4  indent
  76:5  error  Expected indentation of 8 spaces but found 4  indent
  77:5  error  Expected indentation of 8 spaces but found 4  indent
  78:5  error  Expected indentation of 8 spaces but found 4  indent
  79:3  error  Expected indentation of 4 spaces but found 2  indent
  82:3  error  Expected indentation of 4 spaces but found 2  indent
  86:3  error  Indentation is incorrect                      indent
  87:5  error  Expected indentation of 8 spaces but found 4  indent
  88:5  error  Expected indentation of 8 spaces but found 4  indent
  89:5  error  Expected indentation of 8 spaces but found 4  indent
  90:5  error  Expected indentation of 8 spaces but found 4  indent
  91:5  error  Expected indentation of 8 spaces but found 4  indent
  92:5  error  Expected indentation of 8 spaces but found 4  indent
  93:5  error  Expected indentation of 8 spaces but found 4  indent
  94:5  error  Expected indentation of 8 spaces but found 4  indent
  95:3  error  Expected indentation of 4 spaces but found 2  indent

../audits/brickblock-internal/frozen/contracts/BrickblockToken.sol
    8:3  error  Expected indentation of 4 spaces but found 2                    indent
    9:3  error  Expected indentation of 4 spaces but found 2                    indent
   10:3  error  Expected indentation of 4 spaces but found 2                    indent
   11:3  error  Expected indentation of 4 spaces but found 2                    indent
   12:3  error  Expected indentation of 4 spaces but found 2                    indent
   13:3  error  Expected indentation of 4 spaces but found 2                    indent
   14:3  error  Expected indentation of 4 spaces but found 2                    indent
   15:3  error  Expected indentation of 4 spaces but found 2                    indent
   16:3  error  Expected indentation of 4 spaces but found 2                    indent
   17:3  error  Expected indentation of 4 spaces but found 2                    indent
   18:3  error  Expected indentation of 4 spaces but found 2                    indent
   19:3  error  Expected indentation of 4 spaces but found 2                    indent
   20:3  error  Expected indentation of 4 spaces but found 2                    indent
   22:3  error  Expected indentation of 4 spaces but found 2                    indent
   23:3  error  Indentation is incorrect                                        indent
   28:3  error  Indentation is incorrect                                        indent
   29:3  error  Expected indentation of 4 spaces but found 2                    indent
   31:2  error  Line length must be no more than 120 but current length is 123  max-line-length
   32:3  error  Expected indentation of 4 spaces but found 2                    indent
   33:5  error  Expected indentation of 8 spaces but found 4                    indent
   34:5  error  Expected indentation of 8 spaces but found 4                    indent
   35:5  error  Expected indentation of 8 spaces but found 4                    indent
   36:5  error  Expected indentation of 8 spaces but found 4                    indent
   37:3  error  Expected indentation of 4 spaces but found 2                    indent
   39:3  error  Expected indentation of 4 spaces but found 2                    indent
   41:3  error  Indentation is incorrect                                        indent
   42:5  error  Expected indentation of 8 spaces but found 4                    indent
   43:5  error  Expected indentation of 8 spaces but found 4                    indent
   44:5  error  Expected indentation of 8 spaces but found 4                    indent
   45:5  error  Expected indentation of 8 spaces but found 4                    indent
   46:5  error  Expected indentation of 8 spaces but found 4                    indent
   47:5  error  Expected indentation of 8 spaces but found 4                    indent
   48:5  error  Expected indentation of 8 spaces but found 4                    indent
   50:5  error  Expected indentation of 8 spaces but found 4                    indent
   51:5  error  Expected indentation of 8 spaces but found 4                    indent
   52:5  error  Expected indentation of 8 spaces but found 4                    indent
   53:2  error  Line length must be no more than 120 but current length is 125  max-line-length
   54:2  error  Line length must be no more than 120 but current length is 148  max-line-length
   55:5  error  Expected indentation of 8 spaces but found 4                    indent
   56:5  error  Expected indentation of 8 spaces but found 4                    indent
   57:3  error  Expected indentation of 4 spaces but found 2                    indent
   59:2  error  Line length must be no more than 120 but current length is 136  max-line-length
   60:2  error  Line length must be no more than 120 but current length is 146  max-line-length
   61:3  error  Expected indentation of 4 spaces but found 2                    indent
   65:3  error  Indentation is incorrect                                        indent
   66:5  error  Expected indentation of 8 spaces but found 4                    indent
   67:3  error  Expected indentation of 4 spaces but found 2                    indent
   69:2  error  Line length must be no more than 120 but current length is 131  max-line-length
   70:3  error  Expected indentation of 4 spaces but found 2                    indent
   74:3  error  Indentation is incorrect                                        indent
   75:5  error  Expected indentation of 8 spaces but found 4                    indent
   76:5  error  Expected indentation of 8 spaces but found 4                    indent
   77:5  error  Expected indentation of 8 spaces but found 4                    indent
   78:3  error  Expected indentation of 4 spaces but found 2                    indent
   81:3  error  Expected indentation of 4 spaces but found 2                    indent
   85:3  error  Indentation is incorrect                                        indent
   86:5  error  Expected indentation of 8 spaces but found 4                    indent
   87:5  error  Expected indentation of 8 spaces but found 4                    indent
   88:5  error  Expected indentation of 8 spaces but found 4                    indent
   89:5  error  Expected indentation of 8 spaces but found 4                    indent
   90:5  error  Expected indentation of 8 spaces but found 4                    indent
   91:3  error  Expected indentation of 4 spaces but found 2                    indent
   93:2  error  Line length must be no more than 120 but current length is 131  max-line-length
   94:3  error  Expected indentation of 4 spaces but found 2                    indent
   99:3  error  Indentation is incorrect                                        indent
  100:5  error  Expected indentation of 8 spaces but found 4                    indent
  101:5  error  Expected indentation of 8 spaces but found 4                    indent
  102:5  error  Expected indentation of 8 spaces but found 4                    indent
  103:5  error  Expected indentation of 8 spaces but found 4                    indent
  104:5  error  Expected indentation of 8 spaces but found 4                    indent
  105:5  error  Expected indentation of 8 spaces but found 4                    indent
  106:5  error  Expected indentation of 8 spaces but found 4                    indent
  107:3  error  Expected indentation of 4 spaces but found 2                    indent
  110:3  error  Expected indentation of 4 spaces but found 2                    indent
  114:3  error  Indentation is incorrect                                        indent
  115:5  error  Expected indentation of 8 spaces but found 4                    indent
  116:5  error  Expected indentation of 8 spaces but found 4                    indent
  117:5  error  Expected indentation of 8 spaces but found 4                    indent
  118:5  error  Expected indentation of 8 spaces but found 4                    indent
  119:5  error  Expected indentation of 8 spaces but found 4                    indent
  120:5  error  Expected indentation of 8 spaces but found 4                    indent
  121:3  error  Expected indentation of 4 spaces but found 2                    indent
  123:2  error  Line length must be no more than 120 but current length is 150  max-line-length
  124:3  error  Expected indentation of 4 spaces but found 2                    indent
  128:3  error  Indentation is incorrect                                        indent
  130:5  error  Expected indentation of 8 spaces but found 4                    indent
  132:5  error  Expected indentation of 8 spaces but found 4                    indent
  133:2  error  Line length must be no more than 120 but current length is 125  max-line-length
  134:5  error  Expected indentation of 8 spaces but found 4                    indent
  135:5  error  Expected indentation of 8 spaces but found 4                    indent
  137:5  error  Expected indentation of 8 spaces but found 4                    indent
  139:5  error  Expected indentation of 8 spaces but found 4                    indent
  140:5  error  Expected indentation of 8 spaces but found 4                    indent
  142:5  error  Expected indentation of 8 spaces but found 4                    indent
  143:5  error  Expected indentation of 8 spaces but found 4                    indent
  145:5  error  Expected indentation of 8 spaces but found 4                    indent
  147:5  error  Expected indentation of 8 spaces but found 4                    indent
  149:5  error  Expected indentation of 8 spaces but found 4                    indent
  150:7  error  Indentation is incorrect                                        indent
  151:7  error  Indentation is incorrect                                        indent
  152:7  error  Indentation is incorrect                                        indent
  153:7  error  Indentation is incorrect                                        indent
  156:5  error  Expected indentation of 8 spaces but found 4                    indent
  157:3  error  Expected indentation of 4 spaces but found 2                    indent
  160:3  error  Expected indentation of 4 spaces but found 2                    indent
  162:3  error  Indentation is incorrect                                        indent
  163:5  error  Expected indentation of 8 spaces but found 4                    indent
  164:3  error  Expected indentation of 4 spaces but found 2                    indent

../audits/brickblock-internal/frozen/contracts/CustomPOAToken.sol
    8:3  error  Expected indentation of 4 spaces but found 2   indent
    9:3  error  Expected indentation of 4 spaces but found 2   indent
   11:3  error  Expected indentation of 4 spaces but found 2   indent
   13:3  error  Expected indentation of 4 spaces but found 2   indent
   14:3  error  Expected indentation of 4 spaces but found 2   indent
   15:3  error  Expected indentation of 4 spaces but found 2   indent
   17:3  error  Expected indentation of 4 spaces but found 2   indent
   18:3  error  Expected indentation of 4 spaces but found 2   indent
   20:3  error  Expected indentation of 4 spaces but found 2   indent
   21:3  error  Expected indentation of 4 spaces but found 2   indent
   22:3  error  Expected indentation of 4 spaces but found 2   indent
   23:3  error  Expected indentation of 4 spaces but found 2   indent
   24:3  error  Expected indentation of 4 spaces but found 2   indent
   26:3  error  Expected indentation of 4 spaces but found 2   indent
   29:3  error  Expected indentation of 4 spaces but found 2   indent
   31:3  error  Expected indentation of 4 spaces but found 2   indent
   33:3  error  Expected indentation of 4 spaces but found 2   indent
   35:3  error  Expected indentation of 4 spaces but found 2   indent
   36:5  error  Expected indentation of 8 spaces but found 4   indent
   37:5  error  Expected indentation of 8 spaces but found 4   indent
   38:5  error  Expected indentation of 8 spaces but found 4   indent
   39:5  error  Expected indentation of 8 spaces but found 4   indent
   40:5  error  Expected indentation of 8 spaces but found 4   indent
   41:3  error  Expected indentation of 4 spaces but found 2   indent
   43:3  error  Expected indentation of 4 spaces but found 2   indent
   45:3  error  Expected indentation of 4 spaces but found 2   indent
   46:3  error  Expected indentation of 4 spaces but found 2   indent
   47:3  error  Expected indentation of 4 spaces but found 2   indent
   48:3  error  Expected indentation of 4 spaces but found 2   indent
   49:3  error  Expected indentation of 4 spaces but found 2   indent
   50:3  error  Expected indentation of 4 spaces but found 2   indent
   52:3  error  Expected indentation of 4 spaces but found 2   indent
   53:5  error  Expected indentation of 8 spaces but found 4   indent
   54:5  error  Expected indentation of 8 spaces but found 4   indent
   55:3  error  Expected indentation of 4 spaces but found 2   indent
   57:3  error  Expected indentation of 4 spaces but found 2   indent
   58:5  error  Expected indentation of 8 spaces but found 4   indent
   59:5  error  Expected indentation of 8 spaces but found 4   indent
   60:3  error  Expected indentation of 4 spaces but found 2   indent
   63:3  error  Expected indentation of 4 spaces but found 2   indent
   64:5  error  Expected indentation of 8 spaces but found 4   indent
   65:5  error  Expected indentation of 8 spaces but found 4   indent
   66:3  error  Expected indentation of 4 spaces but found 2   indent
   68:3  error  Expected indentation of 4 spaces but found 2   indent
   69:5  error  Expected indentation of 8 spaces but found 4   indent
   70:5  error  Expected indentation of 8 spaces but found 4   indent
   71:3  error  Expected indentation of 4 spaces but found 2   indent
   73:3  error  Expected indentation of 4 spaces but found 2   indent
   74:5  error  Expected indentation of 8 spaces but found 4   indent
   75:7  error  Expected indentation of 12 spaces but found 6  indent
   76:7  error  Expected indentation of 12 spaces but found 6  indent
   77:7  error  Expected indentation of 12 spaces but found 6  indent
   78:7  error  Expected indentation of 12 spaces but found 6  indent
   79:7  error  Expected indentation of 12 spaces but found 6  indent
   80:5  error  Expected indentation of 8 spaces but found 4   indent
   81:5  error  Expected indentation of 8 spaces but found 4   indent
   82:3  error  Expected indentation of 4 spaces but found 2   indent
   86:3  error  Expected indentation of 4 spaces but found 2   indent
   87:3  error  Indentation is incorrect                       indent
   95:3  error  Indentation is incorrect                       indent
   97:3  error  Indentation is incorrect                       indent
   98:5  error  Expected indentation of 8 spaces but found 4   indent
   99:5  error  Expected indentation of 8 spaces but found 4   indent
  100:5  error  Expected indentation of 8 spaces but found 4   indent
  101:5  error  Expected indentation of 8 spaces but found 4   indent
  102:5  error  Expected indentation of 8 spaces but found 4   indent
  103:5  error  Expected indentation of 8 spaces but found 4   indent
  104:5  error  Expected indentation of 8 spaces but found 4   indent
  105:5  error  Expected indentation of 8 spaces but found 4   indent
  106:5  error  Expected indentation of 8 spaces but found 4   indent
  108:5  error  Expected indentation of 8 spaces but found 4   indent
  109:5  error  Expected indentation of 8 spaces but found 4   indent
  110:5  error  Expected indentation of 8 spaces but found 4   indent
  111:5  error  Expected indentation of 8 spaces but found 4   indent
  112:5  error  Expected indentation of 8 spaces but found 4   indent
  113:3  error  Expected indentation of 4 spaces but found 2   indent
  126:3  error  Expected indentation of 4 spaces but found 2   indent
  130:3  error  Indentation is incorrect                       indent
  131:5  error  Expected indentation of 8 spaces but found 4   indent
  132:7  error  Indentation is incorrect                       indent
  133:7  error  Indentation is incorrect                       indent
  134:7  error  Indentation is incorrect                       indent
  135:7  error  Indentation is incorrect                       indent
  136:3  error  Expected indentation of 4 spaces but found 2   indent
  141:3  error  Expected indentation of 4 spaces but found 2   indent
  145:3  error  Indentation is incorrect                       indent
  146:5  error  Expected indentation of 8 spaces but found 4   indent
  147:7  error  Indentation is incorrect                       indent
  148:7  error  Indentation is incorrect                       indent
  149:7  error  Indentation is incorrect                       indent
  150:7  error  Indentation is incorrect                       indent
  151:3  error  Expected indentation of 4 spaces but found 2   indent
  156:3  error  Expected indentation of 4 spaces but found 2   indent
  160:3  error  Indentation is incorrect                       indent
  162:5  error  Expected indentation of 8 spaces but found 4   indent
  163:5  error  Expected indentation of 8 spaces but found 4   indent
  164:3  error  Expected indentation of 4 spaces but found 2   indent
  167:3  error  Expected indentation of 4 spaces but found 2   indent
  169:3  error  Indentation is incorrect                       indent
  170:5  error  Expected indentation of 8 spaces but found 4   indent
  171:5  error  Expected indentation of 8 spaces but found 4   indent
  172:3  error  Expected indentation of 4 spaces but found 2   indent
  177:3  error  Expected indentation of 4 spaces but found 2   indent
  181:3  error  Indentation is incorrect                       indent
  182:5  error  Expected indentation of 8 spaces but found 4   indent
  183:5  error  Expected indentation of 8 spaces but found 4   indent
  184:5  error  Expected indentation of 8 spaces but found 4   indent
  185:3  error  Expected indentation of 4 spaces but found 2   indent
  188:3  error  Expected indentation of 4 spaces but found 2   indent
  192:3  error  Indentation is incorrect                       indent
  193:5  error  Expected indentation of 8 spaces but found 4   indent
  194:5  error  Expected indentation of 8 spaces but found 4   indent
  195:5  error  Expected indentation of 8 spaces but found 4   indent
  196:3  error  Expected indentation of 4 spaces but found 2   indent
  199:3  error  Expected indentation of 4 spaces but found 2   indent
  203:3  error  Indentation is incorrect                       indent
  204:5  error  Expected indentation of 8 spaces but found 4   indent
  205:3  error  Expected indentation of 4 spaces but found 2   indent
  212:3  error  Expected indentation of 4 spaces but found 2   indent
  216:3  error  Indentation is incorrect                       indent
  217:5  error  Expected indentation of 8 spaces but found 4   indent
  218:3  error  Expected indentation of 4 spaces but found 2   indent
  224:3  error  Expected indentation of 4 spaces but found 2   indent
  231:3  error  Indentation is incorrect                       indent
  232:5  error  Expected indentation of 8 spaces but found 4   indent
  233:5  error  Expected indentation of 8 spaces but found 4   indent
  235:5  error  Expected indentation of 8 spaces but found 4   indent
  237:7  error  Expected indentation of 12 spaces but found 6  indent
  239:7  error  Expected indentation of 12 spaces but found 6  indent
  243:7  error  Expected indentation of 12 spaces but found 6  indent
  244:5  error  Expected indentation of 8 spaces but found 4   indent
  246:7  error  Expected indentation of 12 spaces but found 6  indent
  248:7  error  Expected indentation of 12 spaces but found 6  indent
  250:7  error  Expected indentation of 12 spaces but found 6  indent
  252:7  error  Expected indentation of 12 spaces but found 6  indent
  254:7  error  Expected indentation of 12 spaces but found 6  indent
  256:7  error  Expected indentation of 12 spaces but found 6  indent
  258:7  error  Expected indentation of 12 spaces but found 6  indent
  259:7  error  Expected indentation of 12 spaces but found 6  indent
  261:7  error  Expected indentation of 12 spaces but found 6  indent
  262:5  error  Expected indentation of 8 spaces but found 4   indent
  264:5  error  Expected indentation of 8 spaces but found 4   indent
  266:5  error  Expected indentation of 8 spaces but found 4   indent
  268:5  error  Expected indentation of 8 spaces but found 4   indent
  270:5  error  Expected indentation of 8 spaces but found 4   indent
  271:5  error  Expected indentation of 8 spaces but found 4   indent
  272:5  error  Expected indentation of 8 spaces but found 4   indent
  273:3  error  Expected indentation of 4 spaces but found 2   indent
  275:3  error  Expected indentation of 4 spaces but found 2   indent
  282:3  error  Indentation is incorrect                       indent
  284:5  error  Expected indentation of 8 spaces but found 4   indent
  286:5  error  Expected indentation of 8 spaces but found 4   indent
  288:5  error  Expected indentation of 8 spaces but found 4   indent
  290:5  error  Expected indentation of 8 spaces but found 4   indent
  294:5  error  Expected indentation of 8 spaces but found 4   indent
  295:7  error  Indentation is incorrect                       indent
  297:5  error  Expected indentation of 8 spaces but found 4   indent
  299:5  error  Expected indentation of 8 spaces but found 4   indent
  300:5  error  Expected indentation of 8 spaces but found 4   indent
  301:3  error  Expected indentation of 4 spaces but found 2   indent
  305:3  error  Expected indentation of 4 spaces but found 2   indent
  310:3  error  Indentation is incorrect                       indent
  312:5  error  Expected indentation of 8 spaces but found 4   indent
  314:5  error  Expected indentation of 8 spaces but found 4   indent
  316:5  error  Expected indentation of 8 spaces but found 4   indent
  317:3  error  Expected indentation of 4 spaces but found 2   indent
  321:3  error  Expected indentation of 4 spaces but found 2   indent
  324:3  error  Indentation is incorrect                       indent
  326:5  error  Expected indentation of 8 spaces but found 4   indent
  328:5  error  Expected indentation of 8 spaces but found 4   indent
  330:5  error  Expected indentation of 8 spaces but found 4   indent
  332:5  error  Expected indentation of 8 spaces but found 4   indent
  333:3  error  Expected indentation of 4 spaces but found 2   indent
  340:3  error  Expected indentation of 4 spaces but found 2   indent
  344:3  error  Indentation is incorrect                       indent
  353:5  error  Expected indentation of 8 spaces but found 4   indent
  354:7  error  Indentation is incorrect                       indent
  355:7  error  Indentation is incorrect                       indent
  356:7  error  Indentation is incorrect                       indent
  357:7  error  Indentation is incorrect                       indent
  368:5  error  Expected indentation of 8 spaces but found 4   indent
  369:7  error  Indentation is incorrect                       indent
  370:7  error  Indentation is incorrect                       indent
  372:3  error  Expected indentation of 4 spaces but found 2   indent
  376:3  error  Expected indentation of 4 spaces but found 2   indent
  379:3  error  Indentation is incorrect                       indent
  381:5  error  Expected indentation of 8 spaces but found 4   indent
  383:5  error  Expected indentation of 8 spaces but found 4   indent
  385:5  error  Expected indentation of 8 spaces but found 4   indent
  387:5  error  Expected indentation of 8 spaces but found 4   indent
  388:5  error  Expected indentation of 8 spaces but found 4   indent
  389:3  error  Expected indentation of 4 spaces but found 2   indent
  393:3  error  Expected indentation of 4 spaces but found 2   indent
  398:3  error  Indentation is incorrect                       indent
  399:5  error  Expected indentation of 8 spaces but found 4   indent
  400:7  error  Expected indentation of 12 spaces but found 6  indent
  401:5  error  Expected indentation of 8 spaces but found 4   indent
  402:5  error  Expected indentation of 8 spaces but found 4   indent
  403:3  error  Expected indentation of 4 spaces but found 2   indent
  406:3  error  Expected indentation of 4 spaces but found 2   indent
  411:3  error  Indentation is incorrect                       indent
  413:5  error  Expected indentation of 8 spaces but found 4   indent
  415:5  error  Expected indentation of 8 spaces but found 4   indent
  417:5  error  Expected indentation of 8 spaces but found 4   indent
  419:5  error  Expected indentation of 8 spaces but found 4   indent
  420:5  error  Expected indentation of 8 spaces but found 4   indent
  422:5  error  Expected indentation of 8 spaces but found 4   indent
  424:5  error  Expected indentation of 8 spaces but found 4   indent
  426:5  error  Expected indentation of 8 spaces but found 4   indent
  427:5  error  Expected indentation of 8 spaces but found 4   indent
  428:3  error  Expected indentation of 4 spaces but found 2   indent
  431:3  error  Expected indentation of 4 spaces but found 2   indent
  437:3  error  Indentation is incorrect                       indent
  439:5  error  Expected indentation of 8 spaces but found 4   indent
  441:5  error  Expected indentation of 8 spaces but found 4   indent
  443:5  error  Expected indentation of 8 spaces but found 4   indent
  449:5  error  Expected indentation of 8 spaces but found 4   indent
  450:7  error  Indentation is incorrect                       indent
  453:7  error  Indentation is incorrect                       indent
  457:5  error  Expected indentation of 8 spaces but found 4   indent
  458:5  error  Expected indentation of 8 spaces but found 4   indent
  460:5  error  Expected indentation of 8 spaces but found 4   indent
  461:5  error  Expected indentation of 8 spaces but found 4   indent
  462:3  error  Expected indentation of 4 spaces but found 2   indent
  465:3  error  Expected indentation of 4 spaces but found 2   indent
  469:3  error  Indentation is incorrect                       indent
  475:5  error  Expected indentation of 8 spaces but found 4   indent
  477:5  error  Expected indentation of 8 spaces but found 4   indent
  480:5  error  Expected indentation of 8 spaces but found 4   indent
  482:5  error  Expected indentation of 8 spaces but found 4   indent
  484:5  error  Expected indentation of 8 spaces but found 4   indent
  486:5  error  Expected indentation of 8 spaces but found 4   indent
  487:5  error  Expected indentation of 8 spaces but found 4   indent
  488:3  error  Expected indentation of 4 spaces but found 2   indent
  495:3  error  Expected indentation of 4 spaces but found 2   indent
  496:3  error  Indentation is incorrect                       indent
  499:3  error  Indentation is incorrect                       indent
  503:3  error  Indentation is incorrect                       indent
  505:5  error  Expected indentation of 8 spaces but found 4   indent
  506:5  error  Expected indentation of 8 spaces but found 4   indent
  507:3  error  Expected indentation of 4 spaces but found 2   indent
  510:3  error  Expected indentation of 4 spaces but found 2   indent
  511:3  error  Indentation is incorrect                       indent
  515:3  error  Indentation is incorrect                       indent
  519:3  error  Indentation is incorrect                       indent
  521:5  error  Expected indentation of 8 spaces but found 4   indent
  522:5  error  Expected indentation of 8 spaces but found 4   indent
  523:3  error  Expected indentation of 4 spaces but found 2   indent
  529:3  error  Expected indentation of 4 spaces but found 2   indent
  532:3  error  Indentation is incorrect                       indent
  533:5  error  Expected indentation of 8 spaces but found 4   indent
  534:3  error  Expected indentation of 4 spaces but found 2   indent

../audits/brickblock-internal/contracts/Whitelist.sol
   7:3  error  Expected indentation of 4 spaces but found 2  indent
   9:3  error  Expected indentation of 4 spaces but found 2  indent
  11:3  error  Expected indentation of 4 spaces but found 2  indent
  13:3  error  Expected indentation of 4 spaces but found 2  indent
  16:3  error  Indentation is incorrect                      indent
  17:5  error  Expected indentation of 8 spaces but found 4  indent
  18:5  error  Expected indentation of 8 spaces but found 4  indent
  19:5  error  Expected indentation of 8 spaces but found 4  indent
  20:3  error  Expected indentation of 4 spaces but found 2  indent
  22:3  error  Expected indentation of 4 spaces but found 2  indent
  25:3  error  Indentation is incorrect                      indent
  26:5  error  Expected indentation of 8 spaces but found 4  indent
  27:5  error  Expected indentation of 8 spaces but found 4  indent
  28:5  error  Expected indentation of 8 spaces but found 4  indent
  29:3  error  Expected indentation of 4 spaces but found 2  indent

../audits/brickblock-internal/contracts/PoaProxyCommon.sol
  17:3  error  Expected indentation of 4 spaces but found 2                    indent
  20:3  error  Expected indentation of 4 spaces but found 2                    indent
  23:3  error  Expected indentation of 4 spaces but found 2                    indent
  35:3  error  Expected indentation of 4 spaces but found 2                    indent
  36:3  error  Indentation is incorrect                                        indent
  38:3  error  Indentation is incorrect                                        indent
  42:3  error  Indentation is incorrect                                        indent
  43:5  error  Expected indentation of 8 spaces but found 4                    indent
  44:5  error  Expected indentation of 8 spaces but found 4                    indent
  46:5  error  Expected indentation of 8 spaces but found 4                    indent
  47:7  error  Indentation is incorrect                                        indent
  48:7  error  Indentation is incorrect                                        indent
  49:7  error  Indentation is incorrect                                        indent
  50:7  error  Indentation is incorrect                                        indent
  53:7  error  Indentation is incorrect                                        indent
  59:2  error  Line length must be no more than 120 but current length is 137  max-line-length
  60:7  error  Indentation is incorrect                                        indent
  63:7  error  Indentation is incorrect                                        indent
  65:7  error  Indentation is incorrect                                        indent
  67:7  error  Indentation is incorrect                                        indent
  68:7  error  Indentation is incorrect                                        indent
  70:3  error  Expected indentation of 4 spaces but found 2                    indent

../audits/brickblock-internal/contracts/EmployeeTokenSalaryPayout.sol
   12:3  error  Expected indentation of 4 spaces but found 2   indent
   15:3  error  Expected indentation of 4 spaces but found 2   indent
   16:3  error  Expected indentation of 4 spaces but found 2   indent
   17:3  error  Expected indentation of 4 spaces but found 2   indent
   18:3  error  Expected indentation of 4 spaces but found 2   indent
   20:3  error  Expected indentation of 4 spaces but found 2   indent
   21:5  error  Expected indentation of 8 spaces but found 4   indent
   22:5  error  Expected indentation of 8 spaces but found 4   indent
   23:5  error  Expected indentation of 8 spaces but found 4   indent
   24:3  error  Expected indentation of 4 spaces but found 2   indent
   27:3  error  Expected indentation of 4 spaces but found 2   indent
   28:3  error  Expected indentation of 4 spaces but found 2   indent
   30:3  error  Expected indentation of 4 spaces but found 2   indent
   32:3  error  Expected indentation of 4 spaces but found 2   indent
   34:3  error  Indentation is incorrect                       indent
   35:5  error  Expected indentation of 8 spaces but found 4   indent
   37:5  error  Expected indentation of 8 spaces but found 4   indent
   38:3  error  Expected indentation of 4 spaces but found 2   indent
   40:3  error  Expected indentation of 4 spaces but found 2   indent
   44:3  error  Indentation is incorrect                       indent
   48:3  error  Indentation is incorrect                       indent
   49:5  error  Expected indentation of 8 spaces but found 4   indent
   51:5  error  Expected indentation of 8 spaces but found 4   indent
   52:5  error  Expected indentation of 8 spaces but found 4   indent
   53:5  error  Expected indentation of 8 spaces but found 4   indent
   55:5  error  Expected indentation of 8 spaces but found 4   indent
   56:5  error  Expected indentation of 8 spaces but found 4   indent
   57:5  error  Expected indentation of 8 spaces but found 4   indent
   58:5  error  Expected indentation of 8 spaces but found 4   indent
   61:5  error  Expected indentation of 8 spaces but found 4   indent
   63:5  error  Expected indentation of 8 spaces but found 4   indent
   64:3  error  Expected indentation of 4 spaces but found 2   indent
   66:3  error  Expected indentation of 4 spaces but found 2   indent
   70:3  error  Indentation is incorrect                       indent
   71:5  error  Expected indentation of 8 spaces but found 4   indent
   73:5  error  Expected indentation of 8 spaces but found 4   indent
   74:5  error  Expected indentation of 8 spaces but found 4   indent
   75:5  error  Expected indentation of 8 spaces but found 4   indent
   79:5  error  Expected indentation of 8 spaces but found 4   indent
   80:7  error  Expected indentation of 12 spaces but found 6  indent
   81:7  error  Expected indentation of 12 spaces but found 6  indent
   82:7  error  Expected indentation of 12 spaces but found 6  indent
   83:5  error  Expected indentation of 8 spaces but found 4   indent
   84:5  error  Expected indentation of 8 spaces but found 4   indent
   85:5  error  Expected indentation of 8 spaces but found 4   indent
   87:5  error  Expected indentation of 8 spaces but found 4   indent
   89:5  error  Expected indentation of 8 spaces but found 4   indent
   90:3  error  Expected indentation of 4 spaces but found 2   indent
   92:3  error  Expected indentation of 4 spaces but found 2   indent
   96:3  error  Indentation is incorrect                       indent
   97:5  error  Expected indentation of 8 spaces but found 4   indent
   98:5  error  Expected indentation of 8 spaces but found 4   indent
   99:5  error  Expected indentation of 8 spaces but found 4   indent
  102:5  error  Expected indentation of 8 spaces but found 4   indent
  104:5  error  Expected indentation of 8 spaces but found 4   indent
  105:3  error  Expected indentation of 4 spaces but found 2   indent
  107:3  error  Expected indentation of 4 spaces but found 2   indent
  110:3  error  Indentation is incorrect                       indent
  111:5  error  Expected indentation of 8 spaces but found 4   indent
  112:3  error  Expected indentation of 4 spaces but found 2   indent
  114:3  error  Expected indentation of 4 spaces but found 2   indent
  118:3  error  Indentation is incorrect                       indent
  119:5  error  Expected indentation of 8 spaces but found 4   indent
  121:5  error  Expected indentation of 8 spaces but found 4   indent
  122:7  error  Expected indentation of 12 spaces but found 6  indent
  123:7  error  Expected indentation of 12 spaces but found 6  indent
  125:7  error  Expected indentation of 12 spaces but found 6  indent
  126:9  error  Expected indentation of 16 spaces but found 8  indent
  127:7  error  Expected indentation of 12 spaces but found 6  indent
  128:7  error  Expected indentation of 12 spaces but found 6  indent
  129:5  error  Expected indentation of 8 spaces but found 4   indent
  131:5  error  Expected indentation of 8 spaces but found 4   indent
  132:3  error  Expected indentation of 4 spaces but found 2   indent
  134:3  error  Expected indentation of 4 spaces but found 2   indent
  137:3  error  Indentation is incorrect                       indent
  138:5  error  Expected indentation of 8 spaces but found 4   indent
  140:5  error  Expected indentation of 8 spaces but found 4   indent
  141:7  error  Expected indentation of 12 spaces but found 6  indent
  142:7  error  Expected indentation of 12 spaces but found 6  indent
  144:7  error  Expected indentation of 12 spaces but found 6  indent
  145:9  error  Expected indentation of 16 spaces but found 8  indent
  146:9  error  Expected indentation of 16 spaces but found 8  indent
  147:7  error  Expected indentation of 12 spaces but found 6  indent
  148:7  error  Expected indentation of 12 spaces but found 6  indent
  149:7  error  Expected indentation of 12 spaces but found 6  indent
  150:5  error  Expected indentation of 8 spaces but found 4   indent
  153:5  error  Expected indentation of 8 spaces but found 4   indent
  154:3  error  Expected indentation of 4 spaces but found 2   indent
  156:3  error  Expected indentation of 4 spaces but found 2   indent
  159:3  error  Indentation is incorrect                       indent
  160:5  error  Expected indentation of 8 spaces but found 4   indent
  161:5  error  Expected indentation of 8 spaces but found 4   indent
  162:3  error  Expected indentation of 4 spaces but found 2   indent

../audits/brickblock-internal/contracts/ExchangeRateProvider.sol
    9:3  error  Expected indentation of 4 spaces but found 2   indent
   11:3  error  Expected indentation of 4 spaces but found 2   indent
   14:3  error  Expected indentation of 4 spaces but found 2   indent
   15:3  error  Indentation is incorrect                       indent
   16:5  error  Expected indentation of 6 spaces but found 4   indent
   17:7  error  Indentation is incorrect                       indent
   18:7  error  Indentation is incorrect                       indent
   20:5  error  Expected indentation of 6 spaces but found 4   indent
   21:3  error  Indentation is incorrect                       indent
   23:3  error  Expected indentation of 4 spaces but found 2   indent
   24:3  error  Indentation is incorrect                       indent
   25:5  error  Expected indentation of 6 spaces but found 4   indent
   26:5  error  Expected indentation of 6 spaces but found 4   indent
   27:3  error  Indentation is incorrect                       indent
   29:3  error  Expected indentation of 4 spaces but found 2   indent
   30:3  error  Indentation is incorrect                       indent
   31:5  error  Expected indentation of 6 spaces but found 4   indent
   32:5  error  Expected indentation of 6 spaces but found 4   indent
   33:3  error  Indentation is incorrect                       indent
   35:3  error  Expected indentation of 4 spaces but found 2   indent
   37:3  error  Indentation is incorrect                       indent
   39:3  error  Indentation is incorrect                       indent
   40:5  error  Expected indentation of 8 spaces but found 4   indent
   41:5  error  Expected indentation of 8 spaces but found 4   indent
   42:3  error  Expected indentation of 4 spaces but found 2   indent
   45:3  error  Expected indentation of 4 spaces but found 2   indent
   49:3  error  Indentation is incorrect                       indent
   50:5  error  Expected indentation of 8 spaces but found 4   indent
   51:5  error  Expected indentation of 8 spaces but found 4   indent
   52:3  error  Expected indentation of 4 spaces but found 2   indent
   57:3  error  Expected indentation of 4 spaces but found 2   indent
   62:3  error  Indentation is incorrect                       indent
   67:3  error  Indentation is incorrect                       indent
   69:5  error  Expected indentation of 8 spaces but found 4   indent
   70:7  error  Expected indentation of 12 spaces but found 6  indent
   71:7  error  Expected indentation of 12 spaces but found 6  indent
   72:5  error  Expected indentation of 8 spaces but found 4   indent
   74:7  error  Expected indentation of 12 spaces but found 6  indent
   79:7  error  Indentation is incorrect                       indent
   82:7  error  Expected indentation of 12 spaces but found 6  indent
   83:7  error  Expected indentation of 12 spaces but found 6  indent
   84:5  error  Expected indentation of 8 spaces but found 4   indent
   85:3  error  Expected indentation of 4 spaces but found 2   indent
   88:3  error  Expected indentation of 4 spaces but found 2   indent
   91:3  error  Indentation is incorrect                       indent
   93:5  error  Expected indentation of 8 spaces but found 4   indent
   94:7  error  Indentation is incorrect                       indent
   97:5  error  Expected indentation of 8 spaces but found 4   indent
   98:3  error  Expected indentation of 4 spaces but found 2   indent
  102:3  error  Expected indentation of 4 spaces but found 2   indent
  105:3  error  Indentation is incorrect                       indent
  107:5  error  Expected indentation of 8 spaces but found 4   indent
  108:7  error  Indentation is incorrect                       indent
  111:5  error  Expected indentation of 8 spaces but found 4   indent
  112:5  error  Expected indentation of 8 spaces but found 4   indent
  113:5  error  Expected indentation of 8 spaces but found 4   indent
  114:5  error  Expected indentation of 8 spaces but found 4   indent
  115:5  error  Expected indentation of 8 spaces but found 4   indent
  116:5  error  Expected indentation of 8 spaces but found 4   indent
  117:7  error  Indentation is incorrect                       indent
  118:7  error  Indentation is incorrect                       indent
  119:7  error  Indentation is incorrect                       indent
  124:5  error  Expected indentation of 8 spaces but found 4   indent
  128:5  error  Expected indentation of 8 spaces but found 4   indent
  129:7  error  Expected indentation of 12 spaces but found 6  indent
  134:7  error  Indentation is incorrect                       indent
  135:5  error  Expected indentation of 8 spaces but found 4   indent
  136:3  error  Expected indentation of 4 spaces but found 2   indent
  139:3  error  Expected indentation of 4 spaces but found 2   indent
  142:3  error  Indentation is incorrect                       indent
  143:5  error  Expected indentation of 8 spaces but found 4   indent
  144:3  error  Expected indentation of 4 spaces but found 2   indent
  147:3  error  Expected indentation of 4 spaces but found 2   indent
  150:3  error  Indentation is incorrect                       indent

../audits/brickblock-internal/contracts/tools/SafeMathPower.sol
   6:2  error  Line length must be no more than 120 but current length is 125  max-line-length
  12:3  error  Expected indentation of 4 spaces but found 2                    indent
  14:3  error  Expected indentation of 4 spaces but found 2                    indent
  15:5  error  Expected indentation of 8 spaces but found 4                    indent
  16:3  error  Expected indentation of 4 spaces but found 2                    indent
  18:3  error  Expected indentation of 4 spaces but found 2                    indent
  19:5  error  Expected indentation of 8 spaces but found 4                    indent
  20:3  error  Expected indentation of 4 spaces but found 2                    indent
  22:3  error  Expected indentation of 4 spaces but found 2                    indent
  23:5  error  Expected indentation of 8 spaces but found 4                    indent
  24:3  error  Expected indentation of 4 spaces but found 2                    indent
  41:3  error  Expected indentation of 4 spaces but found 2                    indent
  42:5  error  Expected indentation of 8 spaces but found 4                    indent
  44:5  error  Expected indentation of 8 spaces but found 4                    indent
  45:7  error  Expected indentation of 12 spaces but found 6                   indent
  47:7  error  Expected indentation of 12 spaces but found 6                   indent
  48:9  error  Expected indentation of 16 spaces but found 8                   indent
  49:7  error  Expected indentation of 12 spaces but found 6                   indent
  50:5  error  Expected indentation of 8 spaces but found 4                    indent
  51:3  error  Expected indentation of 4 spaces but found 2                    indent

../audits/brickblock-internal/contracts/tools/WarpTool.sol
   7:3  error  Expected indentation of 4 spaces but found 2  indent
   9:3  error  Expected indentation of 4 spaces but found 2  indent
  11:3  error  Indentation is incorrect                      indent
  12:5  error  Expected indentation of 8 spaces but found 4  indent
  13:3  error  Expected indentation of 4 spaces but found 2  indent

../audits/brickblock-internal/contracts/PoaLogger.sol
    9:3  error  Expected indentation of 4 spaces but found 2  indent
   11:3  error  Expected indentation of 4 spaces but found 2  indent
   13:3  error  Expected indentation of 4 spaces but found 2  indent
   15:3  error  Indentation is incorrect                      indent
   17:3  error  Indentation is incorrect                      indent
   18:5  error  Expected indentation of 8 spaces but found 4  indent
   19:5  error  Expected indentation of 8 spaces but found 4  indent
   20:3  error  Expected indentation of 4 spaces but found 2  indent
   23:3  error  Expected indentation of 4 spaces but found 2  indent
   24:5  error  Expected indentation of 8 spaces but found 4  indent
   25:7  error  Indentation is incorrect                      indent
   27:7  error  Indentation is incorrect                      indent
   29:5  error  Expected indentation of 8 spaces but found 4  indent
   30:3  error  Expected indentation of 4 spaces but found 2  indent
   33:3  error  Expected indentation of 4 spaces but found 2  indent
   36:3  error  Indentation is incorrect                      indent
   37:3  error  Expected indentation of 4 spaces but found 2  indent
   41:3  error  Indentation is incorrect                      indent
   42:3  error  Expected indentation of 4 spaces but found 2  indent
   45:3  error  Indentation is incorrect                      indent
   46:3  error  Expected indentation of 4 spaces but found 2  indent
   49:3  error  Indentation is incorrect                      indent
   50:3  error  Expected indentation of 4 spaces but found 2  indent
   54:3  error  Indentation is incorrect                      indent
   55:3  error  Expected indentation of 4 spaces but found 2  indent
   57:3  error  Indentation is incorrect                      indent
   58:3  error  Expected indentation of 4 spaces but found 2  indent
   62:3  error  Indentation is incorrect                      indent
   63:3  error  Expected indentation of 4 spaces but found 2  indent
   67:3  error  Indentation is incorrect                      indent
   70:3  error  Expected indentation of 4 spaces but found 2  indent
   74:3  error  Indentation is incorrect                      indent
   77:3  error  Expected indentation of 4 spaces but found 2  indent
   79:3  error  Indentation is incorrect                      indent
   82:3  error  Indentation is incorrect                      indent
   83:5  error  Expected indentation of 8 spaces but found 4  indent
   84:3  error  Expected indentation of 4 spaces but found 2  indent
   86:3  error  Expected indentation of 4 spaces but found 2  indent
   89:3  error  Indentation is incorrect                      indent
   92:3  error  Indentation is incorrect                      indent
   93:5  error  Expected indentation of 8 spaces but found 4  indent
   94:3  error  Expected indentation of 4 spaces but found 2  indent
   96:3  error  Expected indentation of 4 spaces but found 2  indent
   99:3  error  Indentation is incorrect                      indent
  101:5  error  Expected indentation of 8 spaces but found 4  indent
  103:5  error  Expected indentation of 8 spaces but found 4  indent
  104:7  error  Indentation is incorrect                      indent
  105:7  error  Indentation is incorrect                      indent
  107:3  error  Expected indentation of 4 spaces but found 2  indent
  109:3  error  Expected indentation of 4 spaces but found 2  indent
  111:3  error  Indentation is incorrect                      indent
  114:3  error  Indentation is incorrect                      indent
  115:5  error  Expected indentation of 8 spaces but found 4  indent
  116:7  error  Indentation is incorrect                      indent
  117:7  error  Indentation is incorrect                      indent
  119:3  error  Expected indentation of 4 spaces but found 2  indent
  121:3  error  Expected indentation of 4 spaces but found 2  indent
  127:3  error  Indentation is incorrect                      indent
  128:5  error  Expected indentation of 8 spaces but found 4  indent
  129:7  error  Indentation is incorrect                      indent
  130:7  error  Indentation is incorrect                      indent
  131:7  error  Indentation is incorrect                      indent
  133:3  error  Expected indentation of 4 spaces but found 2  indent
  135:3  error  Expected indentation of 4 spaces but found 2  indent
  138:3  error  Indentation is incorrect                      indent
  139:5  error  Expected indentation of 8 spaces but found 4  indent
  140:3  error  Expected indentation of 4 spaces but found 2  indent
  142:3  error  Expected indentation of 4 spaces but found 2  indent
  145:3  error  Indentation is incorrect                      indent
  148:3  error  Indentation is incorrect                      indent
  149:5  error  Expected indentation of 8 spaces but found 4  indent
  150:7  error  Indentation is incorrect                      indent
  151:7  error  Indentation is incorrect                      indent
  152:7  error  Indentation is incorrect                      indent
  154:3  error  Expected indentation of 4 spaces but found 2  indent
  156:3  error  Expected indentation of 4 spaces but found 2  indent
  159:3  error  Indentation is incorrect                      indent
  162:3  error  Indentation is incorrect                      indent
  163:5  error  Expected indentation of 8 spaces but found 4  indent
  164:7  error  Indentation is incorrect                      indent
  165:7  error  Indentation is incorrect                      indent
  166:7  error  Indentation is incorrect                      indent
  168:3  error  Expected indentation of 4 spaces but found 2  indent
  170:3  error  Expected indentation of 4 spaces but found 2  indent
  173:3  error  Indentation is incorrect                      indent
  176:3  error  Indentation is incorrect                      indent
  177:5  error  Expected indentation of 8 spaces but found 4  indent
  178:7  error  Indentation is incorrect                      indent
  179:7  error  Indentation is incorrect                      indent
  180:7  error  Indentation is incorrect                      indent
  182:3  error  Expected indentation of 4 spaces but found 2  indent

../audits/brickblock-internal/contracts/stubs/UpgradedPoa.sol
   8:3  error  Expected indentation of 4 spaces but found 2  indent
  10:3  error  Expected indentation of 4 spaces but found 2  indent
  13:3  error  Indentation is incorrect                      indent
  14:5  error  Expected indentation of 8 spaces but found 4  indent
  15:3  error  Expected indentation of 4 spaces but found 2  indent

../audits/brickblock-internal/contracts/stubs/RemoteContractStub.sol
   5:3  error  Expected indentation of 4 spaces but found 2  indent
   6:3  error  Expected indentation of 4 spaces but found 2  indent
   8:3  error  Expected indentation of 4 spaces but found 2  indent
  10:3  error  Indentation is incorrect                      indent
  12:3  error  Indentation is incorrect                      indent
  13:5  error  Expected indentation of 8 spaces but found 4  indent
  14:3  error  Expected indentation of 4 spaces but found 2  indent
  16:3  error  Expected indentation of 4 spaces but found 2  indent
  19:3  error  Indentation is incorrect                      indent
  23:3  error  Indentation is incorrect                      indent
  24:5  error  Expected indentation of 8 spaces but found 4  indent
  25:3  error  Expected indentation of 4 spaces but found 2  indent
  27:3  error  Expected indentation of 4 spaces but found 2  indent
  29:3  error  Indentation is incorrect                      indent
  32:3  error  Indentation is incorrect                      indent
  33:5  error  Expected indentation of 8 spaces but found 4  indent
  34:5  error  Expected indentation of 8 spaces but found 4  indent
  35:3  error  Expected indentation of 4 spaces but found 2  indent

../audits/brickblock-internal/contracts/stubs/ExchangeRateProviderStub.sol
    9:3   error  Expected indentation of 4 spaces but found 2    indent
   11:3   error  Expected indentation of 4 spaces but found 2    indent
   13:3   error  Expected indentation of 4 spaces but found 2    indent
   15:3   error  Expected indentation of 4 spaces but found 2    indent
   17:3   error  Expected indentation of 4 spaces but found 2    indent
   19:3   error  Expected indentation of 4 spaces but found 2    indent
   21:3   error  Expected indentation of 4 spaces but found 2    indent
   23:3   error  Expected indentation of 4 spaces but found 2    indent
   26:3   error  Expected indentation of 4 spaces but found 2    indent
   27:3   error  Indentation is incorrect                        indent
   28:5   error  Expected indentation of 6 spaces but found 4    indent
   29:7   error  Indentation is incorrect                        indent
   31:5   error  Expected indentation of 6 spaces but found 4    indent
   32:3   error  Indentation is incorrect                        indent
   34:3   error  Expected indentation of 4 spaces but found 2    indent
   35:3   error  Indentation is incorrect                        indent
   36:5   error  Expected indentation of 6 spaces but found 4    indent
   37:5   error  Expected indentation of 6 spaces but found 4    indent
   38:3   error  Indentation is incorrect                        indent
   40:3   error  Expected indentation of 4 spaces but found 2    indent
   42:3   error  Indentation is incorrect                        indent
   44:3   error  Indentation is incorrect                        indent
   45:5   error  Expected indentation of 8 spaces but found 4    indent
   46:5   error  Expected indentation of 8 spaces but found 4    indent
   47:3   error  Expected indentation of 4 spaces but found 2    indent
   50:3   error  Expected indentation of 4 spaces but found 2    indent
   54:3   error  Indentation is incorrect                        indent
   55:5   error  Expected indentation of 8 spaces but found 4    indent
   56:5   error  Expected indentation of 8 spaces but found 4    indent
   57:3   error  Expected indentation of 4 spaces but found 2    indent
   62:3   error  Expected indentation of 4 spaces but found 2    indent
   67:3   error  Indentation is incorrect                        indent
   72:3   error  Indentation is incorrect                        indent
   75:5   error  Expected indentation of 8 spaces but found 4    indent
   76:5   error  Expected indentation of 8 spaces but found 4    indent
   78:5   error  Expected indentation of 8 spaces but found 4    indent
   79:5   error  Expected indentation of 8 spaces but found 4    indent
   81:7   error  Expected indentation of 12 spaces but found 6   indent
   82:7   error  Expected indentation of 12 spaces but found 6   indent
   83:5   error  Expected indentation of 8 spaces but found 4    indent
   85:7   error  Expected indentation of 12 spaces but found 6   indent
   86:7   error  Expected indentation of 12 spaces but found 6   indent
   87:7   error  Expected indentation of 12 spaces but found 6   indent
   88:5   error  Expected indentation of 8 spaces but found 4    indent
   89:3   error  Expected indentation of 4 spaces but found 2    indent
   92:3   error  Expected indentation of 4 spaces but found 2    indent
   95:3   error  Indentation is incorrect                        indent
   97:5   error  Expected indentation of 8 spaces but found 4    indent
   98:7   error  Indentation is incorrect                        indent
  100:5   error  Expected indentation of 8 spaces but found 4    indent
  102:5   error  Expected indentation of 8 spaces but found 4    indent
  103:3   error  Expected indentation of 4 spaces but found 2    indent
  107:3   error  Expected indentation of 4 spaces but found 2    indent
  109:3   error  Indentation is incorrect                        indent
  111:5   error  Expected indentation of 8 spaces but found 4    indent
  112:7   error  Indentation is incorrect                        indent
  115:5   error  Expected indentation of 8 spaces but found 4    indent
  116:5   error  Expected indentation of 8 spaces but found 4    indent
  117:5   error  Expected indentation of 8 spaces but found 4    indent
  118:5   error  Expected indentation of 8 spaces but found 4    indent
  119:5   error  Expected indentation of 8 spaces but found 4    indent
  120:5   error  Expected indentation of 8 spaces but found 4    indent
  121:7   error  Indentation is incorrect                        indent
  122:7   error  Indentation is incorrect                        indent
  123:7   error  Indentation is incorrect                        indent
  127:5   error  Expected indentation of 8 spaces but found 4    indent
  129:5   error  Expected indentation of 8 spaces but found 4    indent
  130:7   error  Expected indentation of 12 spaces but found 6   indent
  131:7   error  Expected indentation of 12 spaces but found 6   indent
  132:7   error  Expected indentation of 12 spaces but found 6   indent
  133:7   error  Expected indentation of 12 spaces but found 6   indent
  134:7   error  Expected indentation of 12 spaces but found 6   indent
  135:5   error  Expected indentation of 8 spaces but found 4    indent
  136:7   error  Expected indentation of 12 spaces but found 6   indent
  137:7   error  Expected indentation of 12 spaces but found 6   indent
  138:7   error  Expected indentation of 12 spaces but found 6   indent
  139:7   error  Expected indentation of 12 spaces but found 6   indent
  140:7   error  Expected indentation of 12 spaces but found 6   indent
  141:5   error  Expected indentation of 8 spaces but found 4    indent
  142:3   error  Expected indentation of 4 spaces but found 2    indent
  146:3   error  Expected indentation of 4 spaces but found 2    indent
  150:3   error  Indentation is incorrect                        indent
  151:5   error  Expected indentation of 8 spaces but found 4    indent
  152:3   error  Expected indentation of 4 spaces but found 2    indent
  155:3   error  Expected indentation of 4 spaces but found 2    indent
  159:3   error  Indentation is incorrect                        indent
  160:5   error  Expected indentation of 8 spaces but found 4    indent
  161:5   error  Expected indentation of 8 spaces but found 4    indent
  162:5   error  Expected indentation of 8 spaces but found 4    indent
  163:5   error  Expected indentation of 8 spaces but found 4    indent
  164:7   error  Expected indentation of 12 spaces but found 6   indent
  165:9   error  Expected indentation of 16 spaces but found 8   indent
  166:11  error  Expected indentation of 20 spaces but found 10  indent
  167:13  error  Expected indentation of 24 spaces but found 12  indent
  168:11  error  Indentation is incorrect                        indent
  169:13  error  Expected indentation of 24 spaces but found 12  indent
  170:9   error  Expected indentation of 16 spaces but found 8   indent
  171:9   error  Expected indentation of 16 spaces but found 8   indent
  172:9   error  Expected indentation of 16 spaces but found 8   indent
  173:7   error  Expected indentation of 12 spaces but found 6   indent
  174:9   error  Expected indentation of 17 spaces but found 8   indent
  175:5   error  Expected indentation of 8 spaces but found 4    indent
  176:5   error  Expected indentation of 8 spaces but found 4    indent
  177:7   error  Expected indentation of 12 spaces but found 6   indent
  178:5   error  Expected indentation of 8 spaces but found 4    indent
  179:3   error  Expected indentation of 4 spaces but found 2    indent
  182:3   error  Expected indentation of 4 spaces but found 2    indent
  185:3   error  Indentation is incorrect                        indent
  186:5   error  Expected indentation of 8 spaces but found 4    indent
  187:3   error  Expected indentation of 4 spaces but found 2    indent
  190:3   error  Expected indentation of 4 spaces but found 2    indent
  193:3   error  Indentation is incorrect                        indent

../audits/brickblock-internal/contracts/stubs/RemoteContractUserStub.sol
   7:3  error  Expected indentation of 4 spaces but found 2  indent
  12:3  error  Expected indentation of 4 spaces but found 2  indent
  15:3  error  Indentation is incorrect                      indent
  20:3  error  Expected indentation of 4 spaces but found 2  indent
  22:3  error  Indentation is incorrect                      indent
  30:3  error  Expected indentation of 4 spaces but found 2  indent
  32:3  error  Expected indentation of 4 spaces but found 2  indent
  34:3  error  Indentation is incorrect                      indent
  36:3  error  Indentation is incorrect                      indent
  37:5  error  Expected indentation of 8 spaces but found 4  indent
  38:5
```
</details> 
