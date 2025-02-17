*** Variables ***

${url}                  https://www.automationexercise.com/
${browser}              gc

######################## TOP MENU ###################################
${contactus}            xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[8]/a
${loginbtn}             css=#header > div > div > div > div.col-sm-8 > div > ul > li:nth-child(4)
${logoutbtn}            css=#header > div > div > div > div.col-sm-8 > div > ul > li:nth-child(4) > a
${cart}                 xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[3]/a
######################## ICON ########################################
${icon_arrow}           xpath=//*[@id="scrollUp"]
######################## ACCOUNT ###################################
${login_email}          name=email
${login_password}       name=password
${login_error}          xpath=//*[@id="form"]/div/div/div[1]/div/form/p
${acc_login_btn}        xpath=//*[@id="form"]/div/div/div[1]/div/form/button
${register_name}        xpath=//*[@id="form"]/div/div/div[3]/div/form/input[2]
${register_email}       xpath=//*[@id="form"]/div/div/div[3]/div/form/input[3]
${register_error_msg}   xpath=//*[@id="form"]/div/div/div[3]/div/form/p
${register_btn}         css=#form > div > div > div:nth-child(3) > div > form > button
${radio_title_male}     xpath=//*[@id="id_gender1"]
${radio_title_female}   xpath=//*[@id="id_gender2"]
${register_password}    id=password
${dropdown_day}         id=days
${dropdown_month}       id=months
${dropown_year}         id=years
${news}                 id=newsletter
${offer}                id=optin
${firstname}            id=first_name
${lastname}             id=last_name
${company}              id=company
${address1}             id=address1
${address2}             id=address2
${country}              id=country
${state}                id=state
${city}                 id=city
${zipcode}              id=zipcode
${mobile}               id=mobile_number
${btn_createAccount}    css=#form > div > div > div > div > form > button
${btn_createAccount_continue}         css=#form > div > div > div > div > a
${btn_accdelete}        css=#header > div > div > div > div.col-sm-8 > div > ul > li:nth-child(5) > a
${btn_accdeletecontinue}              xpath=//*[@id="form"]/div/div/div/div/a3
${btn_accdel2}          xpath=//*[@id="form"]/div/div/div/div/a
######################## GET IN TOUCH ###################################
${git_name}             xpath=//*[@id="contact-us-form"]/div[1]/input
${git_email}            name=email
${git_subject}          xpath=//*[@id="contact-us-form"]/div[3]/input
${git_msg}              id=message
${git_upload}           css=#contact-us-form > div:nth-child(6) > input
${git_submit}           css=#contact-us-form > div:nth-child(7) > input
${git_file}             ${CURDIR}../File/upload.txt
${git_upload_msg}       xpath=//*[@id="contact-page"]/div[2]/div[1]/div/div[2]
${git_home_btn}         xpath=//*[@id="form-section"]/a
######################## TEST CASE ###################################
${testcase_btn}         xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a
${product_btn}          xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a
######################## CART      ###################################
${cart_info}                 id=cart_info
######################## PRODUCT ###################################
${product_remove}       xpath=//*[@id="product-1"]/td[6]/a
${product_1_add2cart}   xpath=/html/body/section[2]/div/div/div[2]/div/div[2]/div/div[1]/div[1]/a
${product_1_price}      xpath=//*[@id="product-1"]/td[3]/p
${product_1_quan}       xpath=//*[@id="product-1"]/td[4]/button
${product_1_total}      xpath=//*[@id="product-1"]/td[5]/p
${product_2_add2cart}   xpath=/html/body/section[2]/div/div/div[2]/div/div[3]/div/div[1]/div[1]/a
${product_notify}       xpath=//*[@id="cartModal"]/div/div/div[2]/p[1]
${product_notify_continue}    xpath=//*[@id="cartModal"]/div/div/div[3]/button
${product_notify_viewcart}    xpath=//*[@id="cartModal"]/div/div/div[2]/p[2]/a
${product_list}         xpath=/html/body/section[2]/div/div/div[2]/div
${viewproduct_btn}      xpath=/html/body/section[2]/div/div/div[2]/div/div[2]/div/div[2]/ul/li/a
${product_quantity_increase}    name=quantity
${product_quantity_add2cart}    xpath=/html/body/section/div/div/div[2]/div[2]/div[2]/div/span/button
${product_search}       id=search_product
${product_search_btn}   id=submit_search
${product_check_out_btn}    xpath=//*[@id="do_action"]/div[1]/div/div/a
${product_check_out}    xpath=//*[@id="checkoutModal"]/div/div
${product_check_out_register}    xpath=//*[@id="checkoutModal"]/div/div/div[2]/p[2]/a
${product_review_name}    id=name
${product_review_email}   id=email
${product_review_text}    id=review
${product_review_submit}    id=button-review
${product_recommend}    xpath=/html/body/section[2]/div/div/div[2]/div[2]
${product_recommend_item}    xpath=//*[@id="recommended-item-carousel"]/div/div[2]/div[3]/div/div/div/a
############################### CATEGORY ##################################
${category_main}        id=accordian
${woman_expand}         css=#accordian > div:nth-child(1) > div.panel-heading > h4 > a > span
${woman_sub}            xpath=//*[@id="Women"]/div/ul
${men_expand}           css=#accordian > div:nth-child(2) > div.panel-heading > h4 > a > span
${men_sub}              xpath=//*[@id="Men"]/div/ul
#BRAND#
${brand_main}           css=body > section > div > div.row > div.col-sm-3 > div > div.brands_products > div
######################## ORDER ###################################
${order_comment}        name=message
${order_place_order}    xpath=//*[@id="cart_items"]/div/div[7]/a
${payment_name}         name=name_on_card
${payment_card_num}     name=card_number
${payment_card_cvc}     name=cvc
${payment_card_mm}      name=expiry_month
${payment_card_yy}      name=expiry_year
${payment_confirm_btn}  id=submit
${invoice_download}     xpath=//*[@id="form"]/div/div/div/a
######################## SUBSRIBTION ###################################
${home_subscribtion}    css=#footer > div.footer-widget > div > div
${subscribtion_email}   id=susbscribe_email
${subscribtion_go}      id=subscribe
${subscribtion_alert}   css=#success-subscribe > div
