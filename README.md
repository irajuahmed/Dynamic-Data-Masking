# Dynamic-Data-Masking
Dynamic data masking (DDM) enables you to control which users view masked data and which roles can view sensitive data. You can use DDM to prevent unauthorized access to certain pieces of data by limiting the amount of sensitive data revealed.

The main goal of DDM is to limit the amount of exposure to sensitive data. Use it as an additional tool to support your overall security efforts. DDM is available in Azure SQL Database and SQL Server 2016 (13.x) and later.

With DDM the data in the database is not changed. DDM is easy to use with existing applications, since masking rules are applied in the query results. Many applications can mask sensitive data without modifying existing queries.

1. A central data masking policy acts directly on sensitive fields in the database.
2. Designate privileged users or roles that do have access to the sensitive data.
3. DDM features full masking and partial masking functions, and a random mask for numeric data.
4. Simple Transact-SQL commands define and manage masks.

# SQL Server Dynamic Data Masking Types

| Function           | FirstName     | LastName  |
| ------------- |:------------- |:----------|
| 1             | Raju          | Ahmed     |
| 2             | Tahira        | Biswas    |
| 3             | Shohag        | Mia       |
| 4             | Saiful        | Islam     |
