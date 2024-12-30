def jim_orders(orders: [[int]]) -> [int]:
    queue = [(sum(order), index + 1) for (index, order) in enumerate(orders)]
    print("before", queue)
    # Sort by delivery time and then by customer index in case of ties
    queue.sort(key=lambda x: (x[0], x[1]))
    print("afer", queue)
    return [index for _, index in queue]


print(jim_orders([[1, 2], [2, 1], [1, 2]]))
