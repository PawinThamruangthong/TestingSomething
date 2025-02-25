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

#Manager
${mng_add_cus}             xpath=//*[@ng-click="addCust()"]
${mng_open_acc}            xpath=//*[@ng-click="openAccount()"]
${mng_cus_list}            xpath=//*[@ng-click="showCust()"]