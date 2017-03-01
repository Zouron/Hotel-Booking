CREATE TABLE [dbo].[customers]
(
	[username] VARCHAR(30) NOT NULL PRIMARY KEY, 
    [gname] VARCHAR(20) NOT NULL, 
    [sname] VARCHAR(20) NOT NULL, 
    [address] VARCHAR(40) NOT NULL, 
    [state] VARCHAR(20) NOT NULL, 
    [postcode] CHAR(4) NOT NULL, 
    [mobile] CHAR(10) NOT NULL
)
