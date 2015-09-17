CREATE TABLE [dbo].[Wfl_Tasks] (
    [Id]                 INT             NOT NULL,
    [NumML]              INT             NOT NULL,
    [ParentId]           INT             NULL,
    [UserFrom]           NVARCHAR (50)   NOT NULL,
    [StartDate]          DATETIME        CONSTRAINT [DF__Wfl_Tasks__Start__04F074D4] DEFAULT (getdate()) NOT NULL,
    [TaskComment]        NVARCHAR (4000) NULL,
    [UserDo]             NVARCHAR (32)   NULL,
    [EndDate]            DATETIME        NULL,
    [Report]             NVARCHAR (4000) NULL,
    [TaskResult]         INT             NULL,
    [CancelDate]         DATETIME        NULL,
    [CancelUser]         NVARCHAR (32)   NULL,
    [CancelReason]       NVARCHAR (4000) NULL,
    [TaskType]           INT             NOT NULL,
    [ReturnReasonId]     INT             NULL,
    [ReturnUser]         NVARCHAR (32)   NULL,
    [ReturnDate]         DATETIME        NULL,
    [ReturnComment]      NVARCHAR (4000) NULL,
    [GetTaskUser]        NVARCHAR (32)   NULL,
    [GetTaskDate]        DATETIME        NULL,
    [MainTaskForStep]    INT             NULL,
    [DepartmentIdTo]     INT             NOT NULL,
    [DepartmentIdFrom]   INT             NOT NULL,
    [MainTaskUniqueness] AS              (isnull([MainTaskForStep],[Id])),
    CONSTRAINT [PK_Wfl_Tasks] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [chk_TaskResult] CHECK ([TaskResult] IS NULL OR ([TaskResult]=(0) OR [TaskResult]=(1))),
    CONSTRAINT [FK_Task_Department_From] FOREIGN KEY ([DepartmentIdFrom]) REFERENCES [dbo].[Wfl_Depts] ([Id]),
    CONSTRAINT [FK_Task_Department_To] FOREIGN KEY ([DepartmentIdTo]) REFERENCES [dbo].[Wfl_Depts] ([Id]),
    CONSTRAINT [FK_Wfl_Tasks_Wfl_Tasks] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[Wfl_Tasks] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_TASK_TO_DEPT]
    ON [dbo].[Wfl_Tasks]([NumML] ASC, [EndDate] ASC, [TaskType] ASC, [DepartmentIdTo] ASC);


GO


CREATE TRIGGER [dbo].[TRG_END_TASK] 
   ON  [dbo].[Wfl_Tasks]
   AFTER UPDATE
AS 
DECLARE @task_id int
DECLARE @end_date datetime
DECLARE @task_result  int
declare @cancel_date datetime
declare @numML int
DECLARE my_Cursor_new CURSOR FOR SELECT id, enddate, TaskResult FROM INSERTED 
OPEN my_Cursor_new
FETCH NEXT FROM my_Cursor_new into @task_id, @end_date, @task_result
WHILE @@FETCH_STATUS = 0 
BEGIN ;
if (update(enddate))
    begin
    -- обновить GetTaskUser если значение в поле не установлено
    update Wfl_Tasks set GetTaskUser=UserDo, GetTaskDate=EndDate where GetTaskDate is null and cancelDate is null and Id=@task_Id
    --if (@task_result=0)
    set @numML=(select NumML from Wfl_Tasks where Id=@task_Id)
    -- закрыть родительскую задачу на возврат, если закрыта последняя дочерняя подзадача
    if ((select count(*) from get_childTask((select ParentId from Wfl_Tasks where Id=@task_Id)) where id!=@task_Id)=0) 
    update Wfl_Tasks set EndDate=GetDate(), UserDo=ReturnUser, TaskResult=0 
                     where Id=(select ParentId from Wfl_Tasks where Id=@task_Id)
                     and NumMl=@numML and ReturnDate is not null                                                            
    end
  FETCH NEXT FROM my_Cursor_new into @task_id, @end_date, @task_result

END ;

CLOSE my_Cursor_new ;
DEALLOCATE my_Cursor_new;

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'является ли задание основным по МЛ для указанного шага. Null, если не является; либо номер шага.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Wfl_Tasks', @level2type = N'COLUMN', @level2name = N'MainTaskForStep';

