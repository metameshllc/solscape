# Mythril Output
Solc experienced a fatal error (code 1).

/home/micah/set-labs_audit_2018-11/contracts/lib/Authorizable.sol:19:1: Error: Source "openzeppelin-solidity/contracts/ownership/Ownable.sol" not found: File not found.
import { Ownable } from "openzeppelin-solidity/contracts/ownership/Ownable.sol";
^------------------------------------------------------------------------------^
/home/micah/set-labs_audit_2018-11/contracts/lib/Authorizable.sol:20:1: Error: Source "openzeppelin-solidity/contracts/math/SafeMath.sol" not found: File not found.
import { SafeMath } from "openzeppelin-solidity/contracts/math/SafeMath.sol";
^---------------------------------------------------------------------------^

# 
Maru Output
# 
Solhint Output

/home/micah/set-labs_audit_2018-11/contracts/lib/IERC20.sol
  43:5  error  Function order is incorrect, external function can not go after external constant function  func-order
  49:5  error  Function order is incorrect, external function can not go after external constant function  func-order
  56:5  error  Function order is incorrect, external function can not go after external constant function  func-order

/home/micah/set-labs_audit_2018-11/contracts/lib/ERC20Wrapper.sol
   81:5   error    Function order is incorrect, external function can not go after internal function  func-order
  106:5   error    Function order is incorrect, external function can not go after internal function  func-order
  180:5   error    Definitions inside contract / library must be separated by one line                separate-by-one-line-in-contract
  189:9   warning  Avoid to use inline assembly. It is acceptable only in rare cases                  no-inline-assembly
  208:21  warning  Code contains empty block                                                          no-empty-blocks

/home/micah/set-labs_audit_2018-11/contracts/core/Vault.sol
   34:1  error  Definition must be surrounded with two blank line indent                                two-lines-top-level-separator
   36:1  error  Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
   65:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  153:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  245:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract

/home/micah/set-labs_audit_2018-11/contracts/core/TransferProxy.sol
  32:1  error  Definition must be surrounded with two blank line indent                                two-lines-top-level-separator
  34:1  error  Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
  48:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract

/home/micah/set-labs_audit_2018-11/contracts/core/SetToken.sol
   36:1   error    Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
   66:5   error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
   80:5   error    Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
  126:17  warning  Avoid to use low level calls                                                            avoid-low-level-calls
  168:5   error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract

/home/micah/set-labs_audit_2018-11/contracts/core/SetTokenFactory.sol
  31:1  error  Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
  44:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  48:5  error  Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
  66:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract

/home/micah/set-labs_audit_2018-11/contracts/core/extensions/CoreOperationState.sol
  33:1  error  Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
  52:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  59:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  75:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract

/home/micah/set-labs_audit_2018-11/contracts/core/extensions/CoreIssuanceOrder.sol
   48:1   error    Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
   54:5   error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
   82:2   error    Line length must be no more than 120 but current length is 122                          max-line-length
   89:5   error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  141:2   error    Line length must be no more than 120 but current length is 122                          max-line-length
  213:5   error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  220:5   error    Function body contains 62 lines but allowed no more than 50 lines                       function-max-lines
  297:5   error    Function body contains 69 lines but allowed no more than 50 lines                       function-max-lines
  321:13  warning  Avoid to make time-based decisions in your business logic                               not-rely-on-time
  383:5   error    Function body contains 75 lines but allowed no more than 50 lines                       function-max-lines

/home/micah/set-labs_audit_2018-11/contracts/core/extensions/CoreAccounting.sol
   38:1  error  Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
   50:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  172:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  247:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract

/home/micah/set-labs_audit_2018-11/contracts/core/extensions/CoreInternal.sol
  34:1  error  Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
  45:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract

/home/micah/set-labs_audit_2018-11/contracts/core/extensions/CoreIssuance.sol
   38:1  error  Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
   44:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
   58:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  112:5  error  Function body contains 63 lines but allowed no more than 50 lines                       function-max-lines
  214:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  220:5  error  Function body contains 85 lines but allowed no more than 50 lines                       function-max-lines
  382:5  error  Function order is incorrect, internal function can not go after private function        func-order

/home/micah/set-labs_audit_2018-11/contracts/core/extensions/CoreFactory.sol
  31:1  error  Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
  58:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract

/home/micah/set-labs_audit_2018-11/contracts/core/extensions/CoreRebalanceAuction.sol
  39:1  error  Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
  56:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract

