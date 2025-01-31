*** Variables ***

${url}                https://qaplayground.dev/
${browser}            gc
${btn_web_app}        xpath=/html/body/main/div[1]/div[1]/p[2]/a
${github}             xpath=/html/body/nav/div[2]/a
${credit}             xpath=/html/body/main/footer/div/a
${theme}              xpath=/html/body/main/footer/div/div[1]/a

######### CHALLENGE 2 #########
${challenge_2}                 xpath=/html/body/main/div[3]/a[2]/div
${challenge_ans}               xpath=/html/body/main/div/small

######### CHALLENGE 3 #########
${challenge_3}           xpath=/html/body/main/div[3]/a[3]
${challenge_3_input}     xpath=/html/body/main/div/div[2]/ul/input
${challenge_3_limit}     css=body > main > div > div.details > p
${challenge_3_remove}    xpath=/html/body/main/div/div[3]/button

######### CHALLENGE 5 #########
${challenge_5}    xpath=/html/body/main/div[3]/a[5]/div
${ch5_Be}         xpath=//*[@id="draggable-list"]/li[1]/div
${ch5_LaP}        xpath=//*[@id="draggable-list"]/li[2]/div
${ch5_LaE}        xpath=//*[@id="draggable-list"]/li[3]/div
${ch5_Wa}         xpath=//*[@id="draggable-list"]/li[4]/div
${ch5_Ma}         xpath=//*[@id="draggable-list"]/li[5]/div
${ch5_Ca}         xpath=//*[@id="draggable-list"]/li[6]/div
${ch5_Je}         xpath=//*[@id="draggable-list"]/li[7]/div
${ch5_Mi}         xpath=//*[@id="draggable-list"]/li[8]/div
${ch5_Am}         xpath=//*[@id="draggable-list"]/li[9]/div
${ch5_Bi}         xpath=//*[@id="draggable-list"]/li[10]/div

########### CHALLENGE 6 ###############
${challenge_6}    xpath=/html/body/main/div[3]/a[6]/div
${ch_6_new_tab}   id=open
########### CHALLENGE 7 ################
${challenge_7}                 xpath=/html/body/main/div[3]/a[7]/div
${challenge_7_open_btn}        id=login
${challenge_7_info}            id=info
${challenge_7_popup_submit}    xpath=//*[@id="wrapper"]/button
########### CHALLENGE 8 ################
${challenge_8}             xpath=/html/body/main/div[3]/a[8]/div
${challenge_8_click_me}    xpath=/html/body/div/fieldset/a    
${challenge_8)_message}    id=msg
########### CHALLENGE 9 ################
${challenge_9}              xpath=/html/body/main/div[3]/a[9]/div
${challenge_9_boost_btn}    xpath=/html/body/main/div/progress-bar//div[2]/button
${challenge_9_guage}         xpath=/html/body/main/div/progress-bar
########### CHALLENGE 10 ################
${challenge_10}            xpath=/html/body/main/div[3]/a[10]/div
${chl0_emote}              xpath=/html/body/div/div[1]/div[1]/div/li[1]/img
${ch10_radio_star}         name=rate
########### CHALLENGE 11 ################
${challenge_11}            xpath=/html/body/main/div[3]/a[11]/div
${ch11_btn}                xpath=//*[@id="fugitive"]
${ch11_info}               id=info
########### CHALLENGE 12 ################
${challenge_12}            xpath=/html/body/main/div[3]/a[12]/div
${ch12_num_file}           xpath=//*[@id="num-of-files"]
${ch12_input_btn}          xpath=//*[@id="file-input"]
${ch12_file_name_display}  xpath=//*[@id="images"]/figure/figcaption
########### CHALLENGE 13 ################
${challenge_13}            xpath=/html/body/main/div[3]/a[13]/div
${ch13_downlaod}           id=file
########### CHALLENGE 14 ################
${challenge_14}            xpath=/html/body/main/div[3]/a[14]/div
${ch14_welcome}            xpath=/html/body/div[1]/ul/li/a
${ch14_button}             xpath=/html/body/label
${ch14_content}            xpath=/html/body/div[2]
########### CHALLENGE 15 ################
${challenge_15}            xpath=/html/body/main/div[3]/a[15]/div
${ch15_add}                xpath=//*[@id="app"]/table/tbody[2]/tr/td/button
########### CHALLENGE 16 ################
${ch16_btn}                id=msg
########### CHALLENGE 17 ################
${ch17_pic}                xpath=/html/body/main/div/div/div[1]
${ch17_desc}               xpath=/html/body/main/div/div/div[2]/div/p[1]
${ch17_crnt_price}         xpath=/html/body/main/div/div/div[2]/div/p[2]
${ch17_old_price}         xpath=/html/body/main/div/div/div[2]/div/p[3]
########### CHALLENGE 18 ################
${ch18_get_location_btn}    id=get-location
${ch18_get_location_info}    id=location-info
########### CHALLENGE 19 ################
${ch19_home_btn}    id=nav
########### CHALLENGE 20 ################
${ch20_btn}    id=redirect
${ch20_location_info}    id=info
${ch20_btn_go_back}    xpath=/html/body/main/div[2]/a
########### CHALLENGE 22 ################
${ch22_input}    xpath=/html/body/div/div[1]/input
${ch22_btn}      xpath=/html/body/div/div[1]/button
${ch22_qr}       xpath=/html/body/div/div[2]/img
${ch22_lens_btn}    xpath=/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div[1]/div[3]/div[3]
${ch22_len_input}    xpath=//*[@id="ow12"]/div[1]/div[2]/c-wiz/div[3]/div/div[2]/div[2]/c-wiz/div/input
${ch22_len_input_2}    xpath=//*[@id="ow12"]/div[1]/div[2]/c-wiz/div[2]/div/div[2]/div[2]/c-wiz/div/input
${ch22_len_search_btn}    xpath=//*[@id="ow13"]/div[1]/div[2]/c-wiz/div[5]/div/div[2]/div[2]/c-wiz/div[2]/div
${ch22_result}        xpath=//*[@id="rso"]/div[1]/div/div/div[1]
#23
${ch23_timer}    xpath=/html/body/div/fieldset/div
#24
${ch24_feedback_btn}    id=feedback
${ch24_guage}           xpath=/html/body/div/div[2]/div[1]
${ch24_msg}             id=ty-msg