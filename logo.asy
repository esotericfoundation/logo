// IMPORTS

import settings;
import geometry;

// IMAGE PROPERTIES

size(512);

pngdriver="pngalpha";

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

// TYPES

string type;

usersetting();

if (type == "circle") {
    path circle = circle(center, 1.5 * (centerToA + smallSquareTopToPolygon));

    filldraw(circle, black, black);
}

// DRAWING

filldraw(mainPolygon, white, white);
filldraw(smallSquare, white, white);

filldraw(rightSideTriangle, white, white);
filldraw(leftSideTriangle, white, white);
