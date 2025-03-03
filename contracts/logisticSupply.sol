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
            return "Product Ordered";
        } else if (medice.stage == STAGE.RawMaterialSupply) {
            return "Product on Raw Material Supply Stage";
        } else if (medice.stage == STAGE.Manufacture) {
            return "Product on Manufacture Stage";
        } else if (medice.stage == STAGE.Distribution) {
            return "Product on Distribution Stage";
        } else if (medice.stage == STAGE.Retail) {
            return "Product on Retail Stage";
        } else if (medice.stage == STAGE.Sold) {
            return "Product is Sold";
        }
    }

    struct rawMaterial {
        uint256 id;
        string name;
        address _addr;
        string place;
    }
    mapping(uint256 => rawMaterial) public RMS;

    struct manufacture {
        uint256 id;
        string name;
        address _addr;
        string place;
    }
    mapping(uint256 => manufacture) public MAN;

    struct distributor {
        uint256 id;
        string name;
        address _addr;
        string place;
    }
    mapping(uint256 => distributor) public DST;

    struct retail {
        uint id;
        string name;
        address _addr;
        string place;
    }
    mapping(uint => retail) public RTL;

    function addRMS(
        string memory _name,
        address _addresss,
        string memory _place
    ) public onlyOwner {
        rawMatCount++;
        RMS[rawMatCount] = rawMaterial(rawMatCount, _name, _addresss, _place);
    }

    function addMAN(
        string memory _name,
        address _addresss,
        string memory _place
    ) public onlyOwner {
        manuCount++;
        MAN[manuCount] = manufacture(manuCount, _name, _addresss, _place);
    }

    function addDST(
        string memory _name,
        address _addresss,
        string memory _place
    ) public onlyOwner {
        distCount++;
        DST[distCount] = distributor(distCount, _name, _addresss, _place);
    }

    function addRTL(
        string memory _name,
        address _addresss,
        string memory _place
    ) public onlyOwner {
        retailCount++;
        RTL[retailCount] = retail(retailCount, _name, _addresss, _place);
    }

    function findRMS(address _address) private view returns (uint256) {
        require(rawMatCount > 0, "No retailer found");
        for (uint256 i = 0; i <= rawMatCount; i++) {
            if (RMS[i]._addr == _address) {
                return RMS[i].id;
            }
        }
        return 0;
    }

    function RMSupply(uint256 _medicineId) public {
        require(_medicineId <= medCount, "No medicine created with this Id");
        uint _id = findRMS(msg.sender);
        require(_id > 0, "Medicine Id not found");
        require(
            medicineInfo[_medicineId].stage == STAGE.Init,
            "Incorrect medicine stage"
        );

        medicineInfo[_medicineId].RMSid = _id;
        medicineInfo[_medicineId].stage = STAGE.RawMaterialSupply;
    }

    function findMAN(address _address) private view returns (uint256) {
        require(manuCount > 0, "No Manufacture found");
        for (uint256 i = 0; i <= manuCount; i++) {
            if (MAN[i]._addr == _address) {
                return MAN[i].id;
            }
        }
        return 0;
    }

    function MANSupply(uint256 _medicineId) public {
        require(_medicineId <= medCount, "No medicine created with this Id");
        uint _id = findRMS(msg.sender);
        require(_id > 0, "Medicine Id not found");
        require(
            medicineInfo[_medicineId].stage == STAGE.RawMaterialSupply,
            "Incorrect medicine stage"
        );

        medicineInfo[_medicineId].MANid = _id;
        medicineInfo[_medicineId].stage = STAGE.Manufacture;
    }

    function findDST(address _address) private view returns (uint256) {
        require(manuCount > 0, "No Distributor found");
        for (uint256 i = 0; i <= distCount; i++) {
            if (DST[i]._addr == _address) {
                return DST[i].id;
            }
        }
        return 0;
    }

    function DSTSupply(uint256 _medicineId) public {
        require(_medicineId <= medCount, "No medicine created with this Id");
        uint _id = findDST(msg.sender);
        require(_id > 0, "Medicine Id not found");
        require(
            medicineInfo[_medicineId].stage == STAGE.Manufacture,
            "Incorrect medicine stage"
        );

        medicineInfo[_medicineId].DISTid = _id;
        medicineInfo[_medicineId].stage = STAGE.Distribution;
    }

    function findRTL(address _address) private view returns (uint256) {
        require(manuCount > 0, "No Retailer found");
        for (uint256 i = 0; i <= distCount; i++) {
            if (RTL[i]._addr == _address) {
                return RTL[i].id;
            }
        }
        return 0;
    }

    function RTLSupply(uint256 _medicineId) public {
        require(_medicineId <= medCount, "No medicine created with this Id");
        uint _id = findRTL(msg.sender);
        require(_id > 0, "Medicine Id not found");
        require(
            medicineInfo[_medicineId].stage == STAGE.Distribution,
            "Incorrect medicine stage"
        );

        medicineInfo[_medicineId].RTLid = _id;
        medicineInfo[_medicineId].stage = STAGE.Retail;
    }

    function sold(uint _medicineId) public {
        require(
            _medicineId > 0 && _medicineId <= medCount,
            "No medicine created with this Id"
        );
        uint _id = findRTL(msg.sender);
        require(_id > 0, "Medicine Id not found");
        require(
            medicineInfo[_medicineId].stage == STAGE.Retail,
            "Incorrect medicine stage"
        );
        require(
            medicineInfo[_medicineId].RTLid == _id,
            "Medicine stage should be on retailer stage"
        );

        medicineInfo[_medicineId].stage = STAGE.Sold;
    }

    function addMedicine(string memory name, string memory discription) public onlyOwner {
        require(
            rawMatCount > 0 &&
                distCount > 0 &&
                manuCount > 0 &&
                retailCount > 0,
            "Please check raw material suplier, distributor, manufacture and retailer already found"
        );
        medCount++;
        medicineInfo[medCount] = medicine(
            medCount,
            name,
            discription,
            0,
            0,
            0,
            0,
            STAGE.Init
        );
    }
}
