<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="10008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Timer_Main.vi" Type="VI" URL="../Timer_Main.vi"/>
		<Item Name="Tomato-icon.ico" Type="Document" URL="../Tomato-icon.ico"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="user32.dll" Type="Document" URL="user32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Window Refnum" Type="VI" URL="../labview_win_util32_86/WINUTIL.LLB/Window Refnum"/>
			<Item Name="Not a Window Refnum" Type="VI" URL="../labview_win_util32_86/WINUTIL.LLB/Not a Window Refnum"/>
			<Item Name="Set Window Z-Position.vi" Type="VI" URL="../labview_win_util32_86/WINUTIL.LLB/Set Window Z-Position.vi"/>
			<Item Name="Get Window RefNum.vi" Type="VI" URL="../labview_win_util32_86/WINUTIL.LLB/Get Window RefNum.vi"/>
			<Item Name="Make Window Always on Top.vi" Type="VI" URL="../labview_win_util32_86/WINUTIL.LLB/Make Window Always on Top.vi"/>
			<Item Name="Message_VI.vi" Type="VI" URL="../Message_VI.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="Pomodoro" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{F897B466-A836-4069-8616-1E4A2D97E37E}</Property>
				<Property Name="App_INI_GUID" Type="Str">{69192A66-C3CC-4BC7-B6E6-467BB38B7E88}</Property>
				<Property Name="Bld_buildSpecDescription" Type="Str">Pomodoro Timer</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Pomodoro</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../Timer/exe</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Destination[0].destName" Type="Str">Pomodoro.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../Timer/exe/NI_AB_PROJECTNAME.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../Timer/exe/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Exe_iconItemID" Type="Ref">/My Computer/Tomato-icon.ico</Property>
				<Property Name="Source[0].itemID" Type="Str">{E33224DE-58F3-44CA-B510-3ADC94B85626}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/Timer_Main.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
				<Property Name="TgtF_companyName" Type="Str">Polytechnique</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Pomodoro</Property>
				<Property Name="TgtF_fileVersion.major" Type="Int">1</Property>
				<Property Name="TgtF_internalName" Type="Str">Pomodoro</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2012 Edgar Guevara</Property>
				<Property Name="TgtF_productName" Type="Str">Pomodoro</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{7315F88D-B001-48CC-83C3-636BFF27E52E}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">Pomodoro.exe</Property>
			</Item>
		</Item>
	</Item>
</Project>
