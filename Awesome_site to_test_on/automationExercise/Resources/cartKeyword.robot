*** Settings ***
Library                    SeleniumLibrary
Library                    String
Resource                   ../PageObjects/variable.robot
Resource                   ${CURDIR}/uniKeyword.robot

*** Keywords ***
AddProduct
    ClickBtn        ${product_btn}
    ShouldSeeEle    ${product_list}
    ClickBtn        ${product_1_add2cart}
    ShouldSeeEle    ${product_notify}
    VerifyMsg       ${product_notify}    Added!
    ClickBtn        ${product_notify_viewcart}
AddProductNew
    [Arguments]     ${number}
    ClickBtn        ${product_${number}_add2cart}
    ShouldSeeEle    ${product_notify}
    VerifyMsg       ${product_notify}    Added!
    ClickBtn        ${product_notify_continue}
AddProductForCheckOut(AlreadyLoggedin)
    AddProduct
    ShouldSeeEle    ${product_check_out_btn}
    ClickBtn        ${product_check_out_btn}
    ShouldSeeText    Review Your Order
    Input Text      ${order_comment}    aaaaaaaaaaaa
    ClickBtn        ${order_place_order}
VerifyQuantity
    [Arguments]     ${InputQuantity}
    Input Text      ${product_quantity_increase}    ${InputQuantity}
    Click Button    ${product_quantity_add2cart}
    ShouldSeeEle    ${product_notify_viewcart}
    ClickBtn        ${product_notify_viewcart}
    ${ShowQuan}=    GetNumberFromElement(Nostring)    ${product_1_quan}
    Should Be Equal As Numbers    ${InputQuantity}    ${ShowQuan}
VerifyPrice
    [Arguments]    ${Price}    ${Quantity}    ${total}
    ${txtPrice}=    GetPriceFromElement(with Rs.)        ${Price}
    ${quantitynum}=    GetNumberFromElement(Nostring)    ${Quantity}
    ${totalResult}=    GetPriceFromElement(with Rs.)     ${Price}
    ${totalNum}=    GetPriceFromElement(with Rs.)        ${total}
    Should Be Equal As Numbers    ${totalResult}         ${totalNum}
GetPriceFromElement(with Rs.)
    [Arguments]                      ${element}
    ${txt}    Get Text               ${element}
    ${txt}=    Remove String         ${txt}    Rs. 
    ${num}=    Convert To Number     ${txt}
    RETURN    ${num}