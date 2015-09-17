--insert into ml_frozen_past (NumML) values (1000001)

--select * from ml_frozen_past where NumML = 1000001

--delete from ml_frozen_past where NumML = 1000001

create view [COMCOR\AYudin].ml_frozen_yesterday as
select * from ml_frozen_past
where snapshot_date = cast(round(cast(getdate() as float), 0, 1) - 1 as datetime)

--update ml_frozen_past set snapshot_date = cast(round(cast(getdate() as float), 0, 1) as datetime)

