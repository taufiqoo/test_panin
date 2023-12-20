SELECT
    Supervisor.employeename AS svpname,
    GROUP_CONCAT(
        Employee.employeename
        ORDER BY
            Employee.employeename
    ) AS teammember
FROM
    EmpHierarchy AS SupervisorHierarchy
    JOIN EmpHierarchy AS EmployeeHierarchy ON SupervisorHierarchy.employeeid = EmployeeHierarchy.spvid
    JOIN EmpInformation AS Supervisor ON SupervisorHierarchy.employeeid = Supervisor.employeeid
    JOIN EmpInformation AS Employee ON EmployeeHierarchy.employeeid = Employee.employeeid
WHERE
    Supervisor.employeename IN ('Andi', 'Budi', 'Susi', 'Jay')
GROUP BY
    Supervisor.employeename;