import { updateMsg } from "./scripts/helloWord";


async function main() {
    await updateMsg()
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
