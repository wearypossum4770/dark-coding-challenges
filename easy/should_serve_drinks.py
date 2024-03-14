def should_serve_drinks(age, on_break):
    return not on_break if age >= 18 else False
