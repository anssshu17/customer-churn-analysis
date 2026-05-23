import pandas as pd

df = pd.read_excel("D:\DATA ANALYST\Customer-Churn-Project\data\Telco_customer_churn.xlsx")

print(df.head())
print("Shape:", df.shape)
print("Columns:", df.columns)

#Data Cleaning

#Check info
print(df.info())

#Check missing values
print(df.isnull().sum())

#Clean column names
df.columns = df.columns.str.strip()

#Check duplicates
print("Duplicates:", df.duplicated().sum())

#Drop unnecessary column
df = df.drop(columns=["CustomerID"])

#Convert Churn to numeric
df["Churn"] = df["Churn Label"].map({"Yes": 1, "No": 0})

#finding insights
#Check churn distribution
print(df["Churn"].value_counts())

#Convert to percentage
print(df["Churn"].value_counts(normalize=True) * 100)

#Churn vs Contract
print(pd.crosstab(df["Contract"], df["Churn"]))

#Churn vs Gender
print(pd.crosstab(df["Gender"], df["Churn"]))

#Average Monthly Charges
print(df.groupby("Churn")["Monthly Charges"].mean())