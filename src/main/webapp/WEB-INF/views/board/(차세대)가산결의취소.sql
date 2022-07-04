-- 가산결의 취소 
-- 가산결의된 해당월(마감전)에만 가능 , 마감이 지났다면 사용자가 직접 결의 취소 후 다시 디브레인전송을 통해 최초결의로 만들어주어야 한다.


--가산결의 취소 후 납부날짜변경 
  
  
select * from PM_ROD_OCPF_LVR_REQ where 1 = 1
and per_no in ('수2607') -- 허가번호
and sr_yr = '2021' -- 부과년도
; 


select *
  from RM_DECIDE_COLLECTION_HIST
 where EPAY_NO = '0195221361079704982'
                         ; 
   


-- 해당 가산건의 링크트랜아이디를 조회한다.
-- BPT_AMT(납기내 금액)과 ADD_AMT(가산금)을 확인 
-- INFRM_RCPT_DIV_CD = C 이며  RS_TY_CD = 130인 건이 가산결의건이다.
select a.BPT_AMT, a.ADD_AMT ,a.* 
  from DBRAIN_ROAD.TB_INSR001_IFR a
 where a.EPAY_NO = '0195211361079704655'
;

-- 새로운 링크트랜아이디를 생성한다.
SELECT 'IF_R_INSR_001_CPS_' ||TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSSSS')||'_' || LTRIM(TO_CHAR( TOBE_TRAN_ID_SEQ.NEXTVAL,'0000')) 
  FROM DUAL
;

-- 새로 생성한 링크트랜아이디만 SELECT 문에 입력한다. 나머지는 변경할 필요 없다.
-- WHERE절에 EPAY_NO(전자납부번호)를 입력 후 , 해당 가산건의 링크트랜아이디를 입력한다. 해당 가산건 확인 방법은 위에 설명 되어 있다.
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
 	    INFRM_DATA_PRCS_STAT_CD /*MTR_DEAL_STAT_CD*/,	  CCRD_PAY_PSB_YN /*CARD_PAY_PSB_YN*/,  		 RL_PAYR_RNM_NO_ENCRP /*RL_PAYR_RNNO*/,LINK_PRCS_YR /*연계처리년도*/     )  
		--SAY_CD /*세부사업코드*/,                          	  EXE_UNIT_CD /*집행단위코드*/                       ) 
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
 	    INFRM_DATA_PRCS_STAT_CD /*MTR_DEAL_STAT_CD*/,	  CCRD_PAY_PSB_YN /*CARD_PAY_PSB_YN*/,  		 RL_PAYR_RNM_NO_ENCRP /*RL_PAYR_RNNO*/,LINK_PRCS_YR /*연계처리년도*/      
		--SAY_CD /*세부사업코드*/,                          	  EXE_UNIT_CD /*집행단위코드*/                       ) 
FROM DBRAIN_ROAD.TB_INSR001_IFR
WHERE EPAY_NO = '0195221361079704982' -- 전자납부번호
AND LINK_TRAN_ID = 'IF_R_INSR_001_CPS_20220117140050413_2505'; --해당 가산건의 링크트랜아이디.



-- 위에서 INSERT 할 때 입력했던 새로 생성한 링크트랜아이디를 200 테이블에도 INSERT 해야 한다.
-- 링크트랜아이디만 변경 후 INSERT 한다. 
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

-- 위에서 INSERT 후 1분이 지난 후에, 200테이블에 입력했던 새로 생성한 링크트랜아이디로 조회시 LINK_ERR_MSG 칼럼에 'NO ERROR'가 입력되었다면 1단계 정상처리 된 것이다.
/*****/SELECT * FROM DBRAIN_ROAD.TB_IFTI200 where 1 = 1 and LINK_TRAN_ID = 'IF_R_INSR_001_CPS_20220124140750864_2952';

-- 2단계로 007 테이블에 링크트랜아이디를 입력하고 INFRM_LINK_PRCS_STAT_NM 칼럼에 '정상적으로 처리되었습니다' 라는 메세지가 있다면 최종적으로 정상처리 된 것이다.
select * from DBRAIN_ROAD.TB_INSR007_IFs where 1 = 1 and RCPTN_LINK_TRAN_ID = 'IF_R_INSR_001_CPS_20220124140750864_2952'; -- 수납정산처리결과송신  / 최초결의는 insert 안됨     


-- 만약 200 테이블과 007 테이블에서 에러가 났다면 값을 잘못 넣었거나 디브레인 소스에 문제가 있어서 에러가 발생했을 것이다.
-- 에러의 종류는 다양하고 변수가 너무 많기 때문에 디브레인에서 출력하는 에러 메세지를 바탕으로 원인을 분석하거나 디브레인 수입 담당으로 연락 해야 한다.




-- 가산결의취소 후 반드신 납부날짜변경
-- 아래부터는 납부날짜 변경하는 쿼리    
    
    
    
  

--* 작업 방법
-- 결의정보
SELECT *
  FROM RM_DECIDE_COLLECTION_HIST
 WHERE PERMIT_NO = '수2607'
  and std_yy='2021' order by cnt desc
