// IMPORTS

import settings;
import geometry;

// USER SETTINGS

string type;
real borderDistance = 1;
real borderRadiusFraction = 0;

usersetting();

// DEFINITIONS

point center = (0, 0);

// MAIN POLYGON

path equilateralTriangle = polygon(3);

point equilateralTriangleRight = point(equilateralTriangle, 0);
point equilateralTriangleTop = point(equilateralTriangle, 1);
point equilateralTriangleLeft = point(equilateralTriangle, 2);

line equilateralTriangleRightSide = line(equilateralTriangleRight, false, equilateralTriangleTop, false);
line equilateralTriangleLeftSide = line(equilateralTriangleLeft, false, equilateralTriangleTop, false);

real rightTriangleHeight = equilateralTriangleLeft.y + equilateralTriangleRight.x;
point rightTriangleTop = (0, rightTriangleHeight);

path mainPolygon = equilateralTriangleRight--equilateralTriangleTop--equilateralTriangleLeft--rightTriangleTop--cycle;

// SMALL SQUARE

real centerToD = arclength(center--rightTriangleTop);
real diagonal = centerToD * 1/2;

point smallSquareTop = center + (0, diagonal);
point smallSquareRight = center + (diagonal, 0);
point smallSquareBottom = center - (0, diagonal);
point smallSquareLeft = center - (diagonal, 0);

real smallSquareTopToPolygon = distance(smallSquareTop, line(rightTriangleTop, false, equilateralTriangleRight, false));

path smallSquare = smallSquareTop--smallSquareRight--smallSquareBottom--smallSquareLeft--cycle;

line smallSquareBottomRight = line(smallSquareBottom, false, smallSquareRight, true);
line smallSquareBottomLeft = line(smallSquareBottom, false, smallSquareLeft, true);
line smallSquareTopLeft = line(smallSquareLeft, false, smallSquareTop, true);
line smallSquareTopRight = line(smallSquareRight, false, smallSquareTop, true);

// SIDE TRIANGLES

vector rightDistance = unit(-equilateralTriangleRightSide.v) * smallSquareTopToPolygon;
vector leftDistance = unit(equilateralTriangleLeftSide.v) * smallSquareTopToPolygon;

point pointOnRightLine = equilateralTriangleTop + rightDistance;
point pointOnLeftLine = equilateralTriangleTop + leftDistance;

line rightLine = parallel(pointOnRightLine, equilateralTriangleRightSide);
line leftLine = parallel(pointOnLeftLine, equilateralTriangleLeftSide);

point rightSideTriangleBottom = intersectionpoint(smallSquareBottomRight, rightLine);
point rightSideTriangleLeft = intersectionpoint(smallSquareTopLeft, rightLine);

point leftSideTriangleBottom = intersectionpoint(smallSquareBottomLeft, leftLine);
point leftSideTriangleRight = intersectionpoint(smallSquareTopRight, leftLine);

line sideTrianglesTop = line(leftSideTriangleRight, rightSideTriangleLeft);

point rightSideTriangleRight = intersectionpoint(sideTrianglesTop, smallSquareBottomRight);
point leftSideTriangleLeft = intersectionpoint(sideTrianglesTop, smallSquareBottomLeft);

path rightSideTriangle = rightSideTriangleLeft--rightSideTriangleRight--rightSideTriangleBottom--cycle;
path leftSideTriangle = leftSideTriangleRight--leftSideTriangleLeft--leftSideTriangleBottom--cycle;

// ASSERTIONS

real centerToA = arclength(center--equilateralTriangleRight);
real centerToB = arclength(center--equilateralTriangleTop);
real centerToC = arclength(center--equilateralTriangleLeft);

assert(centerToA - centerToB < realEpsilon & centerToB - centerToC < realEpsilon & centerToA - centerToC < realEpsilon, "Defined center is not exactly in the center of the equilateral triangle!");

// UNIVERSAL DEFINITIONS

real radius = centerToA + borderDistance * smallSquareTopToPolygon;

// VARIANTS

if (type == "circle") {
    path circle = circle(center, radius);

    filldraw(circle, black, black);
} else if (type == "square-centered") {
    point largeSquareTopRight = center + (radius, radius);
    point largeSquareBottomRight = center + (radius, -radius);
    point largeSquareBottomLeft = center - (radius, radius);
    point largeSquareTopLeft = center - (radius, -radius);

    path largeSquare = largeSquareTopRight--largeSquareBottomRight--largeSquareBottomLeft--largeSquareTopLeft--cycle;

    filldraw(largeSquare, black, black);
} else if (type == "square-equidistant") {
    // EQUATION TO FIND MARGIN
    // R_x = x value of equilateral triangle right point
    // S_s = side length of the big square
    // m = margin
    // r = border radius (specified by the user)
    // S_s = 2R_x + 2m
    // S_s * r <= m
    // => (2R_x + 2m) * r <= m
    // => 2R_x * r + 2mr <= m
    // => 2R_x * r <= m - 2mr
    // => 2R_x * r <= m(1 - 2r)
    // => (2R_x * r) / (1 - 2r) <= m

    real margin = (2 * equilateralTriangleRight.x * borderRadiusFraction) / (1 - 2 * borderRadiusFraction);
    write("Generating equidistant square with the following distance from the following margin");
    write(margin);

    real radius = equilateralTriangleRight.x + margin;

    point largeSquareTopRight = center + (radius, radius);
    point largeSquareBottomRight = center + (radius, -radius);
    point largeSquareBottomLeft = center - (radius, radius);
    point largeSquareTopLeft = center - (radius, -radius);

    real triangleToSquareTop = distance(equilateralTriangleTop, line(largeSquareTopLeft, false, largeSquareTopRight, false));

    point intermediarySquareTopRight = largeSquareTopRight - (0, triangleToSquareTop);
    point intermediarySquareBottomRight = largeSquareBottomRight - (0, triangleToSquareTop);
    point intermediarySquareBottomLeft = largeSquareBottomLeft - (0, triangleToSquareTop);
    point intermediarySquareTopLeft = largeSquareTopLeft - (0, triangleToSquareTop);

    real triangleToSquareBottom = distance(equilateralTriangleRight, line(intermediarySquareBottomLeft, false, intermediarySquareBottomRight, false));

    point equidistantSquareTopRight = intermediarySquareTopRight + (0, triangleToSquareBottom / 2);
    point equidistantSquareBottomRight = intermediarySquareBottomRight + (0, triangleToSquareBottom / 2);
    point equidistantSquareBottomLeft = intermediarySquareBottomLeft + (0, triangleToSquareBottom / 2);
    point equidistantSquareTopLeft = intermediarySquareTopLeft + (0, triangleToSquareBottom / 2);

    real equidistantSquareSideLength = equidistantSquareTopRight.x - equidistantSquareTopLeft.x;
    write("Equidistant square has the following side length:");
    write(equidistantSquareSideLength);

    path equidistantSquare = equidistantSquareTopRight--equidistantSquareBottomRight--equidistantSquareBottomLeft--equidistantSquareTopLeft--cycle;

    filldraw(equidistantSquare, black, black);
}

// DRAWING

filldraw(mainPolygon, white, white);
filldraw(smallSquare, white, white);

filldraw(rightSideTriangle, white, white);
filldraw(leftSideTriangle, white, white);

// IMAGE PROPERTIES

size(512);

pngdriver="pngalpha";
