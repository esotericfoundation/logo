import geometry;

size(512, 512);

// This is the equilateral triangle that serves as a base for the logo.
// A right-angle triangle is cut out from the bottom of this triangle, forming the main shape of the logo.
path equilateralTriangle = polygon(3);

point equilateralTriangleRight = point(equilateralTriangle, 0);
point equilateralTriangleTop = point(equilateralTriangle, 1);
point equilateralTriangleLeft = point(equilateralTriangle, 2);

real rightAngleTriangleCathetus = equilateralTriangleLeft.y + equilateralTriangleRight.x;
pair rightAngleTriangleTop = (0, rightAngleTriangleCathetus);

filldraw(equilateralTriangleRight--equilateralTriangleTop--equilateralTriangleLeft--rightAngleTriangleTop--cycle);

path unitSquare = polygon(4);
path square = rotate(45)*unitSquare;

pair E = point(square, 0);
pair F = point(square, 1);
pair G = point(square, 2);
pair H = point(square, 3);

write("Small square:");
write(square);

write("Points:");
write(E);
write(F);
write(G);
write(H);

pair center = (0, 0);

real centerToD = arclength(center--rightAngleTriangleTop);
real diagonal = centerToD * 1/2;

real centerToPolygon = distance(center, line(rightAngleTriangleTop, false, equilateralTriangleRight, false));

pair K = center + (0, diagonal);
pair J = center + (diagonal, 0);
pair I = center + (0, -diagonal);
pair L = center + (-diagonal, 0);

real centerToA = arclength(center--equilateralTriangleRight);
real centerToB = arclength(center--equilateralTriangleTop);
real centerToC = arclength(center--equilateralTriangleLeft);

write(centerToA);
write(centerToB);
write(centerToC);

filldraw(I--J--K--L--cycle);

// label("I", I);
// label("J", J);
// label("K", K);
// label("L", L);

line right = line(I, false, J, true);
line left = line(I, false, L, true);

line triangleRight = line(equilateralTriangleRight, false, equilateralTriangleTop, false);
line triangleLeft = line(equilateralTriangleLeft, false, equilateralTriangleTop, false);

var rightIntersect = intersectionpoint(right, triangleRight);
var leftIntersect = intersectionpoint(left, triangleLeft);

write(coordinates(rightIntersect));
write(coordinates(leftIntersect));

vector rightDistance = unit(triangleRight.v) * centerToPolygon;
vector leftDistance = unit(triangleLeft.v) * centerToPolygon;

write(x=rightDistance);
write(x=leftDistance);

point pointOnRightLine = equilateralTriangleTop + rightDistance;
point pointOnLeftLine = equilateralTriangleTop + leftDistance;

line rightLine = parallel(pointOnRightLine, triangleRight);
line leftLine = parallel(pointOnLeftLine, triangleLeft);
