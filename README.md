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


## Advantages of Static Data Masking:

* *Permanent deletion* — sensitive data is permanently deleted when the data transformation is applied to the database. If a statically protected database is compromised, there is no sensitive data for the attacker to steal.
* *No effect on performance* —all data transformations are applied in advance, so there is no performance impact per transaction.
* *Protects production copies*—provides the best protection for copies of production databases, enabling access via other applications and native queries.
* *Simplifies security of data copies*—there is no need to define granular object-level security policies, because all the sensitive data in the database has been masked.
