import pandas as pd
import numpy as np


# s=pd.Series([3,9,-2,10,5])
# print(s.sum())
# print(s.min())
# print(s.max())


# data = [['Dinesh',10],['Nithya',12],['Raji',13]]
# df = pd.DataFrame(data,columns=['Name','Age'])
# print(df)

# data = {'Name':['Kavitha', 'Sudha', 'Raju','Vignesh'],'Age':[28,34,29,42]}
# df = pd.DataFrame(data, index=['rank1','rank2','rank3','rank4'])
# print(df)


# df1=pd.DataFrame({'A':pd.Timestamp('20130102'),'B':np.array([3]*4,dtype='int32'),
# 'C':pd.Categorical(['Male','Female','Male','Female'])})
# print(df1.shape)
# print(df1.dtypes)
# print(df1.head())
# print(df1.tail())
# print(df1.T)


# dates=pd.date_range('20130101', periods=10)
# df = pd.DataFrame(np.random.randn(10,4), index=dates, columns=list('ABCD'))
# #To view first 5 records
# print(df.head())
# #To view last 5 records
# print(df.tail())
# #To view the index
# print(df.index)
# #To view the column names
# print(df.columns)
# #To transpose the df
# print(df.T)
# #Sorting by Axis
# print(df.sort_index(axis=1, ascending=False))
# #Sorting by Values)
# print(df.sort_values(by='B'))
# #Slicing the rows
# print(df[0:3])
# #Slicing with index name
# print(df['20130105':'20130110'])
# #Slicing with row and column index (like 2D Matrix)
# print(df.iloc[0]) 
# print(df.iloc[0,:2])
# print(df.iloc[0,0])
# #Selecting a single column
# print(df['A'])
# #Selecting more than one columnprint(df[['A','B']], entire 2 columns
# #Selecting more than one column, with selected number of records
# print(df[['A','B']][:5])
# print(df.loc['20130101':'20130105',['A','B']][:5])

# dates=pd.date_range('20130101', periods=6)
# df = pd.DataFrame(np.random.randn(6,4), index=dates, columns=list('ABCD'))
# print(df)
# print(df[df.A>0]) #will fetch all positive values of A column
# #Include a 6th column (a categorical) character data
# df['F']=['Male','Female','Female','Male','Female','Female']
# print(df)
# #Setting by assigning with a numpy array
# df.loc[:,'D']=np.array([5]*len(df))
# print(df)
# #Which will replace the 'D', column with all 5
# #Deleting a row or column
# df.drop ('A', axis =1, inplace=True)
# print(df)
# #will drop the column name specified in col_name
# df.drop ('20130101', axis =0, inplace=True)
# print(df)
# #will drop the row specified in row_index


from matplotlib import pyplot as plt
df = pd.read_csv('diabetes.csv')
# print(df.head())
# plt.scatter(df['BMI'],df['Glucose'])
# plt.xlabel('BMI')
# plt.ylabel('Glucose')
# plt.show()
# df['Age'].hist()
# plt.show()

# df['Age'].plot(kind='bar')
# plt.show()
# df['Age'].plot(kind='pie')
# plt.show()
fa=pd.crosstab(df['Glucose'],df['BMI'])
fa.plot(kind='bar')
plt.show()