;


--FGO_CD(징수관계좌)데이터 필요. 허가번호 넣고 검색 
sELECT * 
  FROM PM_CLPC_CD
 WHERE CD_VL3='CLCTR_FGO_CD'
   AND CD_VL2=(SELECT orcd FROM  PM_RDOC_PMRG  WHERE PER_NO='화성2013-15' AND ROWNUM=1); 
 

-- 새로운 LINK_TRAN_ID 생성  
       SELECT 'IF_R_INSR_001_CPS_' ||TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSSSS')||'_' || LTRIM(TO_CHAR( TOBE_TRAN_ID_SEQ.NEXTVAL,'0000')) 
       FROM DUAL
        ;
  


select *
from DBRAIN_ROAD.TB_INSR001_IFR 
where EPAY_NO = '0195211361079704655'
;




-- 1.위에서 새로 생성한 LINK_TRAN_ID로 수정한다.
-- 2.4개 EPAY_NO 수정
-- 3.위에서 조회한 FGO_CD 수정
-- 4.납부기한 수정
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
 	    INFRM_DATA_PRCS_STAT_CD /*MTR_DEAL_STAT_CD*/,	  CCRD_PAY_PSB_YN /*CARD_PAY_PSB_YN*/,  		 RL_PAYR_RNM_NO_ENCRP /*RL_PAYR_RNNO*/,LINK_PRCS_YR /*연계처리년도*/     )  
		--SAY_CD /*세부사업코드*/,                          	  EXE_UNIT_CD /*집행단위코드*/                       ) 
SELECT  /*트랜id*/
		'IF_R_INSR_001_CPS_20220124142251741_2953', 		1,											systimestamp,
		'0195221361079704982', /*전자납부번호*/					'U',										'110',								'41010301',
		( SELECT COUNT(*) +1 FROM DBRAIN_ROAD.TB_INSR001_IFR WHERE EPAY_NO= '0195221361079704982' ),/*BUL_DGR , EPAY_NO 수정*/
		0,									  				'095',										'214',								'01',
		'12201324',/*FGO_CD*/								'11',										'51',								'511',
		'000',											  	'0000',										'0000',							    '0000',
		'0000',										        NPAQ700.PAY_DIV_CD,							NPAQ700.CLT_RNM_NO_ENCRP,			NPAQ700.PAYR_NM,
		NPAQ700.PAYR_ZIP_NO,								NPAQ700.PAYR_ADDR,							NPAQ700.PAYR_TELNO,					'B',
		TO_CHAR(SYSDATE, 'YYYYMMDD'),						TO_CHAR(SYSDATE, 'YYYYMMDD'),/*결의일자*/		'20220125',/*납부기한*/					NPAQ710.PAY_AMT+NPAQ710.VLA_TAX+NPAQ710.PAY_INT_AMT,/*총금액*/
		0,/*가산금액*/											'A',										NPAQ700.LEVY_GRND_DES,				NPAQ700.YLD_GRND_DES1,
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



-- LINK_TRAN_ID 수정
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

-- 위에서 INSERT 후 1분이 지난 후에, 200테이블에 입력했던 새로 생성한 링크트랜아이디로 조회시 LINK_ERR_MSG 칼럼에 'NO ERROR'가 입력되었다면 1단계 정상처리 된 것이다.
/*****/SELECT * FROM DBRAIN_ROAD.TB_IFTI200 where 1 = 1 and LINK_TRAN_ID = 'IF_R_INSR_001_CPS_20220124140750864_2952';

-- 2단계로 007 테이블에 링크트랜아이디를 입력하고 INFRM_LINK_PRCS_STAT_NM 칼럼에 '정상적으로 처리되었습니다' 라는 메세지가 있다면 최종적으로 정상처리 된 것이다.
select * from DBRAIN_ROAD.TB_INSR007_IFs where 1 = 1 and RCPTN_LINK_TRAN_ID = 'IF_R_INSR_001_CPS_20220124140750864_2952'; -- 수납정산처리결과송신  / 최초결의는 insert 안됨     


-- 만약 200 테이블과 007 테이블에서 에러가 났다면 값을 잘못 넣었거나 디브레인 소스에 문제가 있어서 에러가 발생했을 것이다.
-- 에러의 종류는 다양하고 변수가 너무 많기 때문에 디브레인에서 출력하는 에러 메세지를 바탕으로 원인을 분석하거나 디브레인 수입 담당으로 연락 해야 한다.




    select *
     from PM_ROD_OCPF_LVR_REQ
     where  epno = '0195221361079704982'
     ;


-- 징수결의테이블
-- 위에서 입력 했던 LINK_TRAN_ID를 넣어준다.
-- PR_ST_CD 는 상태코드이다. 11 최초결의 . 위에서 가산결의 취소를 했기 때문에 상태값을 11로 넣어준다.     
-- 수정하는 칼럼값 옆에는 항상 백업값을 적어준다.
UPDATE PM_ROD_OCPF_LVR_REQ 
   SET 
	TRAN_ID = 'IF_R_INSR_001_CPS_20220124142251741_2953',  -- tran_id IF_R_INSR_001_CPS_20220117140050413_2505
	PR_ST_CD = '11'  -- 상태코드  22
 where EPNO = '0195221361079704982'
