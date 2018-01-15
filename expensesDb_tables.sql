create table People (
	PersonId tinyint NOT NULL PRIMARY KEY IDENTITY(1,1),
	Person_Name varchar(10) NOT NULL,
)

create table AccountTypes (
	Account_TypeId tinyint NOT NULL PRIMARY KEY identity(1,1),
	Account_Type varchar(20) NOT NULL
)

create table Accounts (
	AccountId tinyint NOT NULL PRIMARY KEY,
	Account_Name varchar(20) NOT NULL,
	Account_TypeId tinyint NOT NULL FOREIGN KEY REFERENCES AccountTypes(Account_TypeId),
	Balance smallmoney
)

create table ExpenseTypes (
	Expense_TypeId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Expense_Type varchar(20) NOT NULL,
	CONSTRAINT CHK_Expense_Type CHECK (Expense_Type = 'Expense' or Expense_Type = 'Withdrawal' or Expense_Type = 'Transfer' or  Expense_Type = 'Deposit')
)

create table Expenses (
	ExpenseId bigint NOT NULL PRIMARY KEY IDENTITY(1,1),
	Expense_TypeId int NOT NULL FOREIGN KEY REFERENCES ExpenseTypes(Expense_TypeId),
	Expense_Amount smallmoney NOT NULL,
	Expense_Date smalldatetime DEFAULT GETDATE(),
	AccountId tinyint FOREIGN KEY REFERENCES Accounts(AccountId)
)

SELECT COUNT(PersonId) AS NumberOfPeople FROM People