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
