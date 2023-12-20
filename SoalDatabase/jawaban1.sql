SELECT
    EI.employeename,
    P.positionname,
    EE.joindate,
    EE.permanentdate
FROM EmpInformation EI
    JOIN EmpEmployment EE ON EI.employeeid = EE.employeeid
    JOIN EmpHierarchy EH ON EI.employeeid = EH.employeeid
    JOIN Position P ON EE.positionid = P.positionid
WHERE EE.terminatedate IS NULL