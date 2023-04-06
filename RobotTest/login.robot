*** Settings ***
Library     Seleniumlibrary

*** Variables ***



*** Test Cases ***
LoginTest

    open browser    https://recroio.freshworks.com/     chrome
    input text      xpath://input[@type='email']        ismail@recro.io
    input text      xpath://input[@type='password']     Initial@123
    click element   xpath://button[@class='css-o1ejds']




 
*** Keywords ***

