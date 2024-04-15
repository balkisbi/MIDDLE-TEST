# SQL 1 : Find the 3rd Highest Salary
Task

You will be given a table.
The table has 2 columns: employee, and salary.
Please output the 3rd Highest Salary!

*CREATE TABLE*

      CREATE TABLE employee_table (
  
      employee TEXT NOT NULL,
      
      salary INTEGER
      
      );

*INSERT DATA*

    INSERT INTO employee_table (employee, salary) 
	  VALUES ('Alice', 11),('Benn', 43),('Charles', 33),('Dorothy', 55),('Emma', 22),('Franklin', 33);

*SELECT TABLE*

    SELECT * FROM employee_table

*the 3rd Highest Salary*

    SELECT DISTINCT salary
    FROM employee_table
    ORDER BY salary DESC
    LIMIT 1 OFFSET 2;

# SQL 2 : Find Items Bought

Task

Given table with 2 columns: buyer and item.

Buyer contains the name of buyer
Item contains the name of item bought
Return the name of items that is neither bought the most, nor bought the least.

*CREATE TABLE*

    CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
    );

*INSERT DATA*

    CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
    );

*SELECT TABLE*

    SELECT * FROM item_bought

*what is the item that is NOT bought the most, and NOT bought the last? Samsung only*

    SELECT item
    FROM (
    SELECT item, COUNT(item) AS total_bought
    FROM item_bought
    GROUP BY item
    ) AS item_counts
    WHERE total_bought != (SELECT MAX(total_bought) FROM (SELECT COUNT(item) AS total_bought FROM item_bought GROUP BY item) AS temp)
    AND total_bought != (SELECT MIN(total_bought) FROM (SELECT COUNT(item) AS total_bought FROM item_bought GROUP BY item) AS temp);

# Python 1 : Who is in the third place?

Task

Create a function whose name is third_place that does the following:

Given a list of test score and a list of participants name. The desired output would be the name of the participant who gets the 3rd best score. The rule of determining the order of the best score is as follows:

Higher score is better
In case of multiple participants having the same test score, they can occupy the same ranking value. For example, if 2 participants scored 100, then both of them occupy the first place.
The first input of the function is the name list, and the second input to the function is the score list.

    def third_place(names, scores):
    ### Your code starts here ###
    participants = list(zip(names, scores))
    participants.sort(key=lambda x: x[1], reverse=True)
    third_score = None
    for i in range(2, len(participants)):
        if participants[i][1] != participants[i-1][1]:
            third_score = participants[i][1]
            break
    third_place_participants = [participant[0] for participant in participants if participant[1] == third_score]
    if len(third_place_participants) == 1:
        output = f'The third winner: {third_place_participants[0]}.'
    else:
        output = f'The third winner: {", ".join(third_place_participants)}.'

    return output

*INPUT DATA*

EXAMPLE 1

      names = ['Andi', 'Budi', 'Charlie', 'Dilan', 'Echa']
      score = [80, 90, 95, 100, 85]
      print(third_place(names, score))

EXAMPLE 2

      names = ['Andi', 'Budi', 'Charlie', 'Dilan', 'Echa']
      score = [80, 80, 80, 100, 90]
      print(third_place(names, score))

EXAMPLE 3

      names = ['Andi', 'Budi', 'Charlie', 'Dilan', 'Echa', 'Fanya']
      score = [80, 90, 90, 100, 100, 80]
      print(third_place(names, score))

# Python 2 : Find Distance Between Two Coordinates

Task

Create a function called distance that does the following:

Given two coordinates in a list. Your task is to calculate the distance between these two coordinates. The input of your function will be two list. Each list contains 2 members, representing the x and y position.

      from math import sqrt
      def distance(point_1, point_2):
          ### Your code starts here ###
          x1, y1 = point_1
          x2, y2 = point_2
          distance = sqrt((x2 - x1)**2 + (y2 - y1)**2)
          return 'The distance is {:.9f}.'.format(distance)

*INPUT DATA*

EXAMPLE 1

      point_1 = [5, 5]
      point_2 = [1, 2]
      print(distance(point_1, point_2))

EXAMPLE 2

      point_1 = [0, -1]
      point_2 = [-3, 2]
      print(distance(point_1, point_2))
