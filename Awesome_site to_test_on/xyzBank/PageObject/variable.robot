*** Variables ***


${url}                                 https://www.globalsqa.com/angularJs-protractor/BankingProject/
${browser}                             gc
#${browser}                             headlesschrome

#LoginPage
${btn_home}                xpath=//*[@class="btn home"]
${login_cus}               xpath=//*[@ng-click="customer()"]
${login_bank}              xpath=//*[@ng-click="manager()"]

${btn_logout}              xpath=//*[@ng-show="logout"]
#Customer
${cus_acc}                 id=userSelect
${cus_login_btn}           xpath=//*[@ng-show="custId != ''"]
    #CusAccountMain
${cus_acc_book}            id=accountSelect
${selected_book}           css=body > div > div > div.ng-scope > div > div:nth-child(3) > strong:nth-child(1)
    #CusMenu
${cus_transaction}         xpath=//*[@ng-click="transactions()"]
${cus_deposit}             xpath=//*[@ng-click="deposit()"]
${cus_withdrawl}           xpath=//*[@ng-click="withdrawl()"]
    #CusInfo
${cus_balance}             xpath=/html/body/div/div/div[2]/div/div[2]/strong[2]
    #Customer transaction
${cus_transaction_start}    id=start
${cus_transaction_end}      id=end
${cus_transaction_table}    xpath=//*[@class="table table-bordered table-striped"]
    #Customer deposit
${cus_deposit_amount}      xpath=//*[@ng-model="amount"]
${cus_deposit_confirm}     xpath=/html/body/div/div/div[2]/div/div[4]/div/form/button
    #Customer withdrawl
${cus_withdrawl_amount}    xpath=//*[@ng-model="amount"]
${cus_withdrawl_confirm}    xpath=/html/body/div/div/div[2]/div/div[4]/div/form/button
    #Message
${cus_msg}                 xpath=//*[@ng-show="message"]
#Manager
${mng_add_cus}             xpath=//*[@ng-click="addCust()"]
${mng_open_acc}            xpath=//*[@ng-click="openAccount()"]
${mng_cus_list}            xpath=//*[@ng-click="showCust()"]

    #Add Customer
${mng_add_cus_first_name}    xpath=//*[@ng-model="fName"]
${mng_add_cus_last_name}     xpath=//*[@ng-model="lName"]
${mng_add_cus_post_code}     xpath=//*[@ng-model="postCd"]
${mng_add_cus_confirm_btn}   xpath=/html/body/div/div/div[2]/div/div[2]/div/div/form/button
    #Open Account
${mng_add_acc_cus_name}    id=userSelect
${mng_add_acc_currency}    id=currency
${mng_open_acc_process}    xpath=/html/body/div/div/div[2]/div/div[2]/div/div/form/button
    #Customer Management
${mng_cus_search}          xpath=//*[@ng-model="searchCustomer"]
${mng_cus_table}           xpath=//*[@class="table table-bordered table-striped"]
${mng_cus_delete}          xpath=//*[@ng-click="deleteCust(cust)"]