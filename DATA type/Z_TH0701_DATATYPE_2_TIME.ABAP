*&---------------------------------------------------------------------*
*& Report  Z_TH0701_DATATYPE_2_TIME
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  Z_TH0701_DATATYPE_2_TIME.
DATA: current_date type d,
      current_time TYPE t,
      headquarters_date type d,
      headquarters_time type t.
current_date = sy-datum. "���� ��¥�� �����ϴ� �ý��� ���� 'sy-datum'
current_time = sy-uzeit. "���� �ð��� �����ϴ� �ý��� ���� 'sy-uzeit'
headquarters_date = sy-datlo. "Ŭ���̾�Ʈ�� ��¥�� �����ϴ� �ý��� ���� 'sy-datlo'
headquarters_time = sy-timlo. "Ŭ���̾�Ʈ�� ��¥�� �����ϴ� �ý��� ���� 'sy-timlo'


WRITE : '���� ���ó�¥��', current_date,'�̸�', / ,
'���� ���ýð���', current_time, '�Դϴ�.', / ,
'���� ������ ��¥��', headquarters_date, '�̸�', / ,
'���� ������ �ð���', headquarters_time, '�Դϴ�.'.