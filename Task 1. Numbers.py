#The program counts backwards from 100 to 1 and prints:
#"Agile" if the number is divisible by 5,
#"Software" if the number is divisible by 3,
#"Testing" if the number is divisible by both,
#or prints just the number if none of those cases are true. 

for i in range(100, 0, -1):
    Is_divisible_by_3 = True if i % 3 == 0 else False
    Is_divisible_by_5 = True if i % 5 == 0 else False
    if Is_divisible_by_5 and not Is_divisible_by_3:
        print(i, 'Agile')
    if not Is_divisible_by_5 and Is_divisible_by_3:
        print(i, 'Software')
    if Is_divisible_by_3 and Is_divisible_by_5:
	    print(i, 'Testing')
    if not Is_divisible_by_3 and not Is_divisible_by_5:
	    print(i)
