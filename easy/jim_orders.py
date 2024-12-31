def jim_orders(orders: [[int]]) -> [int]:
    queue = [(sum(order), index + 1) for (index, order) in enumerate(orders)]
    queue.sort(key=lambda x: (x[0], x[1]))
    return [index for _, index in queue]
