
import pandas as pd
df = pd.read_csv('/home/Sw5414/Downloads/dataset.csv')
print(df.columns)
df_cut = df[['age','cp','chol','thalach']]
print(df_cut)
df_cut.to_csv('df_cut',index=False)
f = open('df_cut','r')
heart = f.read()
heart = heart.replace(",", "\t")
f = open('cutdata.txt','w+')
f.write(heart)

