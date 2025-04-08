// IMPORTS

import geometry;

// IMAGE PROPERTIES

size(512, 512);

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

real centerToPolygon = distance(center, line(rightTriangleTop, false, equilateralTriangleRight, false));

point smallSquareTop = center + (0, diagonal);
point smallSquareRight = center + (diagonal, 0);
point smallSquareBottom = center - (0, diagonal);
point smallSquareLeft = center - (diagonal, 0);

path smallSquare = smallSquareTop--smallSquareRight--smallSquareBottom--smallSquareLeft--cycle;

line smallSquareBottomRight = line(smallSquareBottom, false, smallSquareRight, true);
line smallSquareBottomLeft = line(smallSquareBottom, false, smallSquareLeft, true);

// SIDE TRIANGLES

vector rightDistance = unit(equilateralTriangleRightSide.v) * centerToPolygon;
vector leftDistance = unit(equilateralTriangleLeftSide.v) * centerToPolygon;

point pointOnRightLine = equilateralTriangleTop + rightDistance;
point pointOnLeftLine = equilateralTriangleTop + leftDistance;

line rightLine = parallel(pointOnRightLine, equilateralTriangleRightSide);
line leftLine = parallel(pointOnLeftLine, equilateralTriangleLeftSide);

// ASSERTIONS

real centerToA = arclength(center--equilateralTriangleRight);
real centerToB = arclength(center--equilateralTriangleTop);
real centerToC = arclength(center--equilateralTriangleLeft);

assert(centerToA - centerToB < realEpsilon & centerToB - centerToC < realEpsilon & centerToA - centerToC < realEpsilon, "Defined center is not exactly in the center of the equilateral triangle!");

// DRAWING

filldraw(mainPolygon);
filldraw(smallSquare);
