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

import "@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "@openzeppelin/contracts/access/roles/MinterRole.sol";
import "./Permittable.sol";
import "./IPsi.sol";


contract Psi is IPsi, MinterRole, ERC20Detailed, Permittable, ERC20Burnable  {

    constructor()
    ERC20Detailed("Psi", "PSI", 18)
    Permittable()
    public
    { }

    function mint(address account, uint256 amount) public onlyMinter returns (bool) {
        _mint(account, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        _transfer(sender, recipient, amount);
        if (allowance(sender, _msgSender()) != uint256(-1)) {
            _approve(
                sender,
                _msgSender(),
                allowance(sender, _msgSender()).sub(amount, "Psi: transfer amount exceeds allowance"));
        }
        return true;
    }
}