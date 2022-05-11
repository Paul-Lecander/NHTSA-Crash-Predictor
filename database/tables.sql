CREATE TABLE accident (
    casenum VARCHAR(20)
    --TODO add interesting features
);

CREATE TABLE vehicle (
    casenum VARCHAR(20) NOT NULL,
    veh_no INTEGER NOT NULL
    --TODO add interesting features
);

CREATE TABLE person (
    casenum VARCHAR(20) NOT NULL,
    per_no INTEGER NOT NULL,
    veh_no INTEGER NOT NULL
    --TODO add interesting features
);