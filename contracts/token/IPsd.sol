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
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract IPsd is IERC20 {
    function burn(uint256 amount) public;
    function burnFrom(address account, uint256 amount) public;
    function mint(address account, uint256 amount) public returns (bool);
}
