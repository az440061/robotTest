num = 50

for i in range(2,(num+1)):
    # print("i",i)
    for j in range(2,i):
        # print("j",j)
        if (i % j) == 0:
            # print(i,"not a prime number")
            break
    else:
        print(i,"is prime number")
'2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97.'




