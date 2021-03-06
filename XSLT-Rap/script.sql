/****** Object:  StoredProcedure [dbo].[gb_Popup_SelectOneActive]    Script Date: 04/19/2016 09:39:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_SelectOneActive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[gb_Popup_SelectOneActive]
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_SelectPage]    Script Date: 04/19/2016 09:39:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_SelectPage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[gb_Popup_SelectPage]
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_SelectPageByZone]    Script Date: 04/19/2016 09:39:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_SelectPageByZone]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[gb_Popup_SelectPageByZone]
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_Update]    Script Date: 04/19/2016 09:39:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[gb_Popup_Update]
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_Delete]    Script Date: 04/19/2016 09:39:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[gb_Popup_Delete]
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_DeleteBySite]    Script Date: 04/19/2016 09:39:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_DeleteBySite]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[gb_Popup_DeleteBySite]
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_GetCount]    Script Date: 04/19/2016 09:39:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_GetCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[gb_Popup_GetCount]
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_GetCountByZone]    Script Date: 04/19/2016 09:39:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_GetCountByZone]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[gb_Popup_GetCountByZone]
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_Insert]    Script Date: 04/19/2016 09:39:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[gb_Popup_Insert]
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_SelectOne]    Script Date: 04/19/2016 09:39:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_SelectOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[gb_Popup_SelectOne]
GO
/****** Object:  Table [dbo].[gb_Popup]    Script Date: 04/19/2016 09:38:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup]') AND type in (N'U'))
DROP TABLE [dbo].[gb_Popup]
GO
/****** Object:  Table [dbo].[gb_Popup]    Script Date: 04/19/2016 09:38:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[gb_Popup](
	[PopupID] [int] IDENTITY(1,1) NOT NULL,
	[SiteID] [int] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[PopupContent] [nvarchar](max) NOT NULL,
	[Active] [bit] NOT NULL,
	[ActiveFrom] [datetime] NULL,
	[ActiveTo] [datetime] NULL,
	[DisplayOrder] [int] NOT NULL,
	[Position] [int] NULL,
	[BoxWidth] [nvarchar](20) NULL,
	[BoxHeight] [nvarchar](20) NULL,
	[CookieExpiryTime] [int] NULL,
	[Guid] [uniqueidentifier] NULL,
	[UserGuid] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_gb_Popup] PRIMARY KEY CLUSTERED 
(
	[PopupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_SelectOne]    Script Date: 04/19/2016 09:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_SelectOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[gb_Popup_SelectOne]

/*
Author:   			Tran Quoc Vuong - itqvuong@gmail.com - tqvuong263@yahoo.com
Created: 			2015-06-09
Last Modified: 		2015-06-09
*/

@SiteID		int,
@PopupID	int

AS


SELECT
		*
		
FROM
		[dbo].[gb_Popup]
		
WHERE
		[SiteID] = @SiteID AND [PopupID] = @PopupID

' 
END
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_Insert]    Script Date: 04/19/2016 09:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[gb_Popup_Insert]

/*
Author:   			Tran Quoc Vuong - itqvuong@gmail.com - tqvuong263@yahoo.com
Created: 			2015-6-9
Last Modified: 		2015-6-9
*/

@SiteID int,
@Title nvarchar(255),
@PopupContent nvarchar(max),
@Active bit,
@ActiveFrom datetime,
@ActiveTo datetime,
@DisplayOrder int,
@Position int,
@BoxWidth nvarchar(20),
@BoxHeight nvarchar(20),
@CookieExpiryTime int,
@Guid uniqueidentifier,
@UserGuid uniqueidentifier,
@CreatedDate datetime,
@IsDeleted bit

	
AS

INSERT INTO 	[dbo].[gb_Popup] 
(
				[SiteID],
				[Title],
				[PopupContent],
				[Active],
				[ActiveFrom],
				[ActiveTo],
				[DisplayOrder],
				[Position],
				[BoxWidth],
				[BoxHeight],
				[CookieExpiryTime],
				[Guid],
				[UserGuid],
				[CreatedDate],
				[IsDeleted]
) 