/home/micah/set-labs_audit_2018-11/contracts/core/RebalancingSetToken.sol
   40:1   error    Contract has 22 states declarations but allowed no more than 15                         max-states-count
   43:1   error    Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
   58:29  error    Constant name must be in capitalized SNAKE_CASE                                         const-name-snakecase
   93:5   error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  126:5   error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  144:5   error    Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
  177:34  warning  Avoid to make time-based decisions in your business logic                               not-rely-on-time
  193:5   error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  201:5   error    Function body contains 70 lines but allowed no more than 50 lines                       function-max-lines
  218:13  warning  Avoid to make time-based decisions in your business logic                               not-rely-on-time
  264:29  warning  Avoid to make time-based decisions in your business logic                               not-rely-on-time
  289:13  warning  Avoid to make time-based decisions in your business logic                               not-rely-on-time
  313:28  warning  Avoid to make time-based decisions in your business logic                               not-rely-on-time
  326:5   error    Function body contains 71 lines but allowed no more than 50 lines                       function-max-lines
  393:9   warning  Possible reentrancy vulnerabilities. Avoid state changes after transfer                 reentrancy
  396:9   warning  Possible reentrancy vulnerabilities. Avoid state changes after transfer                 reentrancy
  396:34  warning  Avoid to make time-based decisions in your business logic                               not-rely-on-time
  397:9   warning  Possible reentrancy vulnerabilities. Avoid state changes after transfer                 reentrancy
  462:5   error    Function body contains 69 lines but allowed no more than 50 lines                       function-max-lines
  541:5   error    Function order is incorrect, external function can not go after public function         func-order
  592:5   error    Function order is incorrect, external function can not go after public function         func-order
  618:5   error    Function order is incorrect, external function can not go after public function         func-order
  639:5   error    Function order is incorrect, external_const function can not go after public function   func-order
  639:5   error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  654:5   error    Function order is incorrect, external_const function can not go after public function   func-order
  686:5   error    Function order is incorrect, external_const function can not go after public function   func-order
  699:5   error    Function order is incorrect, external_const function can not go after public function   func-order
  712:5   error    Function order is incorrect, external_const function can not go after public function   func-order
  725:5   error    Function order is incorrect, external_const function can not go after public function   func-order
  740:5   error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  777:2   error    Line length must be no more than 120 but current length is 123                          max-line-length
  854:5   error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract

/home/micah/set-labs_audit_2018-11/contracts/core/Core.sol
  44:1  error  Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
  58:5  error  Open bracket must be on same line. It must be indented by other constructions by space  bracket-align

/home/micah/set-labs_audit_2018-11/contracts/core/RebalancingSetTokenFactory.sol
   48:5   error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
   66:5   error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
   72:5   error    Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
  101:5   error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  161:5   error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  170:9   warning  Avoid to use inline assembly. It is acceptable only in rare cases                       no-inline-assembly
  171:30  error    Comma must be separated from next element by space                                      space-after-comma
  172:39  error    Comma must be separated from next element by space                                      space-after-comma
  173:39  error    Comma must be separated from next element by space                                      space-after-comma
  174:39  error    Comma must be separated from next element by space                                      space-after-comma

/home/micah/set-labs_audit_2018-11/contracts/core/interfaces/IRebalancingSetFactory.sol
  31:1  error  Open bracket must be on same line. It must be indented by other constructions by space  bracket-align

/home/micah/set-labs_audit_2018-11/contracts/core/interfaces/IVault.sol
  26:1  error  Definition must be surrounded with two blank line indent             two-lines-top-level-separator
  82:5  error  Definitions inside contract / library must be separated by one line  separate-by-one-line-in-contract

/home/micah/set-labs_audit_2018-11/contracts/core/interfaces/ITransferProxy.sol
  26:1  error  Definition must be surrounded with two blank line indent  two-lines-top-level-separator

/home/micah/set-labs_audit_2018-11/contracts/core/interfaces/ICore.sol
   73:5  error  Function order is incorrect, external_const function can not go after public function  func-order
   96:5  error  Function order is incorrect, external function can not go after public function        func-order
  106:5  error  Function order is incorrect, external function can not go after public function        func-order
  118:5  error  Function order is incorrect, external function can not go after public function        func-order
  131:5  error  Function order is incorrect, external function can not go after public function        func-order
  144:5  error  Function order is incorrect, external function can not go after public function        func-order
  155:5  error  Function order is incorrect, external function can not go after public function        func-order
  166:5  error  Function order is incorrect, external function can not go after public function        func-order
  178:5  error  Function order is incorrect, external function can not go after public function        func-order
  190:5  error  Function order is incorrect, external function can not go after public function        func-order
  203:5  error  Function order is incorrect, external function can not go after public function        func-order
  216:5  error  Function order is incorrect, external function can not go after public function        func-order
  228:5  error  Function order is incorrect, external function can not go after public function        func-order
  258:5  error  Function order is incorrect, external function can not go after public function        func-order
  282:5  error  Function order is incorrect, external function can not go after public function        func-order
  303:5  error  Function order is incorrect, external function can not go after public function        func-order
  318:5  error  Function order is incorrect, external function can not go after public function        func-order

/home/micah/set-labs_audit_2018-11/contracts/core/interfaces/ISetToken.sol
  26:1  error  Definition must be surrounded with two blank line indent                                    two-lines-top-level-separator
  80:5  error  Function order is incorrect, external function can not go after external constant function  func-order
  93:5  error  Function order is incorrect, external function can not go after external constant function  func-order

