#1
import pandas as pd
import numpy as np
# student = {'Name':{0:'A',1:'B',2:'C',3:'D'},"Height":{0:140,1:138,2:145,3:150},'Qualification':{0:'Pass',1:'Pass',2:'Pass',3:'Fail'}}
# df = pd.DataFrame(student)
# print(df)
# add = ['Abcd','efg','hijk','lmnop']
# df['Address'] = add
# print(df)

#2
# student = {'Name':{0:'A',1:'B',2:'C',3:'D'},"Height":{0:140,1:138,2:145,3:150},'Qualification':{0:'Pass',1:'Pass',2:'Pass',3:'Fail'}}
# df = pd.DataFrame(student)
# print(df)
# df.insert(3,'Age',[10,11,10,11])
# print(df)


#3
# df1 = pd.DataFrame({'Name':{1:'Ram',2:'Diya',3:'Chandan',4:'James',5:'Alice'}})
# df2 = pd.DataFrame({'Maths':{1:80,2:90,3:77,4:87,5:86},'Physics':{1:80,2:90,3:77,4:87,5:86},'Chemistry':{1:80,2:90,3:77,4:87,5:86},'Biology':{1:80,2:90,3:77,4:87,5:86}})
# df_new = pd.concat([df1,df2],axis=1)
# print(df_new)
# df_new['Total'] = df_new['Maths'] + df_new['Biology'] + df_new['Chemistry'] + df_new['Physics']
# print(df_new)

#4
df = pd.DataFrame({'Name':{1:'Ram',2:'Diya',3:'Chandan',4:'James',5:'Alice'},'Quiz_1/100':{1:80,2:90,3:77,4:87,5:86},'Insem/150':{1:80,2:90,3:77,4:87,5:86},'Quiz_2/100':{1:80,2:90,3:77,4:87,5:86},'Insem2/150':{1:80,2:90,3:77,4:87,5:86}})
df['Total'] = df.sum(axis=1, numeric_only=True)
mean = df.mean(axis=0,numeric_only=True)
print(mean)
df.loc['mean'] = mean	
print(df)