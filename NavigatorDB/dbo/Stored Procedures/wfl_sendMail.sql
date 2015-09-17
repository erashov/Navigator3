
CREATE PROCEDURE [dbo].[wfl_sendMail] @Email varchar(256),@Subj varchar(256),@Msg varchar(2048)
AS

EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'ComFlow',
    --@profile_name = 'MailProfile1',
	--@profile_name = 'Default Mail Profile',
    @recipients = @EMail,
    @body = @Msg,
    @subject = @Subj,
	@body_format = N'HTML'
