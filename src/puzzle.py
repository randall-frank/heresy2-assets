import random
random.seed()

def generate_puzzle():
    solution = [0,0,0,-1]
    alg = []
    # the final value must be [0,9999] for the 4 digit GUI
    count = 0
    while (min(solution) < 0) or (max(solution) > 9999):
        m = random.randint(2, 30)
        if m == 0:
            continue
        b = random.randint(-100, 100)
        start = random.randint(0, 50)
        solution = [start]
        while len(solution) < 5:
            solution.append(m*solution[-1] + b)
        count += 1
        alg = [m, b, count]
        # print("Tried: ", solution, count, m, b)
    return solution, alg

for i in range(1000):
    print(generate_puzzle())
