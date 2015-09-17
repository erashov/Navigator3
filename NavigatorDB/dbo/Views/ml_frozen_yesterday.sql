create view dbo.ml_frozen_yesterday as
select * from ml_frozen_past
where snapshot_date = cast(round(cast(getdate() as float), 0, 1) - 1 as datetime)