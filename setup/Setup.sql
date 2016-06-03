/* Create Database */
CREATE SCHEMA `ProjMan` DEFAULT CHARACTER SET utf8 ;

/* Create Table User */
CREATE TABLE `ProjMan`.`User` (
  `UserId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `UserName` VARCHAR(60) NOT NULL,
  `UserEmail` VARCHAR(150) NOT NULL,
  `UserPassword` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE INDEX `UserName_UNIQUE` (`UserName` ASC),
  UNIQUE INDEX `UserEmail_UNIQUE` (`UserEmail` ASC));

/* Create Table Workflow */
CREATE TABLE `ProjMan`.`Workflow` (
  `WorkflowID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `WorkflowName` VARCHAR(45) NOT NULL,
  `WorkflowDescription` VARCHAR(200) NULL,
  PRIMARY KEY (`WorkflowID`),
  UNIQUE INDEX `WorkflowName_UNIQUE` (`WorkflowName` ASC));

/* Create Table WorkflowStepStatuses*/
CREATE TABLE `ProjMan`.`WorkflowStepStatuses` (
  `WorkflowStepId` INT ZEROFILL NOT NULL,
  `IssueStatusId` INT ZEROFILL NOT NULL);

/* Create Table WorkflowStep */
CREATE TABLE `ProjMan`.`WorkflowStep` (
  `WorkflowStepId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `WorkflowStepName` VARCHAR(50) NOT NULL,
  `WorkflowStepDescription` VARCHAR(250) NOT NULL,
  `WorkflowStepOrder` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`WorkflowStepId`),
  UNIQUE INDEX `WorkflowStepName_UNIQUE` (`WorkflowStepName` ASC));

/* Create Table Label */
CREATE TABLE `ProjMan`.`Label` (
  `LabelId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `LabelName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`LabelId`),
  UNIQUE INDEX `LabelName_UNIQUE` (`LabelName` ASC));

/* Create Table Issue */
CREATE TABLE `ProjMan`.`Issue` (
  `IssueId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `IssueSummary` VARCHAR(100) NOT NULL,
  `IssueDetails` MEDIUMTEXT NULL,
  `IssueType` INT UNSIGNED NOT NULL,
  `IssueStatus` INT UNSIGNED NOT NULL,
  `EpicId` INT UNSIGNED NULL,
  `ProjectId` INT UNSIGNED NOT NULL,
  `IssueReporter` INT UNSIGNED NOT NULL,
  `IssueAssignee` INT UNSIGNED NULL DEFAULT 0,
  `IssuePoints` INT UNSIGNED NULL,
  `IssueParent` INT UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`IssueId`));

/* Create Table IssueType */
CREATE TABLE `ProjMan`.`IssueType` (
  `IssueTypeId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `IssueTypeName` VARCHAR(50) NOT NULL,
  `IssueTypeIcon` VARCHAR(50) NOT NULL,
  `IssueTypeSubTask` BIT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`IssueTypeId`),
  UNIQUE INDEX `IssueTypeName_UNIQUE` (`IssueTypeName` ASC));

/* Create Table IssueStatus */
CREATE TABLE `ProjMan`.`IssueStatus` (
  `IssueStatusId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `IssueStatusName` VARCHAR(50) NOT NULL,
  `IssueStatusDescription` VARCHAR(50) NULL,
  PRIMARY KEY (`IssueStatusId`),
  UNIQUE INDEX `IssueStatusName_UNIQUE` (`IssueStatusName` ASC));

/* Create Table IssueHistory */
CREATE TABLE `ProjMan`.`IssueHistory` (
  `IssueHistoryId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `IssueId` INT UNSIGNED NOT NULL,
  `ActionId` INT UNSIGNED NOT NULL,
  `TransitionId` INT UNSIGNED NULL,
  `IssueHistoryTime` TIMESTAMP NOT NULL DEFAULT NOW(),
  `IssueHistoryBy` INT UNSIGNED NOT NULL,
  `IssueHistoryComment` MEDIUMTEXT NULL,
  PRIMARY KEY (`IssueHistoryId`));

/* Create Table Project */
CREATE TABLE `ProjMan`.`Project` (
  `ProjectId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ProjectName` VARCHAR(50) NOT NULL,
  `ProjectDescription` VARCHAR(250) NULL,
  `ProjectKey` VARCHAR(15) NOT NULL,
  `ProjectWorkflow` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`ProjectId`),
  UNIQUE INDEX `ProjectName_UNIQUE` (`ProjectName` ASC),
  UNIQUE INDEX `ProjectKey_UNIQUE` (`ProjectKey` ASC));

/* Create Table WorkflowTransition */
CREATE TABLE `ProjMan`.`WorkflowTransition` (
  `WorkflowTransitionId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `WorkflowTransitionName` VARCHAR(50) NOT NULL,
  `TransitionStart` INT UNSIGNED NOT NULL,
  `TransitionEnd` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`WorkflowTransitionId`));

/* Create Table Epic */
CREATE TABLE `ProjMan`.`Epic` (
  `EpicId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `EpicName` VARCHAR(50) NOT NULL,
  `EpicDescription` VARCHAR(250) NOT NULL,
  `EpicColor` CHAR(6) NOT NULL,
  `EpicProject` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`EpicId`),
  UNIQUE INDEX `EpicName_UNIQUE` (`EpicName` ASC));