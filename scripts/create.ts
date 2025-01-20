import { writeFileSync, mkdirSync } from "fs";

const squareWidth = 512;

function pointToSvgPoint(point: [number, number]): string {
    return `${point[0]},${squareWidth - point[1]}`;
}

function flipPoint(point: [number, number]): [number, number] {
    const x = point[0];
    const y = point[1];

    return [squareWidth / 2 - (x - squareWidth / 2), y];
}

const triangleSideLength = 256;
const triangleHeight = triangleSideLength * Math.tan((60 * Math.PI) / 180) / 2; // The height of the big (not upside-down) triangle.
const smallSquareSideLength = 48;

const circleRadius = squareWidth / 2;

const objectFromTriangleDistance = 10;

const center: [number, number] = [squareWidth / 2, squareWidth / 2];

const triangleTop: [number, number] = [center[0], center[1] + triangleHeight / 2];
console.log(`Found the top of the triangle ${triangleTop}`);

const triangleBottom: [number, number] = [center[0], center[1] - triangleHeight / 2];
console.log(`Found the bottom of the triangle ${triangleBottom}`);

// Calculating the side length s:
// tan(60 degrees) = h / (s / 2)
// (s / 2) * tan(60 degrees) = h
// s = 2h / tan(60 degrees)

console.log(`Calculated triangle side length: ${triangleSideLength}`);

const triangleRight: [number, number] = [triangleBottom[0] + triangleSideLength / 2, triangleBottom[1]];

const triangleLeft: [number, number] = [triangleBottom[0] - triangleSideLength / 2, triangleBottom[1]];

const smallSquareTop: [number, number] = [center[0], center[1] - Math.sqrt(2) * objectFromTriangleDistance];

const smallSquareDiagonal = 2 * Math.sqrt(smallSquareSideLength ** 2 / 2);

const smallSquareCenter: [number, number] = [smallSquareTop[0], smallSquareTop[1] - smallSquareDiagonal / 2];

const smallSquareBottom: [number, number] = [smallSquareCenter[0], smallSquareCenter[1] - smallSquareDiagonal / 2];

const smallSquareRight: [number, number] = [smallSquareCenter[0] + smallSquareDiagonal / 2, smallSquareCenter[1]];
const smallSquareLeft: [number, number] = [smallSquareCenter[0] - smallSquareDiagonal / 2, smallSquareCenter[1]];

function triangleRightLine(x: number): number {
    return (-triangleHeight / (triangleSideLength / 2)) * (x - squareWidth / 2) + squareWidth / 2 + triangleHeight / 2;
}

const intersectionRight = (Math.sqrt(2) * objectFromTriangleDistance + (triangleHeight * squareWidth) / triangleSideLength + squareWidth / 2 + triangleHeight / 2) / (1 + triangleHeight / (triangleSideLength / 2));
console.log(`Right intersection: ${intersectionRight}`);

const intersectionLeft = squareWidth / 2 - (intersectionRight - squareWidth / 2);
console.log(`Left intersection: ${intersectionLeft}`);

const rightTriangleTopLeftX = intersectionRight + Math.sqrt(objectFromTriangleDistance ** 2 / 2);
const rightTriangleTopLeftY = triangleRightLine(intersectionRight) + Math.sqrt(objectFromTriangleDistance ** 2 / 2);

const rightTriangleTopLeft: [number, number] = [rightTriangleTopLeftX, rightTriangleTopLeftY];

const leftTriangleTopRight: [number, number] = [intersectionLeft - Math.sqrt(objectFromTriangleDistance ** 2 / 2), rightTriangleTopLeftY];

const intersectionRightBottom = (smallSquareDiagonal + Math.sqrt(2) * objectFromTriangleDistance + (triangleHeight * squareWidth) / triangleSideLength + squareWidth / 2 + triangleHeight / 2) / (1 + triangleHeight / (triangleSideLength / 2));

console.log(`Right bottom intersection: ${intersectionRightBottom}`);

const intersectionLeftBottom = squareWidth / 2 - (intersectionRightBottom - squareWidth / 2);

console.log(`Left bottom intersection: ${intersectionLeftBottom}`);

const rightTriangleBottomX = intersectionRightBottom + Math.sqrt(objectFromTriangleDistance ** 2 / 2);
const rightTriangleBottomY = triangleRightLine(intersectionRightBottom) + Math.sqrt(objectFromTriangleDistance ** 2 / 2);

const rightTriangleBottom: [number, number] = [rightTriangleBottomX, rightTriangleBottomY];

const leftTriangleBottom: [number, number] = [intersectionLeftBottom - Math.sqrt(objectFromTriangleDistance ** 2 / 2), rightTriangleBottom[1]];

// Line 1: (x - w/2) + w/2 - sqrt(2) * d - s_d
// Line 2 (Triangle's right side): i_2
// i_2 = x - sqrt(2) * d - s_d
// => s_d + sqrt(2) * d + i_2 = x

const rightTriangleRightX = smallSquareDiagonal + Math.sqrt(2) * objectFromTriangleDistance + rightTriangleTopLeftY;
const rightTriangleRightY = rightTriangleTopLeftY

const rightTriangleRight: [number, number] = [rightTriangleRightX, rightTriangleRightY];

const leftTriangleLeft = flipPoint(rightTriangleRight);

let svgString = `<svg width="${squareWidth}" height="${squareWidth}" xmlns="http://www.w3.org/2000/svg">\n`;

svgString += `  <polygon points="${pointToSvgPoint(triangleLeft)} ${pointToSvgPoint(center)} ${pointToSvgPoint(triangleRight)} ${pointToSvgPoint(triangleTop)}" fill="white" />\n`;
svgString += `  <polygon points="${pointToSvgPoint(smallSquareTop)} ${pointToSvgPoint(smallSquareRight)} ${pointToSvgPoint(smallSquareBottom)} ${pointToSvgPoint(smallSquareLeft)}" fill="white" />\n`;
svgString += `  <polygon points="${pointToSvgPoint(rightTriangleBottom)} ${pointToSvgPoint(rightTriangleRight)} ${pointToSvgPoint(rightTriangleTopLeft)}" fill="white" />\n`;
svgString += `  <polygon points="${pointToSvgPoint(leftTriangleBottom)} ${pointToSvgPoint(leftTriangleLeft)} ${pointToSvgPoint(leftTriangleTopRight)}" fill="white" />\n`;

svgString += `</svg>\n`;

mkdirSync("./logo/svg", { recursive: true });
writeFileSync("./logo/svg/logo.svg", svgString)
