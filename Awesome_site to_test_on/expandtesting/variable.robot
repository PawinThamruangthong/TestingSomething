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

#4
${forgot_error}              xpath=//*[@id="forgot_password"]/div/div/div
${forgot_submit}             xpath=//*[@id="forgot_password"]/button
${noti}                      id=flash
${fotgot_confirm}            id=confirmation-alert

#5
${otp_request}               xpath=//*[@id="btn-send-otp"]
${otp_msg}                   id=otp-message
${otp_verify}                id=btn-send-verify
${otp_email_error}           xpath=/html/body/main/div[3]/div/div[2]/div/div/div/form/div/div
${otp_input}                 id=otp
${otp_email}                 id=email

#9
${show_brw_info}             id=browser-toggle

#10
#${fav_color_radio}           id=browser-info

#11
${box_a}                    id=column-a
${box_b}                    id=column-b

#12
${circle_1}                 xpath=//*[@id="source"]/div[1]
${circle_2}                 xpath=//*[@id="source"]/div[2]
${circle_3}                 xpath=//*[@id="source"]/div
${Drop_target}              id=target

#13
${cont_name}                name=ContactName
${cont_num}                 name=contactnumber
${cont_pick}                name=pickupdate
${cont_paym}                name=payment
${cont_regis}               xpath=/html/body/main/div[3]/div/div/div/div/form/div[5]/button
${cont_alert}               xpath=/html/body/main/div[3]/div/div
${cont_err_name}            xpath=/html/body/main/div[3]/div/div/div/div/form/div[1]/div[2]
${cont_err_num}             xpath=/html/body/main/div[3]/div/div/div/div/form/div[2]/div
${cont_err_pick}            xpath=/html/body/main/div[3]/div/div/div/div/form/div[3]/div
${count_err_paym}           xpath=/html/body/main/div[3]/div/div/div/div/form/div[4]/div

#14
${upload_section}           xpath=//*[@id="fileInput"]
${upload_btn}               id=fileSubmit

#16
${element_add}              xpath=/html/body/main/div[3]/div/button

#18
${noti_btn}                 xpath=/html/body/main/div[4]/div/p/a

#19
${country}                  id=country
${country_list}             xpath=//*[@id="countryautocomplete-list"]/div
${country_list_data}        xpath=//*[@id="countryautocomplete-list"]/div[1]

#23
${normal_btn}               xpath=//*[@id="my-btn"]

#24
${msg_txt}                  xpath=/html/body/main/div[3]/div/p[2]
${btm_container}            xpath=/html/body/footer/div

#28
${task_msg}                 xpath=//*[@id="result"]/p
${loading_circle}           xpath=//*[@id="result"]/div/div[1]

#29
${js_alert}                 id=js-alert
${js_confirm}               id=js-confirm
${js_prompt}                id=js-prompt

#31
${31_js_menu_link}             xpath=/html/body/main/div[3]/div/ul/li/a

#32
${32_enable}                id=ui-id-2