VALUES 
(
				@SiteID,
				@Title,
				@PopupContent,
				@Active,
				@ActiveFrom,
				@ActiveTo,
				@DisplayOrder,
				@Position,
				@BoxWidth,
				@BoxHeight,
				@CookieExpiryTime,
				@Guid,
				@UserGuid,
				@CreatedDate,
				@IsDeleted
				
)
SELECT @@IDENTITY 


' 
END
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_GetCountByZone]    Script Date: 04/19/2016 09:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_GetCountByZone]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[gb_Popup_GetCountByZone]

/*
Author:   			Tran Quoc Vuong - tqvuong263@yahoo.com - itqvuong@gmail.com
Created: 			2015-06-09
Last Modified: 		2015-06-09
*/

@SiteID			int,
@ZoneGuid		uniqueidentifier

AS

SELECT COUNT(*) 

FROM [dbo].[gb_Popup] p
INNER JOIN gb_ZoneItems z ON z.ItemGuid=p.[Guid] AND z.ZoneGuid=@ZoneGuid

WHERE SiteID=@SiteID AND IsDeleted=0' 
END
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_GetCount]    Script Date: 04/19/2016 09:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_GetCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[gb_Popup_GetCount]

/*
Author:   			Tran Quoc Vuong - tqvuong263@yahoo.com - itqvuong@gmail.com
Created: 			2015-06-09
Last Modified: 		2015-06-09
*/

@SiteID			int

AS

SELECT COUNT(*) FROM [dbo].[gb_Popup] WHERE SiteID=@SiteID AND IsDeleted=0' 
END
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_DeleteBySite]    Script Date: 04/19/2016 09:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_DeleteBySite]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[gb_Popup_DeleteBySite]

/*
Author:   			Tran Quoc Vuong - tqvuong263@yahoo.com - itqvuong@gmail.com
Created: 			2015-06-09
Last Modified: 		2015-06-09
*/

@SiteID int

AS

DELETE FROM [dbo].[gb_Popup]
WHERE SiteID = @SiteID

' 
END
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_Delete]    Script Date: 04/19/2016 09:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[gb_Popup_Delete]

/*
Author:   			Tran Quoc Vuong - itqvuong@gmail.com - tqvuong263@yahoo.com
Created: 			2015-6-9
Last Modified: 		2015-6-9
*/

@PopupID int

AS

DELETE FROM [dbo].[gb_Popup]
WHERE
	[PopupID] = @PopupID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_Update]    Script Date: 04/19/2016 09:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[gb_Popup_Update]

/*
Author:   			Tran Quoc Vuong - itqvuong@gmail.com - tqvuong263@yahoo.com
Created: 			2015-6-9
Last Modified: 		2015-6-9
*/
	
@PopupID int, 
@SiteID int, 
@Title nvarchar(255), 
@PopupContent nvarchar(max), 
@Active bit, 
@ActiveFrom datetime, 
@ActiveTo datetime, 
@DisplayOrder int, 
@Position int, 
@BoxWidth nvarchar(20), 
@BoxHeight nvarchar(20), 
@CookieExpiryTime int, 
@Guid uniqueidentifier, 
@UserGuid uniqueidentifier, 
@CreatedDate datetime, 
@IsDeleted bit 


AS

UPDATE 		[dbo].[gb_Popup] 

SET
			[SiteID] = @SiteID,
			[Title] = @Title,
			[PopupContent] = @PopupContent,
			[Active] = @Active,
			[ActiveFrom] = @ActiveFrom,
			[ActiveTo] = @ActiveTo,
			[DisplayOrder] = @DisplayOrder,
			[Position] = @Position,
			[BoxWidth] = @BoxWidth,
			[BoxHeight] = @BoxHeight,
			[CookieExpiryTime] = @CookieExpiryTime,
			[Guid] = @Guid,
			[UserGuid] = @UserGuid,
			[CreatedDate] = @CreatedDate,
			[IsDeleted] = @IsDeleted
			
