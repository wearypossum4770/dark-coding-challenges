def raindrops(drop):
    """
    DOCUMENTATION
    """
    bank = [
        "Pling",
        "Plang",
        "Plong",
    ]
    target = ""
    for index, num in enumerate([3, 5, 7]):
        if drop % num == 0:
            target += bank[index]

    return target if len(target) > 0 else str(drop)
