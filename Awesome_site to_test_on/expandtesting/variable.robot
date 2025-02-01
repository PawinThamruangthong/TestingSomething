*** Variables ***

${url}    https://practice.expandtesting.com/
${brw}    gc

#1
${1_num}    id=input-number
${1_txt}    id=input-text
${1_pwd}    id=input-password
${1_date}    id=input-date
${1_input_show}    id=btn-display-inputs
${1_input_clear}    id=btn-clear-inputs

#2
${2_given_id}          xpath=/html/body/main/div[3]/div[1]/div[1]/div/ul/li[1]
${2_given_password}    xpath=/html/body/main/div[3]/div[1]/div[1]/div/ul/li[2]
${2_input_id}          id=username
${2_input_password}    id=password
${2_btn_login}         xpath=//*[@id="login"]/button
${2_btn_logout}        xpath=/html/body/main/div[4]/div/a/i
${2_login_fail_noti}   id=flash

#3
${regis_username}            id=username
${regis_password}            id=password
${regis_comfirm_password}    id=confirmPassword
${regis_submit}              xpath=//*[@id="register"]/button
${regis_noti}                id=flash