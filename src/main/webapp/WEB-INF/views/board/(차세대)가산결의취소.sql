-- ������� ��� 
-- ������ǵ� �ش��(������)���� ���� , ������ �����ٸ� ����ڰ� ���� ���� ��� �� �ٽ� ��극�������� ���� ���ʰ��Ƿ� ������־�� �Ѵ�.


--������� ��� �� ���γ�¥���� 
  
  
select * from PM_ROD_OCPF_LVR_REQ where 1 = 1
and per_no in ('��2607') -- �㰡��ȣ
and sr_yr = '2021' -- �ΰ��⵵
; 


select *
  from RM_DECIDE_COLLECTION_HIST
 where EPAY_NO = '0195221361079704982'
                         ; 
   


-- �ش� ������� ��ũƮ�����̵� ��ȸ�Ѵ�.
-- BPT_AMT(���⳻ �ݾ�)�� ADD_AMT(�����)�� Ȯ�� 
-- INFRM_RCPT_DIV_CD = C �̸�  RS_TY_CD = 130�� ���� ������ǰ��̴�.
select a.BPT_AMT, a.ADD_AMT ,a.* 
  from DBRAIN_ROAD.TB_INSR001_IFR a
 where a.EPAY_NO = '0195211361079704655'
;

-- ���ο� ��ũƮ�����̵� �����Ѵ�.
SELECT 'IF_R_INSR_001_CPS_' ||TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSSSS')||'_' || LTRIM(TO_CHAR( TOBE_TRAN_ID_SEQ.NEXTVAL,'0000')) 
  FROM DUAL
;

-- ���� ������ ��ũƮ�����̵� SELECT ���� �Է��Ѵ�. �������� ������ �ʿ� ����.
-- WHERE���� EPAY_NO(���ڳ��ι�ȣ)�� �Է� �� , �ش� ������� ��ũƮ�����̵� �Է��Ѵ�. �ش� ����� Ȯ�� ����� ���� ���� �Ǿ� �ִ�.
INSERT INTO DBRAIN_ROAD.TB_INSR001_IFR (
 		LINK_TRAN_ID /*TRAN_ID*/,					  	  LINK_PRCS_SEQ /*LINK_DEAL_SEQ*/,  	 		 LINK_PRCS_TDT /*LINK_DEAL_DTM*/,              
		EPAY_NO,                				    	  INFRM_RCPT_DIV_CD /*RCP_DIV_CD*/, 	 		 RS_TY_CD,                             TOA_CD /*TOA_CD*/,                            
		INFRM_DGR /*BUL_DGR*/,   						  
		ADD_DGR,                  	         		 	  OFFC_CD,                              		 ACNT_CD,                              ACCT_CD,        
		GOF_CD /*FGO_CD*/,     		         			  IKWAN_CD,                             		 IHANG_CD,                             IMOK_CD, 
		SHAM_CD,                   		     		 	  FLD_CD,                               		 SECT_CD,							   PGM_CD,
		ACTV_CD,                   		     		 	  PAYR_CLT_DIV_CD /*PAYR_DIV_CD*/,      		 PAYR_RNM_NO_ENCRP /*PAYR_RNNO*/,      PAYR_RNM,
		PAYR_ZIP_NO,                 		     	 	  PAYR_ADDR,                              		 PAYR_TELNO /*PAYR_PNO*/,              PAYP_INSI_AF_DIV_CD /*PAYBF_AF_DIV_CD*/,        
		RS_YMD /*RS_DT*/,            		    		  INFRM_YMD /*BUL_DT*/,                 		 BPT_TERM_YMD /*PAYBF_DLN_DT*/,        BPT_AMT /*PAYBF_AMT*/,        
		ADD_AMT,         		           			      RD_DIV_CD,                  		   			 LEVY_GRND_DES,						   YLD_GRND_DES1 /*YLD_GRND_DES_1*/,
		YLD_GRND_DES2 /*YLD_GRND_DES_2*/,		 		  YLD_GRND_DES3 /*YLD_GRND_DES_3*/,	   			 MTX_CLC_ACC_NO /*MNTAX_CLCTR_ACC_NO*/,MTX_CLC_SMACCT_CD /*MNTAX_CLCTR_SML_ACCT_CD*/,        
		MTX_CLTN_RS_AMT /*MNTAX_CLCT_RS_AMT*/, 		 	  FTAX_RS_AMT /*RURAL_SPC_TAX_RS_AMT*/, 		 ETAX_RS_AMT,                          TTAX_RS_AMT,        
		SPXT_RS_AMT,                         			  LQTAX_RS_AMT,                         		 VAT_RS_AMT /*VATAX_RS_AMT*/,          DTAX_RS_AMT,        
		AMT_MDFCN_PRMS_YN /*AMT_MOD_PRMS_YN*/,		 	  IN_DMND_YN /*IN_RQ_YN*/,      		   		 INFRM_MTH_CD /*BUL_MTH_CD*/,          DST_TAX /*LTAX_AMT*/,        	 
 	    INFRM_DATA_PRCS_STAT_CD /*MTR_DEAL_STAT_CD*/,	  CCRD_PAY_PSB_YN /*CARD_PAY_PSB_YN*/,  		 RL_PAYR_RNM_NO_ENCRP /*RL_PAYR_RNNO*/,LINK_PRCS_YR /*����ó���⵵*/     )  
		--SAY_CD /*���λ���ڵ�*/,                          	  EXE_UNIT_CD /*��������ڵ�*/                       ) 