;     


SELECT *
  FROM RM_DECIDE_COLLECTION_HIST
 WHERE PERMIT_NO = '화성2013-15'
   and STD_YY = '2020' and epay_no ='0195221361079704982' order by cnt desc
;


-- 디브레인에 가산결의 취소와 납부날짜변경 처리를 했으므로 디브레인전송이력 테이블에 데이터를 추가해준다.
-- 1. EPAY_NO를 입력한다.
-- 2. CNT는  시퀀스넘버이다. 위의 SELECT문으로 조회 후 다음에 생성될 시퀀스 넘버를 입력해준다. 
-- 3. PRTDT 와 SENDDT는 작업 당일 날짜로 할지 사용자와 상의 후 입력한다.
-- 4. PAY_LIMIT_DATE 는 납부기일이다.
-- 5. LASTMARK 는 상태값이다. 위에서 가산결의취소를 했기 때문에 10(최초결의)로 입력한다.
-- 6. 위에서 입력했던 LINK_TRAN_ID를 입력한다.
-- 7. WHERE절의 CNT에는 SELECT 했을때 가장 높은 숫자의 CNT를 넣어준다. 가장 최신의 ROW를 참고하겠다는 의미이다.
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
          ,'20220124'  -- 발급일자 (당일날짜로 할지 사용자가 지정할지는 문의)  *20220117
          ,'20220125'  -- 납부기한 (사용자에게 문의)  *20220214
          ,SENDYN
          ,'20220124'  -- 전송일자 (당일날짜로 할지 사용자가 지정할지는 문의) *20220117
          ,SUM_AMT
          ,USE_AMT
          ,VAT_AMT
          ,INTEREST_AMT
          ,ADDAMT
          ,ADDCNT
          ,'10' /*LASTMARK*/  --상태코드 최초결의 : 10, 가산결의 : 41, 중가산결의 : 42    *41
          ,'9' /*LASTMARK2*/  --가장최근의 row : 9, 과거의것 : 0
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
          ,'IF_R_INSR_001_CPS_20220124142251741_2953' /*TRAN_ID  001테이블의 것과 동일*/ -- IF_R_INSR_001_CPS_20220117140050413_2505
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

           
	--과거의 건 LASTMARK2 0으로 업데이트
	-- LASTMARK2는 9의 값을 가지는 ROW가 가장 최신의 디브레인전송 내역이다.
	-- 위에서 최신데이터를 INSERT를 했기때문에 원래 LASTMARK2가 9인 값을 가졌던 값은 0으로 UPDATE 해야 한다.
           UPDATE RM_DECIDE_COLLECTION_HIST 
        SET  LASTMARK2 = '0', LASTMARK='41'  -- LASTMARK2 = '9'
      where EPAY_NO = '0195221361079704982'
        and cnt = '2'
        ;

   --고지서 수정
        select *
        from RM_POST_DCOLLECTION
        where  EPAY_NO = '0195221361079704982'
        ;
        
        

-- 고지서 발송 이력 정보를 수정한다.
-- 1.PAY_LIMIT_DATE 납부기한 수정
-- 2. LINK_TRAN_ID 수정
-- 3. SENDRESULT 0이면 고지서 미발송 상태, 1이면 고지서 발송된 상태   0으로 넣어야 고지서발송요청 리스트에 나온다.
-- 4. ADDAMT 와 ADDCNT는 위에서 가산결의취소를 했기 때문에 둘다 0으로 설정한다.       
          UPDATE RM_POST_DCOLLECTION 
        SET PAY_LIMIT_DATE = '20220125'  -- 납 부 기 한  * 20220214
	     , TRAN_ID = 'IF_R_INSR_001_CPS_20220124142251741_2953'  -- tran_id 001테이블과 동일 * IF_R_INSR_001_CPS_20220117140050413_2505
	     , sendresult = '0'  -- 전송결과상태   전송상태 : 1, 미전송상태 : 0
	     , state = '11'  -- 22
	     , ADDAMT = '0'
	     , ADDCNT= '0'
      where EPAY_NO = '0195221361079704982' 
        ;


-- 결의건 상태 수정
        select *
        from RM_STATUS_T
        where EPAY_NO = '0195221361079704982'
        ;
        
        
-- 결의 상태 테이블이다.
-- BEFOR_STATE 는 직전의 상태값을 넣는다.
-- STATE 현재의 상태값이다. 가산결의취소를 했기 때문에 당연히 최초결의가 되어야 한다. 11로 입력한다.
UPDATE RM_STATUS_T 
   SET STATE = '11'  -- 결의상태  최초결의 : 11, 가산결의 : 22, 중가산결의 : 16  * 22
       , BEFOR_STATE = '22' -- 결의전 상태  징수결의요청상태 :  02, 가산요청 : 12, 중가산요청 : 15  * 11
 where EPAY_NO = '0195221361079704982'
;

	   
-- 끝
   
 