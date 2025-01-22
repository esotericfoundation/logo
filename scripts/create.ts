import { writeFileSync } from "fs";
import { logo } from "../functions/logo";

const svg = logo();
const squareSvg = logo(true);

console.log(squareSvg)

writeFileSync("./logo/svg/logo.svg", svg)
writeFileSync("./logo/svg/square-logo.svg", squareSvg);
