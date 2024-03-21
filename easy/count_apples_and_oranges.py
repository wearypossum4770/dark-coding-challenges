def reducer(start, end, tree, basket):
    count = 0
    for fruit in basket:
        distance = tree + fruit
        if (start<= distance and end >= distance):
            count += 1
    return count
def count_apples_and_oranges(s, t, a,b, m,n,apples, oranges):
    appleDistances = reducer(s, t, a, apples)
    orangeDistances = reducer(s, t, b, oranges)
    return [appleDistances, orangeDistances,]
