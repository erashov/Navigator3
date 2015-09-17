CREATE procedure [dbo].[IsBlocked] @cntBlocked int = 0 out
AS


select @cntBlocked=count(*) from master.sys.sysprocesses
where Blocked!=0
--select * from master.dbo.sysProcesses 



