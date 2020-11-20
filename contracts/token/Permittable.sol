/* 

    Copyright (c) 2020 Psi Protocol Team <psifinance@protonmail.com>

    Licensed under the GNU General Public License v3.0
    You may not use this file except in compliance with the License.
    You should have received a copy of the license file along with psi,
    If not, see <http://www.gnu.org/licenses/>

    This file is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License v3.0 for more details.

*/

pragma solidity ^0.5.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "../lib/Require.sol";
import "../lib/LibEIP712.sol";
import "../lib/Constants.sol";

contract Permittable is ERC20Detailed, ERC20 {
    bytes32 constant FILE = "Permittable";

    // keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)");
    bytes32 public constant EIP712_PERMIT_TYPEHASH = 0x6e71edae12b1b97f4d1f60370fef10105fa2faae0126114a169c64845d6126c9;
    string private constant EIP712_VERSION = "1";

    bytes32 public EIP712_DOMAIN_SEPARATOR;

    mapping(address => uint256) nonces;

    constructor() public {
        EIP712_DOMAIN_SEPARATOR = LibEIP712.hashEIP712Domain(name(), EIP712_VERSION, Constants.getChainId(), address(this));
    }

    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external {
        bytes32 digest = LibEIP712.hashEIP712Message(
            EIP712_DOMAIN_SEPARATOR,
            keccak256(abi.encode(
                EIP712_PERMIT_TYPEHASH,
                owner,
                spender,
                value,
                nonces[owner]++,
                deadline
            ))
        );

        address recovered = ecrecover(digest, v, r, s);
        Require.that(
            recovered == owner,
            FILE,
            "Invalid signature"
        );

        Require.that(
            recovered != address(0),
            FILE,
            "Zero address"
        );

        Require.that(
            now <= deadline,
            FILE,
            "Expired"
        );

        _approve(owner, spender, value);
    }
}