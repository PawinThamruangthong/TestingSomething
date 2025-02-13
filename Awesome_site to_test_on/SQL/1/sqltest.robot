*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    DatabaseLibrary
Suite Setup    Connect To Database    pymysql    ${DBNAME}    ${DBUSER}    ${DBPASS}    ${DBHOST}    ${DB_PORT}
Suite Teardown    Disconnect From Database
*** Keywords ***

*** Variables ***
${DBNAME}    mydb
${DBUSER}    root
${DBPASS}    root
${DBHOST}    localhost
${DBPORT}    3306

*** Test Cases ***

Create person table
    ${output}=    Execute Sql String    Create table person(id integer, first_name varchar(20), last_name varchar(20));
    Log To Console    ${output}
    Should Be Equal As Strings    ${output}    ${None}

Insert Data to table
    ${output}=    Execute Sql String    Insert Into person values(101,"tom","smith");
    Log    ${output}
    Should Be Equal As Strings    ${output}    None
Insert Multiple Data to table
    ${output}=    Execute Sql Script    ${CURDIR}/mydb_insert_into_person_multiple.sql
    Log    ${output}
    Should Be Equal As Strings    ${output}    None
Check Data
    ${output}=    Execute Sql String    Select first_name From person;
    Log    ${output}
Verify data
    #             Return Result with String
    ${output}=    Catenate    Select * From person Where first_name= 'Johna';
    Check Row Count    ${output}    >    0
Verify No data
    #             Return Result with String
    ${output}=    Catenate    Select * From person Where first_name= 'Helloworld';
    Check Row Count    ${output}    ==    0