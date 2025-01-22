import { writeFileSync } from "fs";
import { logo } from "../functions/logo";
import { BackgroundType } from "../enums/BackgroundType";

const svg = logo();
const squareSvg = logo(true);
const circleSvg = logo(true, BackgroundType.Circle);
const backgroundSvg = logo(true, BackgroundType.Square);

writeFileSync("./logo/svg/logo.svg", svg)
writeFileSync("./logo/svg/square/logo.svg", squareSvg);
writeFileSync("./logo/svg/rounded/logo.svg", circleSvg);
writeFileSync("./logo/svg/background/logo.svg", backgroundSvg);
