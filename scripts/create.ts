import { writeFileSync } from "fs";
import { logo } from "../functions/logo";

const svg = logo();

writeFileSync("./logo/svg/logo.svg", svg)