SELECT  /* LINK_TRAN_ID*/
 		'IF_R_INSR_001_CPS_20220124140750864_2952',		  1 /*LINK_DEAL_SEQ*/,  	 		 			 systimestamp /*LINK_DEAL_DTM*/,              
		EPAY_NO,                				    	  'D' /*RCP_DIV_CD*/, 	 		 				 '130',                                TOA_CD /*TOA_CD*/,                            
		INFRM_DGR /*BUL_DGR*/,   						  
		ADD_DGR,                  	         		 	  OFFC_CD,                              		 ACNT_CD,                              ACCT_CD,        
		GOF_CD /*FGO_CD*/,     		         			  IKWAN_CD,                             		 IHANG_CD,                             IMOK_CD, 
		SHAM_CD,                   		     		 	  FLD_CD,                               		 SECT_CD,							   PGM_CD,
		ACTV_CD,                   		     		 	  PAYR_CLT_DIV_CD /*PAYR_DIV_CD*/,      		 PAYR_RNM_NO_ENCRP /*PAYR_RNNO*/,      PAYR_RNM,
		PAYR_ZIP_NO,                 		     	 	  PAYR_ADDR,                              		 PAYR_TELNO /*PAYR_PNO*/,              PAYP_INSI_AF_DIV_CD /*PAYBF_AF_DIV_CD*/,        
		RS_YMD /*RS_DT*/,            		    		  INFRM_YMD /*BUL_DT*/,                 		 BPT_TERM_YMD /*PAYBF_DLN_DT*/,        BPT_AMT /*PAYBF_AMT*/,        
		ADD_AMT,         		           			      RD_DIV_CD,                  		   			 LEVY_GRND_DES,						   YLD_GRND_DES1 /*YLD_GRND_DES_1*/,
		YLD_GRND_DES2 /*YLD_GRND_DES_2*/,		 		  YLD_GRND_DES3 /*YLD_GRND_DES_3*/,	   			 MTX_CLC_ACC_NO /*MNTAX_CLCTR_ACC_NO*/,MTX_CLC_SMACCT_CD /*MNTAX_CLCTR_SML_ACCT_CD*/,        
		MTX_CLTN_RS_AMT /*MNTAX_CLCT_RS_AMT*/, 		 	  FTAX_RS_AMT /*RURAL_SPC_TAX_RS_AMT*/, 		 ETAX_RS_AMT,                          TTAX_RS_AMT,        
		SPXT_RS_AMT,                         			  LQTAX_RS_AMT,                         		 VAT_RS_AMT /*VATAX_RS_AMT*/,          DTAX_RS_AMT,        
		AMT_MDFCN_PRMS_YN /*AMT_MOD_PRMS_YN*/,		 	  IN_DMND_YN /*IN_RQ_YN*/,      		   		 INFRM_MTH_CD /*BUL_MTH_CD*/,          DST_TAX /*LTAX_AMT*/,        	 
 	    INFRM_DATA_PRCS_STAT_CD /*MTR_DEAL_STAT_CD*/,	  CCRD_PAY_PSB_YN /*CARD_PAY_PSB_YN*/,  		 RL_PAYR_RNM_NO_ENCRP /*RL_PAYR_RNNO*/,LINK_PRCS_YR /*����ó���⵵*/      
		--SAY_CD /*���λ���ڵ�*/,                          	  EXE_UNIT_CD /*��������ڵ�*/                       ) 