WHERE
			[PopupID] = @PopupID

' 
END
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_SelectPageByZone]    Script Date: 04/19/2016 09:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_SelectPageByZone]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[gb_Popup_SelectPageByZone]

/*
Author:   			Tran Quoc Vuong - tqvuong263@yahoo.com - itqvuong@gmail.com
Created: 			2015-06-09
Last Modified: 		2015-06-09
*/

@SiteID			int,
@ZoneGuid		uniqueidentifier,
@PageNumber 	int,
@PageSize 		int

AS

DECLARE @PageLowerBound int
DECLARE @PageUpperBound int

SET @PageLowerBound = (@PageSize * @PageNumber) - @PageSize
SET @PageUpperBound = @PageLowerBound + @PageSize + 1

CREATE TABLE #PageIndex 
(
	IndexID int IDENTITY (1, 1) NOT NULL,
	PopupID Int
)

BEGIN

	INSERT INTO #PageIndex (PopupID)

	SELECT
			p.[PopupID]
			
	FROM
			[dbo].[gb_Popup] p
	INNER JOIN gb_ZoneItems z ON z.ItemGuid=p.[Guid] AND z.ZoneGuid=@ZoneGuid

	WHERE p.SiteID=@SiteID AND p.IsDeleted=0

	ORDER BY p.[DisplayOrder] DESC, p.[ActiveFrom] DESC

END

SELECT
		t1.*
		
FROM
		[dbo].[gb_Popup] t1

JOIN			#PageIndex t2
ON			
		t1.[PopupID] = t2.[PopupID]
		
WHERE
		t2.IndexID > @PageLowerBound 
		AND t2.IndexID < @PageUpperBound
		
ORDER BY t2.IndexID

DROP TABLE #PageIndex' 
END
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_SelectPage]    Script Date: 04/19/2016 09:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_SelectPage]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[gb_Popup_SelectPage]

/*
Author:   			Tran Quoc Vuong - tqvuong263@yahoo.com - itqvuong@gmail.com
Created: 			2015-06-09
Last Modified: 		2015-06-09
*/

@SiteID			int,
@PageNumber 	int,
@PageSize 		int

AS

DECLARE @PageLowerBound int
DECLARE @PageUpperBound int

SET @PageLowerBound = (@PageSize * @PageNumber) - @PageSize
SET @PageUpperBound = @PageLowerBound + @PageSize + 1

CREATE TABLE #PageIndex 
(
	IndexID int IDENTITY (1, 1) NOT NULL,
	PopupID Int
)

BEGIN

	INSERT INTO #PageIndex (PopupID)

	SELECT
			[PopupID]
			
	FROM
			[dbo].[gb_Popup]
			
	WHERE SiteID=@SiteID AND IsDeleted=0

	ORDER BY [DisplayOrder] DESC, [ActiveFrom] DESC

END

SELECT
		t1.*
		
FROM
		[dbo].[gb_Popup] t1

JOIN			#PageIndex t2
ON			
		t1.[PopupID] = t2.[PopupID]
		
WHERE
		t2.IndexID > @PageLowerBound 
		AND t2.IndexID < @PageUpperBound
		
ORDER BY t2.IndexID

DROP TABLE #PageIndex' 
END
GO
/****** Object:  StoredProcedure [dbo].[gb_Popup_SelectOneActive]    Script Date: 04/19/2016 09:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gb_Popup_SelectOneActive]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[gb_Popup_SelectOneActive]

/*
Author:   			Tran Quoc Vuong - itqvuong@gmail.com - tqvuong263@yahoo.com
Created: 			2015-06-09
Last Modified: 		2015-06-09
*/

@SiteID		int,
@ZoneGuid	uniqueidentifier,
@LanguageID	int

AS


