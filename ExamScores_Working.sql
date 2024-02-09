--This is my working query, it is unorganized as I have worked through questions. 
--Remove un-needed column
ALTER TABLE Exam_Scores_Dataset DROP COLUMN column1;

--AVG test scores based on parents marital status
SELECT ParentMaritalStatus, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY ParentMaritalStatus

--Average test scores based on TestPrep
SELECT TestPrep, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY TestPrep

--Average test scores based on LunchType
SELECT LunchType, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY LunchType

SELECT EthnicGroup, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY EthnicGroup
ORDER BY EthnicGroup

--Average test score based on weekly study hours
SELECT WklyStudyHours, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY WklyStudyHours

--Average Test scores based on parent education
SELECT ParentEduc, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY ParentEduc

--Average test scores based on practicing sports
SELECT PracticeSport, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY PracticeSport

--Find the % of students that completed test prep based on lunch status. Initial thought was that lunch type could play a role in preping for the test. Virtually identical numbers for both.
SELECT LunchType, TestPrep, COUNT(*)/CAST(SUM(COUNT(*)) OVER (PARTITION BY LunchType) AS float)
FROM Exam_Scores_Dataset
GROUP BY LunchType, TestPrep

--Can a parent's marital status effect a student's ability to prep for a test. Numbers show all scores form completed are in the 30's and not completed are in the 60's. This does not play a factor
SELECT ParentMaritalStatus, TestPrep, COUNT(*)/CAST(SUM(COUNT(*)) OVER (PARTITION BY ParentMaritalStatus) AS float)
FROM Exam_Scores_Dataset
GROUP BY ParentMaritalStatus, TestPrep
ORDER BY ParentMaritalStatus

SELECT ParentMaritalStatus, LunchType,COUNT(*)/CAST(SUM(COUNT(*)) OVER (PARTITION BY LunchType) AS float) AS Perct_MaritalStatus
FROM Exam_Scores_Dataset
GROUP BY ParentMaritalStatus, LunchType
ORDER BY Perct_MaritalStatus DESC

SELECT NrSiblings, LunchType,COUNT(*)/CAST(SUM(COUNT(*)) OVER (PARTITION BY NrSiblings) AS float) AS Perct_Siblings
FROM Exam_Scores_Dataset
GROUP BY NrSiblings, LunchType
ORDER BY Perct_Siblings DESC

SELECT EthnicGroup, LunchType,COUNT(EthnicGroup)/CAST(SUM(COUNT(EthnicGroup)) OVER (PARTITION BY EthnicGroup) AS float) AS Perct_EthnicGroup
FROM Exam_Scores_Dataset
GROUP BY EthnicGroup, LunchType
ORDER BY Perct_EthnicGroup DESC

SELECT EthnicGroup, COUNT(EthnicGroup)
FROM Exam_Scores_Dataset
GROUP BY EthnicGroup

SELECT NrSiblings, LunchType, COUNT(NrSiblings) AS NumberOfSiblings_PerLunchType
FROM Exam_Scores_Dataset
GROUP BY NrSiblings, LunchType
ORDER BY NumberOfSiblings_PerLunchType DESC

SELECT LunchType, TestPrep, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY LunchType, TestPrep
ORDER BY MathScore_AVG, ReadingScore_AVG, WritingScore_AVG

SELECT LunchType, ParentEduc, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY LunchType, ParentEduc
ORDER BY MathScore_AVG, ReadingScore_AVG, WritingScore_AVG


SELECT LunchType, EthnicGroup, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY LunchType, EthnicGroup
ORDER BY MathScore_AVG, ReadingScore_AVG, WritingScore_AVG


