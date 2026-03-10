str1="abcbcadbb"
res=set()
j=0
ml=0
str2=""
for i in range(len(str1)):
    while str1[i] in res:
        res.remove(str1[i])
        j+=1
    res.add(str1[i])
    print(res)
    if i-j+1>ml:
        ml=i-j+1
        str2=str1[j:i+1]
print(str2)
    
        
