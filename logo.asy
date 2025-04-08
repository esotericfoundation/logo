import geometry;

size(512, 512);

// This is the equilateral triangle that serves as a base for the logo.
// A right-angle triangle is cut out from the bottom of this triangle, forming the main shape of the logo.
path equilateralTriangle = polygon(3);

point equilateralTriangleRight = point(equilateralTriangle, 0);
point equilateralTriangleTop = point(equilateralTriangle, 1);
point equilateralTriangleLeft = point(equilateralTriangle, 2);

real rightAngleTriangleLegLength = equilateralTriangleLeft.y + equilateralTriangleRight.x;
pair rightAngleTriangleTop = (0, rightAngleTriangleLegLength);

filldraw(equilateralTriangleRight--equilateralTriangleTop--equilateralTriangleLeft--rightAngleTriangleTop--cycle);

pair center = (0, 0);

real centerToD = arclength(center--rightAngleTriangleTop);
real diagonal = centerToD * 1/2;

real centerToPolygon = distance(center, line(rightAngleTriangleTop, false, equilateralTriangleRight, false));

pair smallSquareTop = center + (0, diagonal);
pair smallSquareRight = center + (diagonal, 0);
pair smallSquareBottom = center - (0, diagonal);
pair smallSquareLeft = center - (diagonal, 0);

real centerToA = arclength(center--equilateralTriangleRight);
real centerToB = arclength(center--equilateralTriangleTop);
real centerToC = arclength(center--equilateralTriangleLeft);

write(centerToA);
write(centerToB);
write(centerToC);

filldraw(smallSquareTop--smallSquareRight--smallSquareBottom--smallSquareLeft--cycle);

// label("I", I);
// label("J", J);
// label("K", K);
// label("L", L);

line smallSquareBottomRightSide = line(smallSquareBottom, false, smallSquareRight, true);
line smallSquareBottomLeftSide = line(smallSquareBottom, false, smallSquareLeft, true);

line equilateralTriangleRightSide = line(equilateralTriangleRight, false, equilateralTriangleTop, false);
line equilateralTriangleLeftSide = line(equilateralTriangleLeft, false, equilateralTriangleTop, false);

var rightIntersect = intersectionpoint(smallSquareBottomRightSide, equilateralTriangleRightSide);
var leftIntersect = intersectionpoint(smallSquareBottomLeftSide, equilateralTriangleLeftSide);

write(coordinates(rightIntersect));
write(coordinates(leftIntersect));

vector rightDistance = unit(equilateralTriangleRightSide.v) * centerToPolygon;
vector leftDistance = unit(equilateralTriangleLeftSide.v) * centerToPolygon;

write(x=rightDistance);
write(x=leftDistance);

point pointOnRightLine = equilateralTriangleTop + rightDistance;
point pointOnLeftLine = equilateralTriangleTop + leftDistance;

line rightLine = parallel(pointOnRightLine, equilateralTriangleRightSide);
line leftLine = parallel(pointOnLeftLine, equilateralTriangleLeftSide);
