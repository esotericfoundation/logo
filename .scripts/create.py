from math import tan, radians, sqrt

square_width = 512

def point_to_svg_point(point: (float, float)):
    return str((point[0], square_width - point[1])).replace("(", "").replace(")", "")

triangle_height = 256 # The height of the big (not upside down) triangle.
small_square_side_length = 48

circle_radius = square_width / 2

object_from_triangle_distance = 10

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

small_square_top = (center[0], center[1] - sqrt(2) * object_from_triangle_distance)

small_square_diagonal = 2 * sqrt((small_square_side_length ** 2) / 2)

small_square_center = (small_square_top[0], small_square_top[1] - small_square_diagonal / 2)

small_square_bottom = (small_square_center[0], small_square_center[1] - small_square_diagonal / 2)

small_square_right = (small_square_center[0] + small_square_diagonal / 2, small_square_center[1])
small_square_left = (small_square_center[0] - small_square_diagonal / 2, small_square_center[1])

def triangle_right_line(x: float):
    return -triangle_height / (triangle_side_length / 2) * (x - square_width / 2) + square_width / 2 + triangle_height / 2

# Line 1: (x - w/2) + w/2 - sqrt(2) * d
# Line 2 (Triangle's right side): -h/(s/2) * (x - w/2) + w/2 + h/2
# -h/(s/2) * (x - w/2) + w/2 + h/2 = x - sqrt(2) * d
# => sqrt(2) * d - h/(s/2) * x + hw/s + w/2 + h/2 = x
# => sqrt(2) * d + hw/s + w/2 + h/2 = x(1 + h/(s/2))
# => (sqrt(2) * d + hw/s + w/2 + h/2)/(1 + h/(s/2)) = x

intersection_right = (sqrt(2) * object_from_triangle_distance + triangle_height * square_width / triangle_side_length + square_width / 2 + triangle_height / 2)/(1 + triangle_height/(triangle_side_length/2))

print("Right intersection: " + str(intersection_right))

intersection_left = square_width / 2 - (intersection_right - square_width / 2)

print("Left intersection: " + str(intersection_left))

right_triangle_top_left = (intersection_right + sqrt(((object_from_triangle_distance) ** 2) / 2), triangle_right_line(intersection_right + sqrt(((object_from_triangle_distance) ** 2) / 2)))

left_triangle_top_right = (intersection_left - sqrt(((object_from_triangle_distance) ** 2) / 2), right_triangle_top_left[0])

# Line 1: (x - w/2) + w/2 - sqrt(2) * d - s_d
# Line 2 (Triangle's right side): -h/(s/2) * (x - w/2) + w/2 + h/2
# -h/(s/2) * (x - w/2) + w/2 + h/2 = x - sqrt(2) * d - s_d
# => s_d + sqrt(2) * d - h/(s/2) * x + hw/s + w/2 + h/2 = x
# => s_d + sqrt(2) * d + hw/s + w/2 + h/2 = x(1 + h/(s/2))
# => (s_d + sqrt(2) * d + hw/s + w/2 + h/2)/(1 + h/(s/2)) = x

intersection_right_bottom = (small_square_diagonal + sqrt(2) * object_from_triangle_distance + triangle_height * square_width / triangle_side_length + square_width / 2 + triangle_height / 2)/(1 + triangle_height/(triangle_side_length/2))

intersection_left_bottom = square_width / 2 - (intersection_right_bottom - square_width / 2)

right_triangle_bottom = (intersection_right_bottom + sqrt(((object_from_triangle_distance) ** 2) / 2), triangle_right_line(intersection_right_bottom + sqrt(((object_from_triangle_distance) ** 2) / 2)))

left_triangle_bottom = (intersection_left_bottom - sqrt(((object_from_triangle_distance) ** 2) / 2), right_triangle_bottom[1])

# Line 1: (x - w/2) + w/2 - sqrt(2) * d - s_d
# Line 2 (Triangle's right side): i_2
# i_2 = x - sqrt(2) * d - s_d
# => s_d + sqrt(2) * d + i_2 = x
# => s_d + sqrt(2) * d + i_2 = x(1 + h/(s/2))
# => (s_d + sqrt(2) * d + i_2)/(1 + h/(s/2)) = x

right_triangle_right = ((small_square_diagonal + sqrt(2) * object_from_triangle_distance + right_triangle_top_left[1])/(1 + triangle_height/(triangle_side_length / 2)), right_triangle_top_left[1])

# SVG CREATION:

svg_string = f"<svg width=\"{square_width}\" height=\"{square_width}\" xmlns=\"http://www.w3.org/2000/svg\">\n"

svg_string += f"  <polygon points=\"{point_to_svg_point(triangle_left)} {point_to_svg_point(center)} {point_to_svg_point(triangle_right)} {point_to_svg_point(triangle_top)}\" fill=\"white\" />\n"
svg_string += f"  <polygon points=\"{point_to_svg_point(small_square_top)} {point_to_svg_point(small_square_right)} {point_to_svg_point(small_square_bottom)} {point_to_svg_point(small_square_left)}\" fill=\"white\" />\n"
svg_string += f"  <polygon points=\"{point_to_svg_point(right_triangle_bottom)} {point_to_svg_point(right_triangle_right)} {point_to_svg_point(right_triangle_top_left)}\" fill=\"white\" />\n"

svg_string += "</svg>\n"

print(svg_string)
