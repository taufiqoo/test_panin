CREATE DATABASE test_panin;

USE test_panin;

CREATE TABLE
    `Position` (
        positionid BIGINT AUTO_INCREMENT PRIMARY KEY,
        positioncode VARCHAR(100),
        positionname VARCHAR(200)
    ) ENGINE = InnoDB;

CREATE TABLE
    `EmpInformation` (
        employeeid BIGINT AUTO_INCREMENT PRIMARY KEY,
        employeename VARCHAR(200),
        employeesex VARCHAR(2)
    ) ENGINE = InnoDB;

CREATE TABLE
    `EmpEmployment` (
        employeeid BIGINT PRIMARY KEY,
        positionid BIGINT,
        joindate DATE,
        permanentdate DATE,
        terminatedate DATE
    ) ENGINE = InnoDB;

CREATE TABLE
    `EmpHierarchy` (
        employeeid BIGINT PRIMARY KEY,
        spvid BIGINT,
        mngid BIGINT,
        headid BIGINT
    ) ENGINE = InnoDB;

INSERT INTO
    `Position` (positioncode, positionname)
VALUES ('HOD', 'Head of Department'), ('SMNG', 'Senior Manager'), ('MNG', 'Manager'), ('JMNG', 'Junior Manager'), ('SSPV', 'Senior Supervisor'), ('SPV', 'Supervisor'), ('JSPV', 'Junior Supervisor'), ('SSTF', 'Senior Staff'), ('STF', 'Staff'), ('JSTF', 'Junior Staff'), ('INTRN', 'Internship');

INSERT INTO
    EmpInformation (employeename, employeesex)
VALUES ('Andi', 'M'), ('Susi', 'F'), ('Budi', 'M'), ('Ani', 'F'), ('Jay', 'M'), ('Rudi', 'M'), ('Rendy', 'M'), ('Melinda', 'F'), ('Leo', 'M'), ('Samuel', 'M'), ('Sofia', 'F'), ('April', 'F'), ('Vita', 'F'), ('Jonathan', 'M'), ('Steven', 'M');

INSERT INTO
    EmpEmployment (
        employeeid,
        positionid,
        joindate,
        permanentdate,
        terminatedate
    )
VALUES (
        1,
        1,
        '2000-01-01',
        '2000-07-01',
        NULL
    ), (
        2,
        2,
        '2000-01-01',
        '2000-07-01',
        NULL
    ), (
        3,
        3,
        '2021-01-01',
        '2021-07-01',
        NULL
    ), (
        4,
        3,
        '2000-01-01',
        '2000-07-01',
        '2021-10-01'
    ), (
        5,
        5,
        '2000-01-01',
        '2000-07-01',
        '2022-01-01'
    ), (
        6,
        5,
        '2021-01-01',
        '2021-07-01',
        NULL
    ), (
        7,
        5,
        '2000-01-01',
        '2000-07-01',
        '2021-01-01'
    ), (
        8,
        6,
        '2000-01-01',
        '2000-07-01',
        NULL
    ), (
        9,
        6,
        '2022-01-01',
        '2022-07-01',
        NULL
    ), (
        10,
        9,
        '2000-01-01',
        '2000-07-01',
        NULL
    ), (
        11,
        9,
        '2000-01-01',
        '2000-07-01',
        '2021-07-01'
    ), (
        12,
        9,
        '2021-01-01',
        '2021-07-01',
        NULL
    ), (
        13,
        9,
        '2000-01-01',
        '2000-07-01',
        '2022-10-01'
    ), (
        14,
        9,
        '2022-01-01',
        '2022-07-01',
        NULL
    ), (
        15,
        9,
        '2000-01-01',
        '2000-07-01',
        '2021-12-12'
    );

INSERT INTO
    EmpHierarchy (
        employeeid,
        spvid,
        mngid,
        headid
    )
VALUES (1, 1, 1, 1), (2, 1, 1, 1), (3, 2, 2, 1), (4, 2, 2, 1), (5, 3, 3, 1), (6, 3, 3, 1), (7, 3, 3, 1), (8, 5, 3, 1), (9, 5, 3, 1), (10, 8, 3, 1), (11, 8, 3, 1), (12, 8, 3, 1), (13, 9, 3, 1), (14, 9, 3, 1), (15, 9, 3, 1);