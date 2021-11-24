# Dynamic Data Masking

[Dynamic data masking](https://docs.microsoft.com/en-us/sql/relational-databases/security/dynamic-data-masking?view=sql-server-ver15) (DDM) enables you to control which users view masked data and which roles can view sensitive data. You can use DDM to prevent unauthorized access to certain pieces of data by limiting the amount of sensitive data revealed.

The main goal of DDM is to limit the amount of exposure to sensitive data. Use it as an additional tool to support your overall security efforts. DDM is available in Azure SQL Database and SQL Server 2016 (13.x) and later.

With DDM the data in the database is not changed. DDM is easy to use with existing applications, since masking rules are applied in the query results. Many applications can mask sensitive data without modifying existing queries.

1. A central data masking policy acts directly on sensitive fields in the database.
2. Designate privileged users or roles that do have access to the sensitive data.
3. DDM features full masking and partial masking functions, and a random mask for numeric data.
4. Simple Transact-SQL commands define and manage masks.
---
# SQL Server Dynamic Data Masking Types
A masking rule may be defined on a column in a table, in order to obfuscate the data in that column. Four types of masks are available.

| Function           | Description     | Create Syntax  | Alter Syntax  |
| ------------- |:-------------------- |:----------|:----------|
| Default             | this function lets you create a rule that masks the entire value when users with read-only privileges query the data. To do this, you need to specify a function name, as well as an empty set of parentheses. The function does not take arguments, and columns are masked according to the data type of the specified column          |  `Phone# varchar(12) MASKED WITH (FUNCTION = 'default()') NULL  `   | `ALTER COLUMN Gender ADD MASKED WITH (FUNCTION = 'default()')   `  |
| Email             | this masking method that exposes the first letter of an email address and the constant suffix ".com", in the form of an email address.        | `Email varchar(100) MASKED WITH (FUNCTION = 'email()') NULL  `  |`ALTER COLUMN Email ADD MASKED WITH (FUNCTION = 'email()')`    |
| Random             | A random masking function for use on any numeric type to mask the original value with a random value within a specified range.        | `Account_Number bigint MASKED WITH (FUNCTION = 'random([start range], [end range])'`       |`ALTER COLUMN [Month] ADD MASKED WITH (FUNCTION = 'random(1, 12)')`    |
| Custom String             | Masking method that exposes the first and last letters and adds a custom padding string in the middle. prefix,[padding],suffix Note: If the original value is too short to complete the entire mask, part of the prefix or suffix will not be exposed.        | `FirstName varchar(100) MASKED WITH (FUNCTION = 'partial(prefix,[padding],suffix)') NULL`     |`ALTER COLUMN [Phone Number] ADD MASKED WITH (FUNCTION = 'partial(1,"XXXXXXX",0)')`    |


## Advantages of Dynamic Data Masking:
*Prevents unauthorized access*—makes it easy to prevent unauthorized disclosure of sensitive data. Administrators can allow privileged users or roles to access real data, and restrict access to other users, ensuring they only see masked data.

1. *Easy to configure*—can be set up easily, and used with Transact-SQL commands, with no changes to application code.

2. *Full and partial masking*—enables additional masking features, including full masking, partial masking, and randomized masking for numerical data.

3. *Central policy*—makes it possible to set a central policy for data masking and apply it to all database users.

## Disadvantages of Dynamic Data Masking:

1. *Not a complete solution*—to achieve database security, you must use additional measures. There is no guarantee that all sensitive data will be correctly masked, and unauthorized users may eventually gain access to sensitive data.

2. *Does not encrypt the data*—does not protect the underlying data, only masks it when responding to a query. To protect the underlying data, combine DDM with other SQL Server security features such as encryption, auditing, and row-level security.

3. *Limitations*—you cannot define masking for the COLUMN_SET, FILESTREAM, or the Always Encrypted column. Masked columns cannot be used as keys for full-text indexes.
