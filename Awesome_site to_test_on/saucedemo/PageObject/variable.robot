*** Variables ***

${url}        https://www.saucedemo.com/
${browser}    gc

# Login Page
${login_username}    id=user-name
${login_password}    id=password
${login_button}      id=login-button
${login_error_message}    xpath=//*[@data-test="error"]