import { writeFileSync } from "fs";
import { logo } from "../functions/logo";

const svg = logo();
const squareSvg = logo(true);
const circleSvg = logo(true, true);

writeFileSync("./logo/svg/logo.svg", svg)
writeFileSync("./logo/svg/square/logo.svg", squareSvg);
writeFileSync("./logo/svg/rounded/logo.svg", circleSvg);
