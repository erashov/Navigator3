Create  PROCEDURE [dbo].[JointInfo_Update] 
	@Numml int
AS
	declare @DocId int,
	@ins bit,
	@AddressA nvarchar(1158),
	@AddressB nvarchar(1158),
	@ChNumA nvarchar(10),
	@ChNumB nvarchar(10),
	@JointA nvarchar(50),
	@JointB nvarchar(50),
	@JointStatusA nvarchar(20),
	@JointStatusB nvarchar(20),
	@JointParamA nvarchar(20),
	@JointParamB nvarchar(20),
	@LineA nvarchar(10),
	@LineB nvarchar(10),
	@ChannelInfoA nvarchar(10),
	@ChannelInfoB nvarchar(10),
	@EquipmentA nvarchar(255),
	@EquipmentB nvarchar(255),
	@OperatorA nvarchar(128),
	@OperatorB nvarchar(128),
	@JointIdA int,
	@JointIdB int,
	@SOChSkorostA nvarchar(64),
	@SOChSkorostB nvarchar(64),
	@SOChInterfaceA nvarchar(50),
	@SOChInterfaceB nvarchar(50),
	@DMVManagerA nvarchar(70),
	@DMVManagerB nvarchar(70) 

	exec Comflow.dbo.Navigator_testGetJoint @DocId, @ins out, @AddressA out, @AddressB out, @ChNumA out, @ChNumB out, 
		@JointA out, @JointB out, @JointStatusA out, @JointStatusB out, @JointParamA out, @JointParamB out, 
		@LineA out, @LineB out, @ChannelInfoA out, @ChannelInfoB out, @EquipmentA out, @EquipmentB out, 
		@OperatorA out, @OperatorB out, @JointIdA out, @JointIdB out, @SOChSkorostA out, @SOChSkorostB out, 
		@SOChInterfaceA out, @SOChInterfaceB out, @DMVManagerA out, @DMVManagerB out, @numml

	declare @so bit
	if (exists(select * from JointInfo where numML = @numml)) set @so = 1 else set @so = 0

	if (@ins = 1)
	begin
		if (@so = 1)
			update JointInfo 
			set AdressA = @AddressA, AdressB = @AddressB, ChNumA = @ChNumA, ChNumB = @ChNumB, 
				JointA = @JointA, JointB = @JointB, JointStatusA = @JointStatusA, JointStatusB = @JointStatusB, 
				JointParamA = @JointParamA, JointParamB = @JointParamB, LineA = @LineA, LineB = @LineB, 
				ChannelInfoA = @ChannelInfoA, ChannelInfoB = @ChannelInfoB, 
				EqiupmentA = @EquipmentA, EqiupmentB = @EquipmentB, OperatorA = @OperatorA, OperatorB = @OperatorB, 
				JointIdA = @JointIdA, JointIdB = @JointIdB, SOChSkorostA = @SOChSkorostA, SOChSkorostB = @SOChSkorostB, 
				SOChInterfaceA = @SOChInterfaceA, SOChInterfaceB = @SOChInterfaceB, 
				DMVManagerA = @DMVManagerA, DMVManagerB = @DMVManagerB
			where numml = @NumML
		else
			insert into JointInfo(NumML, AdressA, AdressB, ChNumA, ChNumB, JointA, JointB, JointStatusA, JointStatusB, 
					JointParamA, JointParamB, LineA, LineB, ChannelInfoA, ChannelInfoB, EqiupmentA, EqiupmentB, 
					OperatorA, OperatorB, JointIdA, JointIdB, SOChSkorostA, SOChSkorostB, 
					SOChInterfaceA, SOChInterfaceB, DMVManagerA, DMVManagerB)
			select @NumML, @AddressA, @AddressB, @ChNumA, @ChNumB, @JointA, @JointB, @JointStatusA, @JointStatusB,
				@JointParamA, @JointParamB, @LineA, @LineB, @ChannelInfoA, @ChannelInfoB, @EquipmentA, @EquipmentB, 
				@OperatorA, @OperatorB, @JointIdA, @JointIdB, @SOChSkorostA, @SOChSkorostB, 
				@SOChInterfaceA, @SOChInterfaceB, @DMVManagerA, @DMVManagerB
	end
	else 
	begin
		delete from JointInfo where numml = @NumML
	end