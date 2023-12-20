SELECT
    P.positionname,
    SUM(
        CASE
            WHEN YEAR(EE.joindate) = 2021 THEN 1
            ELSE 0
        END
    ) AS joined_2021,
    SUM(
        CASE
            WHEN YEAR(EE.terminatedate) = 2021 THEN 1
            ELSE 0
        END
    ) AS terminated_2021
FROM EmpEmployment EE
    JOIN Position P ON EE.positionid = P.positionid
WHERE
    YEAR(EE.joindate) = 2021
    OR YEAR(EE.terminatedate) = 2021
GROUP BY P.positionname;