FROM DBRAIN_ROAD.TB_INSR001_IFR
WHERE EPAY_NO = '0195221361079704982' -- ���ڳ��ι�ȣ
AND LINK_TRAN_ID = 'IF_R_INSR_001_CPS_20220117140050413_2505'; --�ش� ������� ��ũƮ�����̵�.



-- ������ INSERT �� �� �Է��ߴ� ���� ������ ��ũƮ�����̵� 200 ���̺��� INSERT �ؾ� �Ѵ�.
-- ��ũƮ�����̵� ���� �� INSERT �Ѵ�. 
   INSERT INTO DBRAIN_ROAD.TB_IFTI200(
				 LINK_TRAN_ID		    ,LINK_ID	 	,LINK_TR_DIV_CD
				,LINK_OJOG_CD			,LINK_SYS_CD    ,LINK_JOB_DIV_CD
				,LINK_STAT_CD        	,LINK_CRT_TDT	,LINK_PRCS_TDT
				)
			VALUES (
		         'IF_R_INSR_001_CPS_20220124140750864_2952' /*TRAN_ID*/,'IF_R_INSR_001_CPS'		,'S'
		         ,'G027'           		 							   ,'DBR'      				,'C'
		         ,'SN'          		 							   ,systimestamp					,systimestamp
		         );


COMMIT;

-- ������ INSERT �� 1���� ���� �Ŀ�, 200���̺� �Է��ߴ� ���� ������ ��ũƮ�����̵�� ��ȸ�� LINK_ERR_MSG Į���� 'NO ERROR'�� �ԷµǾ��ٸ� 1�ܰ� ����ó�� �� ���̴�.
/*****/SELECT * FROM DBRAIN_ROAD.TB_IFTI200 where 1 = 1 and LINK_TRAN_ID = 'IF_R_INSR_001_CPS_20220124140750864_2952';

-- 2�ܰ�� 007 ���̺� ��ũƮ�����̵� �Է��ϰ� INFRM_LINK_PRCS_STAT_NM Į���� '���������� ó���Ǿ����ϴ�' ��� �޼����� �ִٸ� ���������� ����ó�� �� ���̴�.
select * from DBRAIN_ROAD.TB_INSR007_IFs where 1 = 1 and RCPTN_LINK_TRAN_ID = 'IF_R_INSR_001_CPS_20220124140750864_2952'; -- ��������ó������۽�  / ���ʰ��Ǵ� insert �ȵ�     


-- ���� 200 ���̺�� 007 ���̺��� ������ ���ٸ� ���� �߸� �־��ų� ��극�� �ҽ��� ������ �־ ������ �߻����� ���̴�.
-- ������ ������ �پ��ϰ� ������ �ʹ� ���� ������ ��극�ο��� ����ϴ� ���� �޼����� �������� ������ �м��ϰų� ��극�� ���� ������� ���� �ؾ� �Ѵ�.




-- ���������� �� �ݵ�� ���γ�¥����
-- �Ʒ����ʹ� ���γ�¥ �����ϴ� ����    
    
    
    
  

--* �۾� ���
-- ��������
SELECT *
  FROM RM_DECIDE_COLLECTION_HIST
 WHERE PERMIT_NO = '��2607'
  and std_yy='2021' order by cnt desc
;


--FGO_CD(¡��������)������ �ʿ�. �㰡��ȣ �ְ� �˻� 
sELECT * 
  FROM PM_CLPC_CD
 WHERE CD_VL3='CLCTR_FGO_CD'
   AND CD_VL2=(SELECT orcd FROM  PM_RDOC_PMRG  WHERE PER_NO='ȭ��2013-15' AND ROWNUM=1); 
 

