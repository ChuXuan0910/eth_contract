import { ethers } from "hardhat";
import { HelloWorld__factory } from "../typechain-types";

async function main() {
    const HelloWorld = await ethers.getContractFactory("HelloWorld") as HelloWorld__factory;

    // Start deployment, returning a promise that resolves to a contract object
    const hello_world = await HelloWorld.deploy("Hello World!");
    console.log("Contract deployed to address:", hello_world.address);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });

