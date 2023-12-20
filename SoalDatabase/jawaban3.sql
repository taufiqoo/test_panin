SELECT
    EI.employeename AS employeename,
    P.positionname AS positionname,
    S.supervisor_name AS spvname,
    SP.positionname AS spvposition,
    M.manager_name AS mngname,
    MP.positionname AS mngposition,
    H.head_name AS headname,
    HP.positionname AS headposition
FROM EmpInformation EI
    JOIN EmpEmployment EE ON EI.employeeid = EE.employeeid
    JOIN Position P ON EE.positionid = P.positionid
    LEFT JOIN EmpHierarchy EH ON EI.employeeid = EH.employeeid
    LEFT JOIN (
        SELECT
            EH.employeeid AS employeeid,
            EI.employeename AS supervisor_name
        FROM EmpHierarchy EH
            JOIN EmpInformation EI ON EH.spvid = EI.employeeid
    ) S ON EH.spvid = S.employeeid
    LEFT JOIN Position SP ON EH.spvid = SP.positionid
    LEFT JOIN (
        SELECT
            EH.employeeid AS employeeid,
            EI.employeename AS manager_name
        FROM EmpHierarchy EH
            JOIN EmpInformation EI ON EH.mngid = EI.employeeid
    ) M ON EH.mngid = M.employeeid
    LEFT JOIN Position MP ON EH.mngid = MP.positionid
    LEFT JOIN (
        SELECT
            EH.employeeid AS employeeid,
            EI.employeename AS head_name
        FROM EmpHierarchy EH
            JOIN EmpInformation EI ON EH.headid = EI.employeeid
    ) H ON EH.headid = H.employeeid
    LEFT JOIN Position HP ON EH.headid = HP.positionid;