-- ���ο� LINK_TRAN_ID ����  
       SELECT 'IF_R_INSR_001_CPS_' ||TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSSSS')||'_' || LTRIM(TO_CHAR( TOBE_TRAN_ID_SEQ.NEXTVAL,'0000')) 
       FROM DUAL
        ;
  


select *
from DBRAIN_ROAD.TB_INSR001_IFR 
where EPAY_NO = '0195211361079704655'
;




-- 1.������ ���� ������ LINK_TRAN_ID�� �����Ѵ�.
-- 2.4�� EPAY_NO ����
-- 3.������ ��ȸ�� FGO_CD ����
-- 4.���α��� ����
 INSERT INTO DBRAIN_ROAD.TB_INSR001_IFR (
 		LINK_TRAN_ID /*TRAN_ID*/,					  	  LINK_PRCS_SEQ /*LINK_DEAL_SEQ*/,  	 		 LINK_PRCS_TDT /*LINK_DEAL_DTM*/,              
		EPAY_NO,                				    	  INFRM_RCPT_DIV_CD /*RCP_DIV_CD*/, 	 		 RS_TY_CD,                             TOA_CD /*TOA_CD*/,                            
		INFRM_DGR /*BUL_DGR*/,   						  
		ADD_DGR,                  	         		 	  OFFC_CD,                              		 ACNT_CD,                              ACCT_CD,        
		GOF_CD /*FGO_CD*/,     		         			  IKWAN_CD,                             		 IHANG_CD,                             IMOK_CD, 
		SHAM_CD,                   		     		 	  FLD_CD,                               		 SECT_CD,							   PGM_CD,
		ACTV_CD,                   		     		 	  PAYR_CLT_DIV_CD /*PAYR_DIV_CD*/,      		 PAYR_RNM_NO_ENCRP /*PAYR_RNNO*/,      PAYR_RNM,
		PAYR_ZIP_NO,                 		     	 	  PAYR_ADDR,                              		 PAYR_TELNO /*PAYR_PNO*/,              PAYP_INSI_AF_DIV_CD /*PAYBF_AF_DIV_CD*/,        
		RS_YMD /*RS_DT*/,            		    		  INFRM_YMD /*BUL_DT*/,                 		 BPT_TERM_YMD /*PAYBF_DLN_DT*/,        BPT_AMT /*PAYBF_AMT*/,        
		ADD_AMT,         		           			      RD_DIV_CD,                  		   			 LEVY_GRND_DES,						   YLD_GRND_DES1 /*YLD_GRND_DES_1*/,
		YLD_GRND_DES2 /*YLD_GRND_DES_2*/,		 		  YLD_GRND_DES3 /*YLD_GRND_DES_3*/,	   			 MTX_CLC_ACC_NO /*MNTAX_CLCTR_ACC_NO*/,MTX_CLC_SMACCT_CD /*MNTAX_CLCTR_SML_ACCT_CD*/,        
		MTX_CLTN_RS_AMT /*MNTAX_CLCT_RS_AMT*/, 		 	  FTAX_RS_AMT /*RURAL_SPC_TAX_RS_AMT*/, 		 ETAX_RS_AMT,                          TTAX_RS_AMT,        
		SPXT_RS_AMT,                         			  LQTAX_RS_AMT,                         		 VAT_RS_AMT /*VATAX_RS_AMT*/,          DTAX_RS_AMT,        
		AMT_MDFCN_PRMS_YN /*AMT_MOD_PRMS_YN*/,		 	  IN_DMND_YN /*IN_RQ_YN*/,      		   		 INFRM_MTH_CD /*BUL_MTH_CD*/,          DST_TAX /*LTAX_AMT*/,        	 
 	    INFRM_DATA_PRCS_STAT_CD /*MTR_DEAL_STAT_CD*/,	  CCRD_PAY_PSB_YN /*CARD_PAY_PSB_YN*/,  		 RL_PAYR_RNM_NO_ENCRP /*RL_PAYR_RNNO*/,LINK_PRCS_YR /*����ó���⵵*/     )  
		--SAY_CD /*���λ���ڵ�*/,                          	  EXE_UNIT_CD /*��������ڵ�*/                       ) 
