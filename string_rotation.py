n=int(input())
for i in range(0,n):
    res=input().split(" ")
    a=res[0]
    b=res[1]
    if b in (a+a):
        print("true")
    else:
        print("false")