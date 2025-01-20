from math import tan, radians

square_width = 512

def point_to_svg_point(point: (float, float)):
    return str((point[0], square_width - point[1])).replace("(", "").replace(")", "")

triangle_height = 256 # The height of the big (not upside down) triangle.

circle_radius = square_width / 2

center = (square_width / 2, square_width / 2)

triangle_top = (center[0], center[1] + triangle_height / 2) # Point C in the triangle.

print("Found the top of the triangle " + str(triangle_top))

triangle_bottom = (center[0], center[1] - triangle_height / 2) # Not a part of the triangle, instead indicates the bottom line of the triangle.

print("Found the bottom of the triangle " + str(triangle_bottom))

# Calculating the side length s:
# tan(60 degrees) = h/(s/2)
# (s/2) * tan(60 degrees) = h
# s = 2h/tan(60 degrees)

triangle_side_length = 2 * triangle_height / tan(radians(60))

print("Calculated triangle side length: " + str(triangle_side_length))

triangle_right = (triangle_bottom[0] + triangle_side_length / 2, triangle_bottom[1])

triangle_left = (triangle_bottom[0] - triangle_side_length / 2, triangle_bottom[1])

# Line 1: (x - w/2) + w/2
# Line 2 (Triangle's right side): -h/(s/2) * (x - w/2) + w/2 + h/2
# -h/(s/2) * (x - w/2) + w/2 + h/2 = x
# => -h/(s/2) * x + hw/s + w/2 + h/2 = x
# => hw/s + w/2 + h/2 = x(1 + h/(s/2))
# => (hw/s + w/2 + h/2)/(1 + h/(s/2)) = x

intersection_right = (triangle_height * square_width / triangle_side_length + square_width / 2 + triangle_height / 2)/(1 + triangle_height/(triangle_side_length/2))

print("Right intersection: " + str(intersection_right))

intersection_left = square_width / 2 - (intersection_right - square_width / 2)

print("Left intersection: " + str(intersection_left))

svg_string = f"<svg width=\"{square_width}\" height=\"{square_width}\" xmlns=\"http://www.w3.org/2000/svg\">\n"

svg_string += f"  <polygon points=\"{point_to_svg_point(triangle_left)} {point_to_svg_point(center)} {point_to_svg_point(triangle_right)} {point_to_svg_point(triangle_top)}\" fill=\"white\" />\n"

svg_string += "</svg>\n"

print(svg_string)
