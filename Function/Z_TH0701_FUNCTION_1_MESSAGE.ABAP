*&---------------------------------------------------------------------*
*& Report  Z_TH0701_FUNCTION_1_MESSAGE
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  Z_TH0701_FUNCTION_1_MESSAGE.
***************************************************************************************************** 
* Message창을 출력하여, 사용자에게 오류를 보여주어라!                                         *
*****************************************************************************************************
PARAMETERS : num1 TYPE i,
num2 TYPE i.

DATA result TYPE i.
if num1 > 2147483647.
  MESSAGE 'I형타입은 Maximum값은 2147483647 입니다.' TYPE 'I'.
*  !!! 미리 시스템에서 정의된 오류들은 바꿀수가 없다.
*  예를 들면, SAP사에서 2147483647(4Byte Integer형)이상의 값들은 4바이트가 넘어가는 I형이므로, 오류처리를 내도록 해놨다. 
*  ---> 이러한 오류처리를 별도의 Alert창이라던지 호출 불가.

ELSE.
    IF num2 = 0.
    MESSAGE '분모값이 0이 될 순 없습니다.' TYPE 'E'.
* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* TYPE 'X' : 프로그램 에러 강제 종료.
* TYPE 'I' : Alert창 출력
* TYPE 'E' : Error 메시지 하단 출력
    ELSE.
    result = num1 / num2.
    WRITE : result.
    ENDIF.
ENDIF.