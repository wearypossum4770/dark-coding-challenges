def grading_students(grades):
    """
    DOCUMENTATION
    """
    return [
        grade if grade < 38 or grade % 5 < 3 else grade + 5 - grade % 5
        for grade in grades
    ]
