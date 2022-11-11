import Web3 from 'web3';
import dotenv from "dotenv";
import { ethers } from "hardhat";
import { HelloWorld } from "../typechain-types";

dotenv.config();

console.log(process.env["API_URL"])
const web3 = new Web3(process.env["API_URL"] as string);
const contractAddress = "0x764c47D4b7Ad5b5e1F5cF704f46973d45C265AD0"

export async function updateMsg() {
    // 读取 address 中的余额，余额单位是 wei
    const wei = await web3.eth.getBalance(contractAddress)
    let balance = web3.utils.fromWei(wei, 'ether')
    console.log("balance: " + balance)
    console.log("================================")

    let contract = await ethers.getContractAt("HelloWorld", contractAddress) as HelloWorld
    let msg = await contract.message()
    console.log(msg)

    console.log("================================")

    await contract.update(msg + "1")
    msg = await contract.message()
    console.log(msg)
}
