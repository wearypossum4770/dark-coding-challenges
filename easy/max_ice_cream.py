def max_ice_cream(costs: list[int], coins: int) -> int:
    cones = 0
    costs.sort()
    for cost in costs:
        if cost <= coins:
            cones += 1
            coins -= cost
    return cones
