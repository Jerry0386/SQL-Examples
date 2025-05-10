-- Query 1
SELECT 
    ap.StartTime,
    ap.EndTime,
    em.Title,
    em.FirstName,
    em.LastName
FROM
    ApptTbl AS ap
        INNER JOIN
    EmpAssignTbl USING (ApptID)
        INNER JOIN
    EmployeeTbl AS em USING (EmpID)
WHERE
    ap.StartTime BETWEEN '2024-02-18' AND DATE_ADD('2024-02-18', INTERVAL 6 DAY)
ORDER BY ap.StartTime;

-- Query 2
SELECT 
    p.FirstName,
    p.LastName,
    p.BirthDate,
    i.CompanyName,
    i.PolicyID,
    i.Phone,
    s.Description,
    s.Cost
FROM
    PatientTbl AS p
        INNER JOIN
    InsuranceTbl AS i USING (PatientID)
        INNER JOIN
    ApptTbl USING (PatientID)
        INNER JOIN
    ServiceRequestTbl USING (ApptID)
        INNER JOIN
    ServiceTable AS s USING (ServID)
ORDER BY PatientID, ApptID;

-- Query 3
SELECT 
    ap.StartTime,
    p.FirstName,
    p.LastName,
    em.Title,
    em.FirstName,
    em.LastName
FROM
    ApptTbl AS ap
        INNER JOIN
    PatientTbl AS p USING (PatientID)
        INNER JOIN
    EmpAssignTbl USING (ApptID)
        INNER JOIN
    EmployeeTbl AS em USING (EmpID)
ORDER BY ap.StartTime;

-- Query 4
-- This query will show how many appointments each employee has had and the total revenue of all those appointments
SELECT 
    em.EmpID,
    em.Title,
    em.FirstName,
    em.LastName,
    COUNT(ea.ApptID) AS TotalAppointments,
    SUM(ap.FinalCost) AS TotalRevenue
FROM
    EmployeeTbl AS em
        INNER JOIN
    EmpAssignTbl AS ea USING (EmpID)
        INNER JOIN
    ApptTbl AS ap USING (ApptID)
GROUP BY EmpID;