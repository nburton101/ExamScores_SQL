--Get the average test score from all groups
SELECT ParentMaritalStatus, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY ParentMaritalStatus

SELECT TestPrep, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY TestPrep

SELECT LunchType, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY LunchType

SELECT EthnicGroup, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY EthnicGroup
ORDER BY EthnicGroup

SELECT WklyStudyHours, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY WklyStudyHours

SELECT ParentEduc, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY ParentEduc

SELECT PracticeSport, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY PracticeSport

SELECT NrSiblings, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY NrSiblings

SELECT TransportMeans, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY TransportMeans

SELECT IsFirstChild, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY IsFirstChild

--Compare Parent education averages based on lunch type.
SELECT LunchType, ParentEduc, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY LunchType, ParentEduc
ORDER BY MathScore_AVG, ReadingScore_AVG, WritingScore_AVG

--Compare exam prop averages based on lunch type.
SELECT LunchType, TestPrep, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY LunchType, TestPrep
ORDER BY MathScore_AVG, ReadingScore_AVG, WritingScore_AVG

--Combine all three.
SELECT LunchType, TestPrep, ParentEduc, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
GROUP BY LunchType, TestPrep, ParentEduc
ORDER BY MathScore_AVG, ReadingScore_AVG, WritingScore_AVG

--Remove the unknown element from test prep and parent education.
SELECT LunchType, TestPrep, ParentEduc, AVG(MathScore) AS MathScore_AVG, AVG(ReadingScore) AS ReadingScore_AVG, AVG(WritingScore) AS WritingScore_AVG
FROM Exam_Scores_Dataset
WHERE NOT TestPrep = 'Unknown'
AND NOT ParentEduc = 'Unknown'
GROUP BY LunchType, TestPrep, ParentEduc
ORDER BY MathScore_AVG, ReadingScore_AVG, WritingScore_AVG