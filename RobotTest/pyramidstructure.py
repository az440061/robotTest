num = int(input('enter the number :'))
maxnum = num * 2
count = 1
while count <= maxnum:
    if count <= num:
        print('*'*count)
    else:
        # print(count)
        # print(maxnum - count)

        print('*'*(maxnum - count))
    count = count + 1

