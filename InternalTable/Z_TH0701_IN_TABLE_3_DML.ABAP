*&---------------------------------------------------------------------*
*& Report  Z_TH0701_IN_TABLE_3_DML
*&
*&---------------------------------------------------------------------*
*&
*&
*&-----------------------------------------------------------------------------
*! �˰Ե� ��� 1. INSERT�� DELETE�� INDEX�� Ȱ���Ͽ�, ���� �� ������ �����ϴ�.              *
*!          2. INSERT���� ���� �����ϴ� ���ͳ����̺��� INDEX + 1 ������ �ε��� ���� ��� ����. *
*!          3. DELETE���� ���� �����ϴ� ���ͳ����̺��� INDEX ������ �ε��� ���� ��� ����.     *
*******************************************************************************
REPORT  Z_TH0701_IN_TABLE_3_DML.

DATA : it_zthsoccer type TABLE OF zthsoccer,
      wo_Zthsoccer like LINE OF it_zthsoccer.

SELECT *
  FROM zthsoccer
  into table it_Zthsoccer.

write : / '�������� ���Դϴ�.'.
 LOOP AT it_zthsoccer into wo_Zthsoccer.
   WRITE : / wo_Zthsoccer-name, wo_zthsoccer-nation.
ENDLOOP.

DELETE it_Zthsoccer INDEX 4. "���ͳ� ���̺��� 4��° ���� �����϶�.

wo_Zthsoccer-name = '������'.
wo_Zthsoccer-nation = '���ѹα�'.
INSERT wo_zthsoccer INTO it_zthsoccer index 4. "���ͳ� ���̺��� 4��° �࿡ ���ο� �����͸� �����϶�.

write : /,/ '�������� ���Դϴ�.'.
 LOOP AT it_zthsoccer into wo_Zthsoccer.
   WRITE : / wo_Zthsoccer-name, wo_zthsoccer-nation.
ENDLOOP.