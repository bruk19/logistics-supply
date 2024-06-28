# Supply Chain Management Frontend

> This is a decentralized supply chain management application built with Next.js and Solidity Ethereum smart contracts. It allows tracking of products through various stages of the supply chain, from raw material supply to retail sale.

## Contract Overview
The LogisticSupply contract allows for:

- Registration of supply chain participants (Raw Material Suppliers, Manufacturers, Distributors, and Retailers)
- Addition of new products to the system
- Tracking of products through different stages of the supply chain
- Updating product status as it moves through the supply chain


## Key Features

1. Participant Registration: The contract owner can register different types of participants in the supply chain.
2. Product Management: New products can be added and tracked through the system.
3. Stage Tracking: Products progress through predefined stages (Init, RawMaterialSupply, Manufacture, Distribution, Retail, Sold).
4. Access Control: Only the contract owner can add new participants, and only registered participants can update product stages.


## Contract Structure
#### Main Components:

- owner: Address of the contract deployer
- STAGE: Enum defining the different stages of the supply chain
- medicine: Struct representing a product in the system
- Structs for different participant types: rawMaterial, manufacture, distributor, retail
- Mappings to store participant and medicine information


## Key Functions::
### Participant Registration:

addRMS(): Add Raw Material Supplier
addMAN(): Add Manufacturer
addDST(): Add Distributor
addRTL(): Add Retailer


### Product Management:

addProduct(): Add a new product to the system

### Stage Updates:

RMSupply(): Update to Raw Material Supply stage
MANSupply(): Update to Manufacture stage
DSTSupply(): Update to Distribution stage
RTLSupply(): Update to Retail stage
sold(): Mark product as Sold


### Information Retrieval:

showStage(): Get the current stage of a product

## Usage

1. Deploy the contract to an Ethereum network.
2. The deploying address becomes the owner.
3. Owner registers supply chain participants using the respective add functions.
4. New products can be added using addMedicine().
5. Registered participants can update the stage of products as they move through the supply chain.
6. Anyone can check the current stage of a product using its ID.


### Security Considerations:

Only the owner can register new participants.
Stage updates are restricted to registered participants.
The contract includes checks to ensure products move through stages in the correct order.

### Development and Testing
To work with this contract:

- Use a Solidity development environment (Hardhat).
- Compile the contract using Solidity version 0.8.24 or compatible.
- Deploy to a test network before mainnet deployment.
- Thoroughly test all functions, especially the stage transition logic.

## Live Demo ()

[Live Demo Link]()

## Prerequisites

- MetaMask browser extension
- Basic understanding of Hardhat and Ethereum blockchain

## Getting Started
1. Clone the repository:
Copy code `git@github.com:bruk19/logistics-supply.git`
cd logistics-supply

2. Install dependencies:
Copy code npm install
# or
yarn install


### Prerequisites
- Have a computer and internet connection
- Have a basic knowledge of Solidity
- Have a basic knowledge of TypeScript
- Have a general understanding of what testing is
- Have visual-studio code or any other code editor installed on your computer.


### 🤝 Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

### License
This project is open-source and available under the MIT License.

### Acknowledgements
- The Ethereum community for providing tools and resources.
- Next.js and React communities for the fantastic frameworks.

## Author
👤 **Bruk Teshome**

- GitHub: [@githubhandle](https://github.com/bruk19)
- Twitter: [@twitterhandle](https://twitter.com/Bruktesh)
- LinkedIn: [LinkedIn](https://linkedin.com/in/bruk-teshome)


Feel free to check the [issues page](https://github.com/bruk19/logistics-supply/issues).

## Show your support

Give a ⭐️ if you like this project!


## 📝 License

This project is [MIT](./LICENSE) licensed.

_NOTE: we recommend using the [MIT license](https://choosealicense.com/licenses/mit/) - you can set it up quickly by [using templates available on GitHub](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-license-to-a-repository). You can also use [any other license](https://choosealicense.com/licenses/) if you wish._
