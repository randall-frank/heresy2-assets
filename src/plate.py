import random

# Generate an HTML table that contains GLYPHX macros where the symbols corresponding to
# the numbers 6, 0, 2, 8 will only show up 1, 2, 3 and 4 times respectively (the position
# of the symbol in the combination)

# grid size
dx = 5
dy = 5
# 6028
specials = {}
specials['6'] = 1   # Star
specials['0'] = 2   # Crutch
specials['2'] = 3   # Scales
specials['8'] = 4   # Gear

# build a background "noise" grid of symbols (no special symbols in the background grid) 
grid = []
for j in range(dy):
    line = []
    for i in range(dx):
        n = hex(random.randint(0, 9))[2:].upper()
        while n in specials:
            n = hex(random.randint(0, 9))[2:].upper()
        line.append(n)
    grid.append(line)

# insert the special symbols "N" times (and do not replace another special symbol)
for key, count in specials.items():
    for i in range(count):
        x = random.randint(0, dx-1)
        y = random.randint(0, dy-1)
        while grid[y][x] in specials:
            x = random.randint(0, dx-1)
            y = random.randint(0, dy-1)
        grid[y][x] = key

# generate the table text
s = "<table style='width:100%'>"
for row in grid:
    r = "<tr>"
    for v in row:
        r += f"<th>GLYPH{v}</th>"
    r += "</tr>"
    s += r
s += "</table>"
print(s)