SELECT  /*Ʈ��id*/
		'IF_R_INSR_001_CPS_20220124142251741_2953', 		1,											systimestamp,
		'0195221361079704982', /*���ڳ��ι�ȣ*/					'U',										'110',								'41010301',
		( SELECT COUNT(*) +1 FROM DBRAIN_ROAD.TB_INSR001_IFR WHERE EPAY_NO= '0195221361079704982' ),/*BUL_DGR , EPAY_NO ����*/
		0,									  				'095',										'214',								'01',
		'12201324',/*FGO_CD*/								'11',										'51',								'511',
		'000',											  	'0000',										'0000',							    '0000',
		'0000',										        NPAQ700.PAY_DIV_CD,							NPAQ700.CLT_RNM_NO_ENCRP,			NPAQ700.PAYR_NM,
		NPAQ700.PAYR_ZIP_NO,								NPAQ700.PAYR_ADDR,							NPAQ700.PAYR_TELNO,					'B',
		TO_CHAR(SYSDATE, 'YYYYMMDD'),						TO_CHAR(SYSDATE, 'YYYYMMDD'),/*��������*/		'20220125',/*���α���*/					NPAQ710.PAY_AMT+NPAQ710.VLA_TAX+NPAQ710.PAY_INT_AMT,/*�ѱݾ�*/
		0,/*����ݾ�*/											'A',										NPAQ700.LEVY_GRND_DES,				NPAQ700.YLD_GRND_DES1,
		NPAQ700.YLD_GRND_DES2,								NPAQ700.YLD_GRND_DES3,			 /*EPAY_NO*/SUBSTR('0195221361079704982', 7, 6),'1',
		NPAQ710.PAY_AMT,/*A.USE_AMT-A.VAT_AMT*/				0,											0,									0,
		0,													0,											0,									0,
		'N',												'N',										'S',								0,
		'0099',												'Y',										NPAQ700.CLT_RNM_NO_ENCRP,					TO_CHAR(SYSDATE, 'YYYY')
		--''/*SAY_CD*/,										''/*EXE_UNIT_CD*/
FROM  DBRAIN_ROAD.TB_NPAQ710_IFR NPAQ710
	 ,DBRAIN_ROAD.TB_NPAQ700_IFR NPAQ700
WHERE NPAQ710.LINK_TRAN_ID = NPAQ700.LINK_TRAN_ID
AND NPAQ710.EPAY_NO = '0195221361079704982';



-- LINK_TRAN_ID ����
   INSERT INTO DBRAIN_ROAD.TB_IFTI200(
				 LINK_TRAN_ID		    ,LINK_ID	 	,LINK_TR_DIV_CD
				,LINK_OJOG_CD			,LINK_SYS_CD    ,LINK_JOB_DIV_CD
				,LINK_STAT_CD        	,LINK_CRT_TDT	,LINK_PRCS_TDT
				)
			VALUES (
		         'IF_R_INSR_001_CPS_20220124142251741_2953' /*TRAN_ID*/,'IF_R_INSR_001_CPS'		,'S'
		         ,'G027'           		 							   ,'DBR'      				,'C'
		         ,'SN'          		 							   ,systimestamp					,systimestamp
		         );

-- ������ INSERT �� 1���� ���� �Ŀ�, 200���̺� �Է��ߴ� ���� ������ ��ũƮ�����̵�� ��ȸ�� LINK_ERR_MSG Į���� 'NO ERROR'�� �ԷµǾ��ٸ� 1�ܰ� ����ó�� �� ���̴�.
/*****/SELECT * FROM DBRAIN_ROAD.TB_IFTI200 where 1 = 1 and LINK_TRAN_ID = 'IF_R_INSR_001_CPS_20220124140750864_2952';

-- 2�ܰ�� 007 ���̺� ��ũƮ�����̵� �Է��ϰ� INFRM_LINK_PRCS_STAT_NM Į���� '���������� ó���Ǿ����ϴ�' ��� �޼����� �ִٸ� ���������� ����ó�� �� ���̴�.
select * from DBRAIN_ROAD.TB_INSR007_IFs where 1 = 1 and RCPTN_LINK_TRAN_ID = 'IF_R_INSR_001_CPS_20220124140750864_2952'; -- ��������ó������۽�  / ���ʰ��Ǵ� insert �ȵ�     


