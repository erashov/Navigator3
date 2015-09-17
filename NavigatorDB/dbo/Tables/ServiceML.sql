CREATE TABLE [dbo].[ServiceML] (
    [ID]           INT            NOT NULL,
    [TheServiceId] INT            NULL,
    [NavigatorId]  INT            NULL,
    [NumML]        INT            NOT NULL,
    [sCode]        VARCHAR (50)   NULL,
    [NumServ]      VARCHAR (50)   NULL,
    [SpecobA]      VARCHAR (100)  NULL,
    [SpecobB]      VARCHAR (100)  NULL,
    [NumChA]       VARCHAR (100)  NULL,
    [NumChB]       VARCHAR (100)  NULL,
    [TopML]        INT            CONSTRAINT [DF_ServiceML_Top] DEFAULT ((0)) NOT NULL,
    [sCode_aServ]  VARCHAR (10)   NULL,
    [AddressA]     VARCHAR (4000) NULL,
    [AddressB]     VARCHAR (4000) NULL,
    CONSTRAINT [CK_TopML_ServiceML] CHECK ([TopML]=(0) OR [TopML]=(1))
);


GO
CREATE NONCLUSTERED INDEX [idx_ServiceMLNavId]
    ON [dbo].[ServiceML]([NavigatorId] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_ServiceMLNumServ]
    ON [dbo].[ServiceML]([NumServ] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_ServiceMLsCode]
    ON [dbo].[ServiceML]([sCode] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_ServiseMLID]
    ON [dbo].[ServiceML]([ID] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_ServiseMLNumML]
    ON [dbo].[ServiceML]([NumML] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_ServiseMLTheServId]
    ON [dbo].[ServiceML]([TheServiceId] ASC);


GO
CREATE trigger [dbo].[TRG_ServiceML_Insert] on [dbo].[ServiceML] instead of insert
as
declare @id_group int
declare @id_inside int
declare @id_inside_max int
begin
set @id_inside=1
set @id_inside_max=(select max(ID) from INSERTED)
while (@id_inside<= @id_inside_max)
begin
   if (select NumServ from INSERTED where id=@id_inside) like '%o[0-9]%' or  (select NumServ from INSERTED where id=@id_inside) like '%reg%'
   begin
      set @id_group=(select min(id) from ServiceML where NumServ=(select NumServ from INSERTED where id=@id_inside))
   end
   else
   begin
      set @id_group=(select min(id) from ServiceML where NavigatorId =(select isnull(NavigatorId, -200) from INSERTED where id=@id_inside) and NumServ not like '%o[0-9]%' and NumServ not like '%reg%')

      if @id_group is null
      begin 
      set @id_group=(select min(id) from ServiceML where sCode =(select isnull(sCode, '$') from INSERTED where id=@id_inside and len(sCode)>3 and NumServ not like 'n[0-9]%' and NumServ not like '%o[0-9]%' and NumServ not like '%reg%' and isnull(sCode_aServ, '')!='H')
                                                       or sCode =(select case when isnull(NumServ, '$')='not' then '$' else isnull(NumServ, '$') end  from INSERTED where id=@id_inside and len(NumServ)>3 and NumServ not like 'n[0-9]%' and NumServ not like '%o[0-9]%' and NumServ not like '%reg%' and isnull(sCode_aServ, '')!='H')
                                                       or NumServ =(select isnull(sCode, '$') from INSERTED where id=@id_inside and len(sCode)>3 and NumServ not like 'n[0-9]%' and NumServ not like '%o[0-9]%' and NumServ not like '%reg%' and isnull(sCode_aServ, '')!='H') 
                                                       or NumServ =(select case when isnull(NumServ, '$')='not' then '$' else isnull(NumServ, '$') end from INSERTED where id=@id_inside  and len(NumServ)>3 and NumServ not like 'n[0-9]%' and isnull(sCode_aServ, '')!='H'))
      end
   end    
   if @id_group is null
         begin
         set @id_group=(select max(isnull(ID, 0))+1 from ServiceML)
             if @id_group is null
             begin
             set @id_group=1
             end
         end

    insert into ServiceML (ID, TheServiceId, NavigatorId, NumML, sCode, NumServ, SpecobA, SpecobB, NumChA, NumChB)
                select @id_group, TheServiceId, NavigatorId, NumML, sCode, NumServ, SpecobA, SpecobB, NumChA, NumChB 
                from INSERTED where id=@id_inside
    set @id_inside=@id_inside+1
end    
end








GO

