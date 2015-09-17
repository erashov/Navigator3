﻿
Create procedure dbo.[sp_sel_D6FF84008D334A390F45F94EA21B43EC_pal] (@type int output, @rowguid uniqueidentifier=NULL) AS
    declare @retcode    int
        
    set nocount on
        
	-- role based security check
	if ({ fn ISPALUSER('0F45F94E-A21B-43EC-AA81-8A8712B9BCE4') } <> 1)
	begin
		RAISERROR (14126, 11, -1)
		return (1)
	end 
    if @type = 1
    begin
        select  t.*               from [dbo].[Sp_gotov] t where rowguidcol = @rowguid
        if @@ERROR<>0 return(1)
    end
            
    else if @type < 4
    begin 
        select c.tablenick, c.rowguid, c.generation, c.lineage, c.colv1
               , t.*           from [dbo].[Sp_gotov] t,  #cont c where
               t.rowguidcol = c.rowguid
            order by t.rowguidcol
            if @@ERROR<>0 
                return(1)
     end 
    else if @type = 4
    begin
        set @type = 0
        if exists (select * from [dbo].[Sp_gotov] where rowguidcol = @rowguid)
            set @type = 3
        if @@ERROR<>0 return(1)
    end

    else if @type = 5
    begin
        delete [dbo].[Sp_gotov] where rowguidcol = @rowguid
        if @@ERROR<>0 return(1)
    end

    else if @type = 6 -- sp_MSenumcolumns
    begin
        select  t.*               from [dbo].[Sp_gotov] t where 1=2
        if @@ERROR<>0 return(1)
    end

    else if @type = 7 -- sp_MSlocktable
    begin
        select 1 from [dbo].[Sp_gotov](tablock holdlock) where 1 = 2
        if @@ERROR<>0 return(1)
    end

    else if @type = 8 -- put update lock
    begin
        if not exists (select * from [dbo].[Sp_gotov](UPDLOCK HOLDLOCK) where rowguidcol = @rowguid)
        begin
            RAISERROR(20031 , 16, -1)
            return(1)
        end
    end
        
    return(0) 
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[sp_sel_D6FF84008D334A390F45F94EA21B43EC_pal] TO PUBLIC
    AS [dbo];

