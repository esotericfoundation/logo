#!/bin/bash

# Clean output folder
rm -rf 'output'
mkdir -p 'output'

# Base logo
asy logo -f png -o './output/logo'
asy logo -f svg -o './output/logo'

# Circle around logo
# Used for: Discord
asy logo -f png -u 'type = "circle"; borderDistance = 3' -o './output/logo-circle'
asy logo -f svg -u 'type = "circle"; borderDistance = 3' -o './output/logo-circle'

# Square around logo
asy logo -f png -u 'type = "square-centered"' -o './output/logo-square-centered'
asy logo -f svg -u 'type = "square-centered"' -o './output/logo-square-centered'

# Equidistant square
# Used for: GitHub

# GitHub border-radius-fraction calculations:
# 1rem = 16px because the font-size property of the root HTML element is 16px.

# The places that GitHub displays organization logos include, but may or may not be limited to:

# The organization homepage
# Example: https://github.com/esotericfoundation
# width: 100px
# height: 100px
# border-radius: var(--borderRadius-medium) = 0.375rem = 3/8 * 1rem = 3/8 * 16px = 6px
# border-radius-fraction: 6px/100px = 6/100 = 3/50

# The organization settings page
# Example: https://github.com/organizations/esotericfoundation/settings/profile
# width: 200px
# height: 200px
# border-radius: var(--borderRadius-medium, 6px) = 0.375rem = 3/8 * 1rem = 3/8 * 16px = 6px
# border-radius-fraction: 6px/200px = 6/200 = 3/100

# Organization repositories
# Example: https://github.com/esotericfoundation/logo
# width: 24px
# height: 24px
# border-radius: var(--borderRadius-medium) = 0.375rem = 3/8 * 1rem = 3/8 * 16px = 6px
# border-radius-fraction: 6px/24px = 6/24 = 1/4

# Organization member pages
# Example: https://github.com/esotericenderman
# width: 32px
# height: 32px
# border-radius: var(--borderRadius-medium) = 0.375rem = 3/8 * 1rem = 3/8 * 16px = 6px
# border-radius-fraction: 6px/32px = 6/32 = 3/16

# GitHub homepage (relevant repositories in the organization)
# Examples: https://github.com/
# width: 16px
# height: 16px
# border-radius: var(--borderRadius-small) = 0.1875rem = 3/16 * 1rem = 3/16 * 16px = 3px
# border-radius-fraction: 3px/16px = 3/16

# Greatest border-radius-fraction: 1/4
asy logo -f svg -u 'type = "square-equidistant"; borderRadiusFraction = 1/4' -o './output/logo-square-equidistant'
asy logo -f png -u 'type = "square-equidistant"; borderRadiusFraction = 1/4' -o './output/logo-square-equidistant'