CREATE trigger [dbo].[TRG_ServiceML_Update] on [dbo].[ServiceML] after update
as
DECLARE @numML_insert int
DECLARE @TheServiceId_insert int
Declare @sCode_inserted varchar(32)
Declare @NumServ_inserted varchar(32)
declare @id_group int
Declare @sCode_aServ_inserted varchar(32)
DECLARE my_Cursor_par12 CURSOR FOR SELECT distinct NumML, TheServiceId, sCode, NumServ, sCode_aServ FROM INSERTED 
OPEN my_Cursor_par12
FETCH NEXT FROM my_Cursor_par12 into @numML_insert, @TheServiceId_insert, @sCode_inserted, @NumServ_inserted, @sCode_aServ_inserted
WHILE @@FETCH_STATUS = 0 
BEGIN ;
if (update(sCode)  or update(NumServ) or update(NavigatorId))
begin
  PRINT 'Updating ServiceML '+ cast(@numML_insert as varchar(32))+'--'+isnull(@sCode_inserted,'')+'--'+isnull(@NumServ_inserted,'');
  if @NumServ_inserted like '%o[0-9]%' or @NumServ_inserted like '%reg%'
  begin
     set @id_group=(select min(id) from ServiceML where NumServ=@NumServ_inserted  and NumML!=@NumML_insert)
  end
  else
  begin
  set @id_group=(select min(id) from ServiceML where NavigatorId =(select isnull(NavigatorId, -200) from ServiceML where 
                                           isnull(TheServiceId, '')=isnull(@TheServiceId_insert, '') 
                                           and  isnull(NumML, '')=isnull(@NumML_insert, ''))
                                           and NumServ not like '%o[0-9]%' and NumServ not like '%reg%' and NumML!=@NumML_insert)
       PRINT '1 ServiceML id_group='+cast(@id_group as varchar(32));
       if @id_group is null
       begin
          if (@NumServ_inserted not like 'n[0-9]%' and @sCode_aServ_inserted!='H')
          begin
          set @id_group=(select min(id) from ServiceML where NumML!=@NumML_insert
                       and ((sCode =isnull(@sCode_inserted, '$') and len(@sCode_inserted)>3 and NumServ not like '%o[0-9]%' and NumServ not like '%reg%')
                       or (sCode =isnull(@NumServ_inserted, '$') and len(@NumServ_inserted)>3 and NumServ not like '%o[0-9]%' and NumServ not like '%reg%')
                       or (NumServ =isnull(@sCode_inserted, '$')  and len(@sCode_inserted)>3 and NumServ not like '%o[0-9]%' and NumServ not like '%reg%') 
                       or (NumServ =isnull(@NumServ_inserted, '$') and len(@NumServ_inserted)>3)));
         end
         PRINT '2 ServiceML id_group='+cast(@id_group as varchar(32));
      end 
  end                    
  if @id_group is null
     begin
     set @id_group=(select id  from ServiceML s where NumML=@numML_insert and not exists (select 'x' from ServiceML where id=s.id and NumML!=@numML_insert))
     PRINT '3 ServiceML id_group='+cast(@id_group as varchar(32));
         if  @id_group is null 
         begin
             set @id_group=(select max(isnull(ID, 0))+1 from ServiceML)
             PRINT '4 ServiceML id_group='+cast(@id_group as varchar(32));
         end
     end  
              
  PRINT 'ServiceML - id_group='+cast(@id_group as varchar(32));

  if @id_group is not null and  @id_group!=(select ID from ServiceML where isnull(TheServiceId, '')=isnull(@TheServiceId_insert, '')
                                           and  isnull(NumML, '')=isnull(@NumML_insert, '')) 
    begin
    PRINT 'Updating ServiceML id_group='+cast(@id_group as varchar(32));
    update   ServiceML set Id=@id_group where isnull(TheServiceId, '')=isnull(@TheServiceId_insert, '') and  isnull(NumML, '')=isnull(@NumML_insert, '');
    ---------------- update AddressB in TL--------------------------
    if @NumML_insert<0 or @NumML_insert>=1000000
       begin
       update ServiceML  set AddressA=l.AdresA, AddressB=l.AdresB
       from (select top 1 l2n.AdresA, l2n.AdresB, l2n.NumML 
             from ServiceML sml join List2Nav l2n on sml.NumML=l2n.NumML 
             join Comflow.dbo.TheService ts on sml.TheServiceId=ts.Id where sml.id = @id_group
             and (l2n.NumML>=0 and l2n.NumML<1000000) 
             order by  TopML desc, isnull(sdan_ts,sdan) desc,  case when EnhTo is null then 1 else 0 end desc, EnhTo desc, l2n.numML desc)l
       where l.AdresB is not null and ServiceMl.NumML=@NumML_insert
    end
    -----------------------------------------------------------------
    end
  end  
  FETCH NEXT FROM my_Cursor_par12 into @numML_insert, @TheServiceId_insert, @sCode_inserted, @NumServ_inserted, @sCode_aServ_inserted;

END ;

CLOSE my_Cursor_par12 ;
DEALLOCATE my_Cursor_par12;









GO
CREATE trigger [dbo].[TRG_ServiceML_OnIdUpdate] on [dbo].[ServiceML] after update
as
DECLARE @old_id int
DECLARE @new_id int
DECLARE @NumML  int
DECLARE my_Cursor_new CURSOR FOR SELECT distinct id, NumML FROM INSERTED 
OPEN my_Cursor_new
FETCH NEXT FROM my_Cursor_new into @new_id, @NumML
WHILE @@FETCH_STATUS = 0 
BEGIN ;
if (update(id))
    begin
    set @old_id=(select distinct id from DELETED where NumML=@NumML)
    update ServiceMLComment set IDgroup=@new_id  where   IDgroup=@old_id
    end
  FETCH NEXT FROM my_Cursor_new into @new_id, @NumML;

END ;

CLOSE my_Cursor_new ;
DEALLOCATE my_Cursor_new;



GO
CREATE trigger [dbo].[TRG_ServiceML_OnTopMLUpdate] on [dbo].[ServiceML] after update
as
DECLARE @topML int
DECLARE @id_group int
DECLARE @NumML  int
DECLARE my_Cursor_newTop CURSOR FOR SELECT distinct id, NumML, TopML FROM INSERTED 
OPEN my_Cursor_newTop
FETCH NEXT FROM my_Cursor_newTop into @id_group, @NumML, @topML
WHILE @@FETCH_STATUS = 0 
BEGIN ;
if (update(TopML))
    begin
    if @topML=1
       begin
       update ServiceML set TopML=0  where ID=@id_group and TopML=1 and NumML!=@NumML
       end
    end
  FETCH NEXT FROM my_Cursor_newTop into @id_group, @NumML, @topML;

END ;

CLOSE my_Cursor_newTop ;
DEALLOCATE my_Cursor_newTop;


GO
DISABLE TRIGGER [dbo].[TRG_ServiceML_OnTopMLUpdate]
    ON [dbo].[ServiceML];