-- ���� 200 ���̺�� 007 ���̺��� ������ ���ٸ� ���� �߸� �־��ų� ��극�� �ҽ��� ������ �־ ������ �߻����� ���̴�.
-- ������ ������ �پ��ϰ� ������ �ʹ� ���� ������ ��극�ο��� ����ϴ� ���� �޼����� �������� ������ �м��ϰų� ��극�� ���� ������� ���� �ؾ� �Ѵ�.




    select *
     from PM_ROD_OCPF_LVR_REQ
     where  epno = '0195221361079704982'
     ;


-- ¡���������̺�
-- ������ �Է� �ߴ� LINK_TRAN_ID�� �־��ش�.
-- PR_ST_CD �� �����ڵ��̴�. 11 ���ʰ��� . ������ ������� ��Ҹ� �߱� ������ ���°��� 11�� �־��ش�.     
-- �����ϴ� Į���� ������ �׻� ������� �����ش�.
UPDATE PM_ROD_OCPF_LVR_REQ 
   SET 
	TRAN_ID = 'IF_R_INSR_001_CPS_20220124142251741_2953',  -- tran_id IF_R_INSR_001_CPS_20220117140050413_2505
	PR_ST_CD = '11'  -- �����ڵ�  22
 where EPNO = '0195221361079704982'
;     


SELECT *
  FROM RM_DECIDE_COLLECTION_HIST
 WHERE PERMIT_NO = 'ȭ��2013-15'
   and STD_YY = '2020' and epay_no ='0195221361079704982' order by cnt desc
;


-- ��극�ο� ������� ��ҿ� ���γ�¥���� ó���� �����Ƿ� ��극�������̷� ���̺� �����͸� �߰����ش�.
-- 1. EPAY_NO�� �Է��Ѵ�.
-- 2. CNT��  �������ѹ��̴�. ���� SELECT������ ��ȸ �� ������ ������ ������ �ѹ��� �Է����ش�. 
-- 3. PRTDT �� SENDDT�� �۾� ���� ��¥�� ���� ����ڿ� ���� �� �Է��Ѵ�.
-- 4. PAY_LIMIT_DATE �� ���α����̴�.
-- 5. LASTMARK �� ���°��̴�. ������ ���������Ҹ� �߱� ������ 10(���ʰ���)�� �Է��Ѵ�.
-- 6. ������ �Է��ߴ� LINK_TRAN_ID�� �Է��Ѵ�.
-- 7. WHERE���� CNT���� SELECT ������ ���� ���� ������ CNT�� �־��ش�. ���� �ֽ��� ROW�� �����ϰڴٴ� �ǹ��̴�.
          INSERT INTO RM_DECIDE_COLLECTION_HIST(
              EPAY_NO
              ,GUBUN
              ,CNT
              ,PRTDT
              ,PAY_LIMIT_DATE
              ,SENDYN
              ,SENDDT
              ,SUM_AMT
              ,USE_AMT
              ,VAT_AMT
              ,INTEREST_AMT
              ,ADDAMT
              ,ADDCNT
              ,LASTMARK
              ,LASTMARK2
              ,VIRTUALACCOUNT
              ,REMARKCD
              ,MAILNO
              ,RECEIVEDT
              ,RETURNDT
              ,PUBLISH
              ,PUBLISHDT
              ,U_LOGID
              ,RETURNGUBUN
              ,RETURNINDT
              ,PRINTCNT
              ,PRINTDT
              ,TRAN_ID
              ,LINK_DEAL_SEQ
              ,TRAN_GUBUN
              ,PERMIT_NO
              ,STD_YY
              ,SEQ_NO ,ON_DOC_SEQ ,COLLECT_SEQ ,U_DATE
            )
  SELECT '0195221361079704982' /*EPAY_NO */
          ,GUBUN
          ,3 --  cnt  *2
          ,'20220124'  -- �߱����� (���ϳ�¥�� ���� ����ڰ� ���������� ����)  *20220117
          ,'20220125'  -- ���α��� (����ڿ��� ����)  *20220214
          ,SENDYN
          ,'20220124'  -- �������� (���ϳ�¥�� ���� ����ڰ� ���������� ����) *20220117
          ,SUM_AMT
          ,USE_AMT
          ,VAT_AMT
          ,INTEREST_AMT
          ,ADDAMT
          ,ADDCNT
          ,'10' /*LASTMARK*/  --�����ڵ� ���ʰ��� : 10, ������� : 41, �߰������ : 42    *41
          ,'9' /*LASTMARK2*/  --�����ֱ��� row : 9, �����ǰ� : 0
          ,VIRTUALACCOUNT
          ,REMARKCD
          ,MAILNO
          ,RECEIVEDT
          ,RETURNDT
          ,PUBLISH
          ,PUBLISHDT
          ,U_LOGID
          ,RETURNGUBUN
          ,RETURNINDT
          ,PRINTCNT
          ,PRINTDT
          ,'IF_R_INSR_001_CPS_20220124142251741_2953' /*TRAN_ID  001���̺��� �Ͱ� ����*/ -- IF_R_INSR_001_CPS_20220117140050413_2505
          ,LINK_DEAL_SEQ
          ,TRAN_GUBUN
          ,PERMIT_NO
          ,STD_YY
          ,SEQ_NO 
          ,ON_DOC_SEQ 
          ,COLLECT_SEQ
          ,SYSDATE
  FROM  RM_DECIDE_COLLECTION_HIST
  WHERE EPAY_NO = '0195221361079704982'
    and cnt = 2
  ;

           
	--������ �� LASTMARK2 0���� ������Ʈ
	-- LASTMARK2�� 9�� ���� ������ ROW�� ���� �ֽ��� ��극������ �����̴�.
	-- ������ �ֽŵ����͸� INSERT�� �߱⶧���� ���� LASTMARK2�� 9�� ���� ������ ���� 0���� UPDATE �ؾ� �Ѵ�.
           UPDATE RM_DECIDE_COLLECTION_HIST 
        SET  LASTMARK2 = '0', LASTMARK='41'  -- LASTMARK2 = '9'
      where EPAY_NO = '0195221361079704982'
        and cnt = '2'
        ;

   --������ ����
        select *
        from RM_POST_DCOLLECTION
        where  EPAY_NO = '0195221361079704982'
        ;
        
        

