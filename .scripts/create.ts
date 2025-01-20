const squareWidth = 512;

function pointToSvgPoint(point: [number, number]): string {
    return `${point[0]},${squareWidth - point[1]}`;
}

const triangleHeight = 256; // The height of the big (not upside-down) triangle.
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

const triangleSideLength = (2 * triangleHeight) / Math.tan((60 * Math.PI) / 180);
console.log(`Calculated triangle side length: ${triangleSideLength}`);

const triangleRight: [number, number] = [
    triangleBottom[0] + triangleSideLength / 2,
    triangleBottom[1],
];

const triangleLeft: [number, number] = [
    triangleBottom[0] - triangleSideLength / 2,
    triangleBottom[1],
];

const smallSquareTop: [number, number] = [
    center[0],
    center[1] - Math.sqrt(2) * objectFromTriangleDistance,
];

const smallSquareDiagonal = 2 * Math.sqrt((smallSquareSideLength ** 2) / 2);

const smallSquareCenter: [number, number] = [
    smallSquareTop[0],
    smallSquareTop[1] - smallSquareDiagonal / 2,
];

const smallSquareBottom: [number, number] = [
    smallSquareCenter[0],
    smallSquareCenter[1] - smallSquareDiagonal / 2,
];

const smallSquareRight: [number, number] = [
    smallSquareCenter[0] + smallSquareDiagonal / 2,
    smallSquareCenter[1],
];
const smallSquareLeft: [number, number] = [
    smallSquareCenter[0] - smallSquareDiagonal / 2,
    smallSquareCenter[1],
];

function triangleRightLine(x: number): number {
    return (
        (-triangleHeight / (triangleSideLength / 2)) * (x - squareWidth / 2) +
        squareWidth / 2 +
        triangleHeight / 2
    );
}

const intersectionRight =
    (Math.sqrt(2) * objectFromTriangleDistance +
        (triangleHeight * squareWidth) / triangleSideLength +
        squareWidth / 2 +
        triangleHeight / 2) /
    (1 + triangleHeight / (triangleSideLength / 2));
console.log(`Right intersection: ${intersectionRight}`);

const intersectionLeft =
    squareWidth / 2 - (intersectionRight - squareWidth / 2);
console.log(`Left intersection: ${intersectionLeft}`);

const rightTriangleTopLeft: [number, number] = [
    intersectionRight +
        Math.sqrt(objectFromTriangleDistance ** 2 / 2),
    triangleRightLine(
        intersectionRight +
            Math.sqrt(objectFromTriangleDistance ** 2 / 2)
    ),
];

const leftTriangleTopRight: [number, number] = [
    intersectionLeft -
        Math.sqrt(objectFromTriangleDistance ** 2 / 2),
    rightTriangleTopLeft[0],
];

const intersectionRightBottom =
    (smallSquareDiagonal +
        Math.sqrt(2) * objectFromTriangleDistance +
        (triangleHeight * squareWidth) / triangleSideLength +
        squareWidth / 2 +
        triangleHeight / 2) /
    (1 + triangleHeight / (triangleSideLength / 2));

const intersectionLeftBottom =
    squareWidth / 2 - (intersectionRightBottom - squareWidth / 2);

const rightTriangleBottom: [number, number] = [
    intersectionRightBottom +
        Math.sqrt(objectFromTriangleDistance ** 2 / 2),
    triangleRightLine(
        intersectionRightBottom +
            Math.sqrt(objectFromTriangleDistance ** 2 / 2)
    ),
];

const leftTriangleBottom: [number, number] = [
    intersectionLeftBottom -
        Math.sqrt(objectFromTriangleDistance ** 2 / 2),
    rightTriangleBottom[1],
];

const rightTriangleRight: [number, number] = [
    (smallSquareDiagonal +
        Math.sqrt(2) * objectFromTriangleDistance +
        rightTriangleTopLeft[1]) /
        (1 + triangleHeight / (triangleSideLength / 2)),
    rightTriangleTopLeft[1],
];

let svgString = `<svg width="${squareWidth}" height="${squareWidth}" xmlns="http://www.w3.org/2000/svg">\n`;

svgString += `  <polygon points="${pointToSvgPoint(triangleLeft)} ${pointToSvgPoint(center)} ${pointToSvgPoint(triangleRight)} ${pointToSvgPoint(triangleTop)}" fill="white" />\n`;
svgString += `  <polygon points="${pointToSvgPoint(smallSquareTop)} ${pointToSvgPoint(smallSquareRight)} ${pointToSvgPoint(smallSquareBottom)} ${pointToSvgPoint(smallSquareLeft)}" fill="white" />\n`;
svgString += `  <polygon points="${pointToSvgPoint(rightTriangleBottom)} ${pointToSvgPoint(rightTriangleRight)} ${pointToSvgPoint(rightTriangleTopLeft)}" fill="white" />\n`;

svgString += `</svg>\n`;

console.log(svgString);
