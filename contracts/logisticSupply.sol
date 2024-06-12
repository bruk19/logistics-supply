// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract LogisticSupply {
    address public owner;
    uint256 public medCount = 0;
    uint256 public rawMatCount = 0;
    uint256 public manuCount = 0;
    uint256 public distCount = 0;
    uint256 public retailCount = 0;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "You are not the owner");
        _;
    }

    enum STAGE {
        Init,
        RawMaterialSupply,
        Manufacture,
        Distribution,
        Retail,
        Sold
    }

    struct medicine {
        uint256 id;
        string name;
        string discription;
        uint256 RMSid;
        uint256 MANid;
        uint256 DISTid;
        uint256 RTLid;
        STAGE stage;
    }
    mapping(uint256 => medicine) public medicineInfo;

    function showStage(uint _medicineId) public view returns (string memory) {
        require(medCount > 0, "No medine found");
        medicine storage medice = medicineInfo[_medicineId];
        if (medice.stage == STAGE.Init) {
            return "Medicine Ordered";
        } else if (medice.stage == STAGE.RawMaterialSupply) {
            return "Medicine on Raw Material Supply Stage";
        } else if (medice.stage == STAGE.Manufacture) {
            return "Medicine on Manufacture Stage";
        } else if (medice.stage == STAGE.Distribution) {
            return "Medicine on Distribution Stage";
        } else if (medice.stage == STAGE.Retail) {
            return "Medicine on Retail Stage";
        } else if (medice.stage == STAGE.Sold) {
            return "Medicine is Sold";
        }
    }

    struct rawMaterial {
      uint256 id;
      string name;
      address _addr;
      string place;
    }
}
