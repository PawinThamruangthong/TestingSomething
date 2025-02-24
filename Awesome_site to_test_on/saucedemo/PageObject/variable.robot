*** Variables ***

${url}        https://www.saucedemo.com/
${browser}    gc
# ${browser}    headlesschrome
# Login Page
${login_username}    id=user-name
${login_password}    id=password
${login_button}      id=login-button
${login_error_message}    xpath=//*[@data-test="error"]

# Inventory Page
${btn_submenu}    id=react-burger-menu-btn
${btn_cart}       xpath=//*[@id="shopping_cart_container"]/a
${btn_sort}       xpath=//*[@class="product_sort_container"]

#Submenu
${submenu_item_list}    xpath=//*[@id="menu_button_container"]/div/div[2]/div[1]/nav
${allitem}    xpath=//*[@id="inventory_sidebar_link"]
${about}      id=about_sidebar_link
${logout}     id=logout_sidebar_link
${resetApp}   id=reset_sidebar_link

#Cart Page
${btn_continue_shopping}    id=continue-shopping
${btn_checkout}             id=checkout
${cart_item_0}              xpath=//*[@id="cart_contents_container"]/div/div[1]/div[3]
${cart_item_1}              xpath=//*[@id="cart_contents_container"]/div/div[1]/div[4]

#CheckoutPage
#1
${checkout_first_name}      id=first-name
${checkout_last_name}       id=last-name
${checkout_zip}             id=postal-code
${checkout_error_msg}       xpath=//*[@id="checkout_info_container"]/div/form/div[1]/div[4]/h3
#${checkout_error_msg}       xpath=//*[@id="checkout_info_container"]
${checkout_cancel}          id=cancel
${checkout_continue}        id=continue
${checkout_hide_error_msg}    xpath=//*[@id="checkout_info_container"]/div/form/div[1]/div[4]/h3/button
${error_symbol_fname}       xpath=//*[@id="checkout_info_container"]/div/form/div[1]/div[1]/*[local-name()='svg']
${error_symbol_lname}       xpath=//*[@id="checkout_info_container"]/div/form/div[1]/div[2]/*[local-name()='svg']
${error_symbol_zip}         xpath=//*[@id="checkout_info_container"]/div/form/div[1]/div[3]/*[local-name()='svg']