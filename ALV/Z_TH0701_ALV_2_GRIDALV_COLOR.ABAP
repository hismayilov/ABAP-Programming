FORM set_grid_fcat_100  CHANGING ct_fcat TYPE lvc_t_fcat.
  DATA: ls_fcat TYPE lvc_s_fcat. "�ʵ� īŻ�α� Ÿ��.
  CLEAR ls_fcat.
  ls_fcat-fieldname = 'OBJID'.     "MATNR �ʵ常 ��ȸ�ϰڴ�.
  ls_fcat-outputlen = 18.
  ls_fcat-col_pos   = '1'.
  LS_fcat-emphasize = 'C610'.      "Į�� ���� �߰�(����).

  ls_fcat-scrtext_s = 'OBJID'.
  APPEND ls_fcat TO ct_fcat.
  CLEAR ls_fcat.
  ls_fcat-fieldname = 'STEXT'.     "STEXT �ʵ� ��ȸ�ϰڴ�.
  ls_fcat-outputlen = 18.
  ls_fcat-col_pos   = '1'.
  LS_fcat-emphasize = 'C111'.      "Į�� ���� �߰�(�Ķ�).
  ls_fcat-scrtext_s = 'STEXT'.
  APPEND ls_fcat TO ct_fcat.
  CLEAR ls_fcat.
  ls_fcat-fieldname = 'PERNR'.     "PERNR �ʵ� ��ȸ�ϰڴ�.
  ls_fcat-outputlen = 18.
  ls_fcat-col_pos   = '1'.
    LS_fcat-emphasize = 'C311'.      "Į�� ���� �߰�(���).
  ls_fcat-scrtext_s = 'PERNR'.
  APPEND ls_fcat TO ct_fcat.
    CLEAR ls_fcat.
  ls_fcat-fieldname = 'ENAME'.     "ENAME �ʵ� ��ȸ�ϰڴ�.
  ls_fcat-outputlen = 18.
  ls_fcat-col_pos   = '1'.
      LS_fcat-emphasize = 'C511'.      "Į�� ���� �߰�(�ʷ�).
  ls_fcat-scrtext_s = 'ENAME'.
  APPEND ls_fcat TO ct_fcat.

ENDFORM.                           "SET_GRID_FCAT_100