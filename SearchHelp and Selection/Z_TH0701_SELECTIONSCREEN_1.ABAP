*&---------------------------------------------------------------------*
*& Report  Z_TH0701_SELECTIONSCREEN_1
*&
*&------------------------------------------------------------------------------------------------------*
*& Scenario 1. ���� 1�� ���� 2�� ���� �� �ִ� SELECTION SCREEN�� ������.
*&             2. ���� 1�� ���� 2���̿��� comment ���ɾ �̿��Ͽ�, TO �ؽ�Ʈ�� ����϶�.
*&             3. ���� 1�� ���� 2���̿� �ִ� ��(���� 1�� ����2�� ����) ����϶�.
*&------------------------------------------------------------------------------------------------------*

REPORT  Z_TH0701_SELECTIONSCREEN_1.

SELECTION-SCREEN BEGIN OF LINE. "---> �Ķ���͸� ���� �� ��� �� �������� ����. ���ο��� SELECT-OPTIONS, SELECTION-SCREEN SKIP n ���� ��� �Ұ�.
SELECTION-SCREEN COMMENT 1(6) text-001. "---> (6) Text object�� dlen�� ��������.
PARAMETERS : num1 TYPE i.
SELECTION-SCREEN COMMENT 23(2) text-002." FOR FIELD num1.  "---> 22��° ��ġ���� 2�ڸ��� �����ϰ� �ض�.
* For field : the field help or input help for sel is displayed when the user selects the output field using the function keys F1 and F4.
* 16�ڸ��� Parameter �ڸ� �����. (���ڴ� 14�ڸ����� �Է�.) �ʹ� ������ ���̸� ©������ �ִ�.
*SELECTION-SCREEN POSITION POS_LOW. "---> �������� ���� ���� ����� ��ġ�� ������ ������.
*SELECTION-SCREEN POSITION POS_HIGH. "---> �������� ���� ���� �� �� ��ġ�� ������ ������.
PARAMETERS : num2 TYPE i.
SELECTION-SCREEN END OF LINE.

NEW-LINE. "bar ����.

*--- ���̰� ��� ����.
DATA num3 type i.
num3 = num1.
DO.
  IF num3 > num2.
    exit.
  else.
    WRITE : num3.
    num3 = num3 + 1.
    endif.
  ENDDO.