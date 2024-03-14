def accept_into_movie(age, is_supervised):
    return is_supervised if age < 15 else True
