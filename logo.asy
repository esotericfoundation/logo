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

filldraw(triangle);
