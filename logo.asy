import geometry;

size(512, 512);

path triangle = polygon(3);

pair A = point(triangle, 0);
pair B = point(triangle, 1);
pair C = point(triangle, 2);

write("Equilateral triangle:");
write(triangle);

write("Points:");
write(A);
write(B);
write(C);

// (label("A", A));
// (label("B", B));
// (label("C", C));

pair D = (0, C.y + B.x - C.x);

write(D);

filldraw(A--B--C--D--cycle);

path unitSquare = polygon(4);
path square = scale(0.125)*(rotate(45)*unitSquare);

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

real centerToD = arclength(center--D);
real diagonal = centerToD * 1/2;

real centerToPolygon = distance(center, line(D, false, A, false));

pair K = center + (0, diagonal);
pair J = center + (diagonal, 0);
pair I = center + (0, -diagonal);
pair L = center + (-diagonal, 0);

real centerToA = arclength(center--A);
real centerToB = arclength(center--B);
real centerToC = arclength(center--C);

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

line triangleRight = line(A, false, B, false);
line triangleLeft = line(C, false, B, false);

var rightIntersect = intersectionpoint(right, triangleRight);
var leftIntersect = intersectionpoint(left, triangleLeft);

write(coordinates(rightIntersect));
write(coordinates(leftIntersect));

vector rightDistance = unit(triangleRight.v) * centerToPolygon;
vector leftDistance = unit(triangleLeft.v) * centerToPolygon;

write(x=rightDistance);
write(x=leftDistance);

point pointOnRightLine = B + rightDistance;
point pointOnLeftLine = B + leftDistance;

line rightLine = parallel(pointOnRightLine, triangleRight);
line leftLine = parallel(pointOnLeftLine, triangleLeft);
