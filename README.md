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
| Email             | Tahira        | Biswas    |Biswas    |
| Random             | Shohag        | Mia       |Biswas    |
| Custom String             | Saiful        | Islam     |Biswas    |