-- ������ �߼� �̷� ������ �����Ѵ�.
-- 1.PAY_LIMIT_DATE ���α��� ����
-- 2. LINK_TRAN_ID ����
-- 3. SENDRESULT 0�̸� ������ �̹߼� ����, 1�̸� ������ �߼۵� ����   0���� �־�� �������߼ۿ�û ����Ʈ�� ���´�.
-- 4. ADDAMT �� ADDCNT�� ������ ���������Ҹ� �߱� ������ �Ѵ� 0���� �����Ѵ�.       
          UPDATE RM_POST_DCOLLECTION 
        SET PAY_LIMIT_DATE = '20220125'  -- �� �� �� ��  * 20220214
	     , TRAN_ID = 'IF_R_INSR_001_CPS_20220124142251741_2953'  -- tran_id 001���̺�� ���� * IF_R_INSR_001_CPS_20220117140050413_2505
	     , sendresult = '0'  -- ���۰������   ���ۻ��� : 1, �����ۻ��� : 0
	     , state = '11'  -- 22
	     , ADDAMT = '0'
	     , ADDCNT= '0'
      where EPAY_NO = '0195221361079704982' 
        ;


-- ���ǰ� ���� ����
        select *
        from RM_STATUS_T
        where EPAY_NO = '0195221361079704982'
        ;
        
        
-- ���� ���� ���̺��̴�.
-- BEFOR_STATE �� ������ ���°��� �ִ´�.
-- STATE ������ ���°��̴�. ���������Ҹ� �߱� ������ �翬�� ���ʰ��ǰ� �Ǿ�� �Ѵ�. 11�� �Է��Ѵ�.
UPDATE RM_STATUS_T 
   SET STATE = '11'  -- ���ǻ���  ���ʰ��� : 11, ������� : 22, �߰������ : 16  * 22
       , BEFOR_STATE = '22' -- ������ ����  ¡�����ǿ�û���� :  02, �����û : 12, �߰����û : 15  * 11
 where EPAY_NO = '0195221361079704982'
;

	   
-- ��
   
 