/home/micah/set-labs_audit_2018-11/contracts/core/interfaces/ISignatureValidator.sol
  26:1  error  Definition must be surrounded with two blank line indent  two-lines-top-level-separator

/home/micah/set-labs_audit_2018-11/contracts/core/exchange-wrappers/ZeroExExchangeWrapper.sol
   60:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
   68:5  error  Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
   98:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  167:5  error  Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract

/home/micah/set-labs_audit_2018-11/contracts/core/exchange-wrappers/lib/ZeroExOrderDataHandler.sol
   50:5   error    Definitions inside contract / library must be separated by one line  separate-by-one-line-in-contract
   66:5   error    Definitions inside contract / library must be separated by one line  separate-by-one-line-in-contract
   78:9   warning  Avoid to use inline assembly. It is acceptable only in rare cases    no-inline-assembly
   79:26  error    Comma must be separated from next element by space                   space-after-comma
   80:35  error    Comma must be separated from next element by space                   space-after-comma
   81:35  error    Comma must be separated from next element by space                   space-after-comma
  123:9   warning  Avoid to use inline assembly. It is acceptable only in rare cases    no-inline-assembly
  124:25  error    Comma must be separated from next element by space                   space-after-comma
  125:34  error    Comma must be separated from next element by space                   space-after-comma
  126:34  error    Comma must be separated from next element by space                   space-after-comma
  127:34  error    Comma must be separated from next element by space                   space-after-comma
  160:9   warning  Avoid to use inline assembly. It is acceptable only in rare cases    no-inline-assembly

/home/micah/set-labs_audit_2018-11/contracts/core/exchange-wrappers/TakerWalletWrapper.sol
   49:5  error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
   54:5  error    Open bracket must be on same line. It must be indented by other constructions by space  bracket-align
   74:5  error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  123:5  error    Definitions inside contract / library must be separated by one line                     separate-by-one-line-in-contract
  136:9  warning  Avoid to use inline assembly. It is acceptable only in rare cases                       no-inline-assembly

/home/micah/set-labs_audit_2018-11/contracts/core/lib/SignatureValidator.sol
  30:1  error  Definition must be surrounded with two blank line indent  two-lines-top-level-separator

/home/micah/set-labs_audit_2018-11/contracts/core/lib/EIP712Library.sol
  62:5  error    Definitions inside contract / library must be separated by one line  separate-by-one-line-in-contract
  73:9  warning  Avoid to use inline assembly. It is acceptable only in rare cases    no-inline-assembly
  77:2  error    Line length must be no more than 120 but current length is 135       max-line-length

/home/micah/set-labs_audit_2018-11/contracts/core/lib/auction-price-libraries/LinearAuctionPriceCurve.sol
  50:27  warning  Avoid to make time-based decisions in your business logic  not-rely-on-time

/home/micah/set-labs_audit_2018-11/contracts/core/lib/ExchangeHeaderLibrary.sol
  36:5   error    Definitions inside contract / library must be separated by one line  separate-by-one-line-in-contract
  51:5   error    Definitions inside contract / library must be separated by one line  separate-by-one-line-in-contract
  63:9   warning  Avoid to use inline assembly. It is acceptable only in rare cases    no-inline-assembly
  64:26  error    Comma must be separated from next element by space                   space-after-comma

/home/micah/set-labs_audit_2018-11/contracts/core/lib/CoreState.sol
  77:5  error  Definitions inside contract / library must be separated by one line  separate-by-one-line-in-contract
  86:5  error  Definitions inside contract / library must be separated by one line  separate-by-one-line-in-contract

/home/micah/set-labs_audit_2018-11/contracts/core/lib/OrderLibrary.sol
   31:1  error  Definition must be surrounded with two blank line indent                          two-lines-top-level-separator
   37:5  error  Definitions inside contract / library must be separated by one line               separate-by-one-line-in-contract
   75:2  error  Line length must be no more than 120 but current length is 123                    max-line-length
   77:5  error  Definitions inside contract / library must be separated by one line               separate-by-one-line-in-contract
  100:2  error  Line length must be no more than 120 but current length is 125                    max-line-length
  105:5  error  Definitions inside contract / library must be separated by one line               separate-by-one-line-in-contract
  129:2  error  Line length must be no more than 120 but current length is 124                    max-line-length
  169:2  error  Line length must be no more than 120 but current length is 124                    max-line-length
  175:5  error  Definitions inside contract / library must be separated by one line               separate-by-one-line-in-contract
  175:5  error  Function order is incorrect, internal function can not go after private function  func-order
  219:5  error  Function order is incorrect, internal function can not go after private function  func-order
  253:5  error  Function order is incorrect, internal function can not go after private function  func-order

✖ 169 problems (148 errors, 21 warnings)