SELECT
		TOP 1 		
		t1.[PopupID],
		t1.[SiteID],
		ISNULL(c.[Title],t1.[Title]) AS [Title],
		ISNULL(c.[FullContent],t1.[PopupContent]) AS [PopupContent],
		t1.[Active],
		t1.[ActiveFrom],
		t1.[ActiveTo],
		t1.[DisplayOrder],
		t1.[Position],
		t1.[BoxWidth],
		t1.[BoxHeight],
		t1.[CookieExpiryTime],
		t1.[Guid],
		t1.[UserGuid],
		t1.[CreatedDate],
		t1.[IsDeleted]
		
FROM
		[dbo].[gb_Popup] t1

INNER JOIN gb_ZoneItems z ON z.ItemGuid=t1.[Guid] AND z.ZoneGuid=@ZoneGuid

LEFT OUTER JOIN		gb_ContentLanguage c
ON	(t1.[Guid] = c.ContentGuid AND c.LanguageID = @LanguageID)

WHERE
		t1.[SiteID] = @SiteID 
		AND t1.IsDeleted=0
		AND t1.[Active] = 1
		AND t1.[ActiveFrom] <= getutcdate()
		AND (t1.[ActiveTo] IS NULL OR getutcdate() <= t1.[ActiveTo])

' 
END
GO
IF NOT EXISTS (SELECT * FROM [dbo].[gb_AdminMenu] WHERE [Url] LIKE '~/Popup/List.aspx')
INSERT INTO [dbo].[gb_AdminMenu]
           ([ParentID]
           ,[KeyName]
           ,[ResourceFile]
           ,[Url]
           ,[CssClass]
           ,[PermissionNames]
           ,[VisibleToRoles]
           ,[VisibleToSites]
           ,[IsVisible]
           ,[Icon]
           ,[ImageUrl]
           ,[Position]
           ,[OpenInNewWindow]
           ,[DisplayOrder])
     VALUES
           (64
           ,'PopupManageMenuLink'
           ,'PopupResources'
           ,'~/Popup/List.aspx'
           ,''
           ,''
           ,''
           ,''
           ,1
           ,'blank.gif'
           ,''
           ,0
           ,0
           ,0)
GO
IF NOT EXISTS (SELECT * FROM [dbo].[gb_ModuleDefinitions] WHERE [Guid] = 'ccb9cba3-c677-44bb-b63f-15426b2854a0')
INSERT INTO [dbo].[gb_ModuleDefinitions]
           ([FeatureName]
           ,[ControlSrc]
           ,[SortOrder]
           ,[IsAdmin]
           ,[Icon]
           ,[DefaultCacheTime]
           ,[Guid]
           ,[ResourceFile]
           ,[IsCacheable]
           ,[IsSearchable]
           ,[SearchListName]
           ,[SupportsPageReuse]
           ,[DeleteProvider])
     VALUES
           ('PopupFeatureName'
           ,'Popup/PopupModule.ascx'
           ,500
           ,0
           ,'blank.gif'
           ,0
           ,'ccb9cba3-c677-44bb-b63f-15426b2854a0'
           ,'PopupResources'
           ,0
           ,0
           ,''
           ,1
           ,'')
GO

IF NOT EXISTS (SELECT * FROM [dbo].[gb_SiteModuleDefinitions] WHERE [SiteID] = 1 AND [FeatureGuid] = 'ccb9cba3-c677-44bb-b63f-15426b2854a0')
INSERT INTO [dbo].[gb_SiteModuleDefinitions]
           ([SiteID]
           ,[ModuleDefID]
           ,[AuthorizedRoles]
           ,[SiteGuid]
           ,[FeatureGuid])
     VALUES
           (1
           ,(SELECT TOP 1 ModuleDefID FROM gb_ModuleDefinitions WHERE [Guid] = 'ccb9cba3-c677-44bb-b63f-15426b2854a0')
           ,'All Users'
           ,'d61fe7b9-1caa-4c2d-afc1-d4fc174631c9'
           ,'ccb9cba3-c677-44bb-b63f-15426b2854a0')
GO