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

import "./Decimal.sol";

library Constants {
    /* Chain */
    uint256 private constant CHAIN_ID = 1; // Mainnet

    /* Bootstrapping */
    uint256 private constant BOOTSTRAPPING_PERIOD = 90;
    uint256 private constant BOOTSTRAPPING_PRICE = 11e17; // 1.10 USDC
    uint256 private constant BOOTSTRAPPING_SPEEDUP_FACTOR = 3; // 30 days @ 8 hours

    /* Oracle */
    address private constant USDC = address(0);
    uint256 private constant ORACLE_RESERVE_MINIMUM = 1e10; // 10,000 USDC

    /* Bonding */
    uint256 private constant INITIAL_STAKE_MULTIPLE = 1e6; // 100 PSI -> 100M SPSI

    /* Epoch */
    uint256 private constant EPOCH_PERIOD = 86400; // 1 day

    /* Governance */
    uint256 private constant GOVERNANCE_PERIOD = 7;
    uint256 private constant GOVERNANCE_QUORUM = 33e16; // 33%

    /* DAO */
    uint256 private constant ADVANCE_INCENTIVE = 1e20; // 100 PSI

    /* Market */
    uint256 private constant COUPON_EXPIRATION = 90;

    /* Regulator */
    uint256 private constant SUPPLY_CHANGE_LIMIT = 1e17; // 10%
    uint256 private constant ORACLE_POOL_RATIO = 20; // 20%


    /**
     * Getters
     */

    function getUsdc() internal pure returns (address) {
        return USDC;
    }

    function getOracleReserveMinimum() internal pure returns (uint256) {
        return ORACLE_RESERVE_MINIMUM;
    }

    function getEpochPeriod() internal pure returns (uint256) {
        return EPOCH_PERIOD;
    }

    function getInitialStakeMultiple() internal pure returns (uint256) {
        return INITIAL_STAKE_MULTIPLE;
    }

    function getBootstrappingPeriod() internal pure returns (uint256) {
        return BOOTSTRAPPING_PERIOD;
    }

    function getBootstrappingPrice() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: BOOTSTRAPPING_PRICE});
    }

    function getBootstrappingSpeedupFactor() internal pure returns (uint256) {
        return BOOTSTRAPPING_SPEEDUP_FACTOR;
    }

    function getGovernancePeriod() internal pure returns (uint256) {
        return GOVERNANCE_PERIOD;
    }

    function getGovernanceQuorum() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: GOVERNANCE_QUORUM});
    }

    function getAdvanceIncentive() internal pure returns (uint256) {
        return ADVANCE_INCENTIVE;
    }

    function getBondExpiration() internal pure returns (uint256) {
        return COUPON_EXPIRATION;
    }

    function getSupplyChangeLimit() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: SUPPLY_CHANGE_LIMIT});
    }

    function getOraclePoolRatio() internal pure returns (uint256) {
        return ORACLE_POOL_RATIO;
    }

    function getChainId() internal pure returns (uint256) {
        return CHAIN_ID;
    }
}
