/* only works with SQL Server 2012 and later */

declare @DatabaseName varchar(128) = 'Trading'
declare @SqlCommand varchar(max) = ''
declare @PrintOnly bit = 1


select	@SqlCommand += 'kill ' + 
			cast([sessions].[session_id] as varchar(6)) + ';' + char(13)
from	sys.dm_exec_sessions	[sessions]
where
	[sessions].[database_id] = db_id(@DatabaseName)


if @PrintOnly = 1
begin
	print @SqlCommand
end
else
	exec(@SqlCommand);